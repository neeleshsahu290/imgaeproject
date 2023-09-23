import 'package:dotted_border/dotted_border.dart';
import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/provider/crop_image_provider.dart';
import 'package:edlerd_project/screens/home/widget/image_select_sheet.dart';
import 'package:edlerd_project/widget/custom_app_bar.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:edlerd_project/widget/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cropImgProvider =
    ChangeNotifierProvider.autoDispose<CropImageProvider>((ref) {
  return CropImageProvider();
});

class CropSampleMain extends StatelessWidget {
  String imgUrl;
  CropSampleMain({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isTitleCenter: false,
        title: "Custom Image Card",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: CropSample(imgUrl: imgUrl),
    );
  }
}

class CropSample extends ConsumerStatefulWidget {
  String imgUrl;

  CropSample({super.key, required this.imgUrl});

  @override
  _CropSampleState createState() => _CropSampleState();
}

class _CropSampleState extends ConsumerState<CropSample> {
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
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Visibility(
          visible: !ref.watch(cropImgProvider).loadingImage &&
              !ref.watch(cropImgProvider).isCropping,
          replacement: const CircularProgressIndicator(),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () async {
                    var value = await imageSelectSheet(context);

                    if (value != null) {
                      ref.read(cropImgProvider).galleryImages(isCamera: value);
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
                              MyText(text: 'Change picture here and adjust')
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    if (ref.watch(cropImgProvider).imageData != null) ...[
                      Crop(
                        controller: _cropController,
                        image: ref.watch(cropImgProvider).imageData!,
                        onCropped: (croppedData) {
                          // setState(() {
                          //   _croppedData = croppedData;
                          //   _isCropping = false;
                          // });
                        },
                        //  withCircleUi: _isCircleUi,
                        onStatusChanged: (status) => setState(() {
                          // _statusText = <CropStatus, String>{
                          //       CropStatus.nothing: 'Crop has no image data',
                          //       CropStatus.loading:
                          //           'Crop is now loading given image',
                          //       CropStatus.ready: 'Crop is now ready!',
                          //       CropStatus.cropping:
                          //           'Crop is now cropping image',
                          //     }[status] ??
                          //     '';
                        }),
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
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              PrimaryButton(
                height: 50.0,
                cornerRadius: 25.0,
                color: redColor,
                onPressed: () {
                  // setState(() {
                  //   _isCropping = true;
                  // });
                  _cropController.crop();
                },
                btnText: 'Save ',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
