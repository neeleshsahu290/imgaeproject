// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/provider/crop_image_provider.dart';
import 'package:edlerd_project/screens/home/widget/image_select_sheet.dart';
import 'package:edlerd_project/widget/custom_app_bar.dart';
import 'package:edlerd_project/widget/custom_image_view.dart';
import 'package:edlerd_project/widget/custom_progress_indiactor.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:edlerd_project/widget/primary_button.dart';
import 'package:edlerd_project/widget/progress_dilog.dart';
import 'package:flutter/material.dart';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final cropImgProvider =
    ChangeNotifierProvider.autoDispose<CropImageProvider>((ref) {
  return CropImageProvider();
});

// ignore: must_be_immutable
class CropImageScreen extends ConsumerStatefulWidget {
  String imgUrl;

  CropImageScreen({super.key, required this.imgUrl});

  @override
  _CropImageState createState() => _CropImageState();
}

class _CropImageState extends ConsumerState<CropImageScreen> {
  final _cropController = CropController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(cropImgProvider).loadAllImages(widget.imgUrl);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        var url = ref.read(cropImgProvider).imgUrl;

        Navigator.pop(context, url);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: CustomAppBar(
          isTitleCenter: false,
          title: "Custom Image Card",
          actionsList: [
            Tooltip(
              message: "Back",
              child: IconButton(
                onPressed: () {
                  var url = ref.read(cropImgProvider).imgUrl;
                  log(url.toString());

                  Navigator.pop(context, url);
                },
                icon: const Icon(
                  Icons.close,
                  size: 18.0,
                  color: Colors.black,
                ),
                color: white,
              ),
            )
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                ref.watch(cropImgProvider).isCroped == false
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () async {
                            var value = await imageSelectSheet(context);

                            if (value != null) {
                              ref
                                  .read(cropImgProvider)
                                  .galleryImages(isCamera: value);
                            }
                            // }
                          },
                          child: DottedBorder(
                            radius: const Radius.circular(8.0),
                            color: blueColor,
                            borderType: BorderType.RRect,
                            strokeWidth: 1,
                            child: Container(
                              color: const Color.fromARGB(255, 223, 240, 255),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 14.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.image,
                                        color: blueColor,
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      MyText(
                                          text:
                                              'Change picture here and adjust')
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Expanded(
                  child: ref.watch(cropImgProvider).isCroped == false
                      ? (ref.watch(cropImgProvider).imageData != null
                          ? Crop(
                              controller: _cropController,
                              image: ref.watch(cropImgProvider).imageData!,
                              onCropped: (croppedData) async {
                                var file =
                                    await saveUint8ListAsImageFile(croppedData);
                                await ref
                                    .read(cropImgProvider)
                                    .uploadImageData(file: file);

                                Navigator.pop(context);
                              },
                              progressIndicator: CustomProgressIndicator(),
                              onStatusChanged: (status) {
                                ref.read(cropImgProvider).changeState(status);
                              },
                              initialSize: 0.5,
                              maskColor: Colors.white,
                              cornerDotBuilder: (size, edgeAlignment) =>
                                  const SizedBox.shrink(),
                              interactive: true,
                              fixArea: true,
                              radius: 12,
                              initialAreaBuilder: (rect) {
                                return Rect.fromLTRB(
                                  rect.left + 16,
                                  rect.top + 16,
                                  rect.right - 16,
                                  rect.bottom - 16,
                                );
                              },
                            )
                          : Center(child: CustomProgressIndicator()))
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomImageView(
                              cornerRadius: 16.0,
                              height: double.infinity,
                              width: double.infinity,
                              url: ref.watch(cropImgProvider).imgUrl ?? "",
                              fallBackText: "fallBackText"),
                        ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ref.watch(cropImgProvider).isCroped == false
                    ? PrimaryButton(
                        height: 50.0,
                        cornerRadius: 25.0,
                        color: redColor,
                        onPressed: () {
                          progressDialog(context, text: "Uploading");

                          _cropController.crop();
                        },
                        btnText: 'Save ',
                      )
                    : const SizedBox(
                        height: 120.0,
                      ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

saveUint8ListAsImageFile(Uint8List uint8List) async {
  try {
    final tempdir = await getTemporaryDirectory();

    final File imageFile = File('${tempdir.path}/image2.jpg');
    await imageFile.writeAsBytes(uint8List);
    return imageFile;
  } catch (e) {
    return null;
  }
}
