// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/helper/navigator_help.dart';
import 'package:edlerd_project/provider/upload_image_provider.dart';
import 'package:edlerd_project/screens/upload_picture/ui/card_view_screen.dart';
import 'package:edlerd_project/widget/custom_app_bar.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:edlerd_project/widget/primary_button.dart';
import 'package:edlerd_project/widget/progress_dilog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';

final uploadImageProvider =
    ChangeNotifierProvider.autoDispose<UploadImageProvider>((ref) {
  return UploadImageProvider();
});

// ignore: must_be_immutable
class UploadPicure extends StatelessWidget {
  CroppedFile file;
  UploadPicure({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isTitleCenter: false,
        title: "Upload Picuture",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.file(File(file.path))),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                MyText(text: 'Picture ready to be saved')
              ],
            )),
          ),
          Consumer(
              builder: (context, ref, child) => Positioned(
                  left: 10.0,
                  right: 10.0,
                  bottom: 10.0,
                  child: PrimaryButton(
                    height: 50.0,
                    cornerRadius: 25.0,
                    color: redColor,
                    onPressed: () async {
                      progressDialog(context, text: "Uploading");
                      var status = await ref
                          .read(uploadImageProvider)
                          .uploadImageData(file: file);
                      Navigator.pop(context);
                      if (status == true) {
                        navigatorPushReplaceUntil(
                            context, const CardViewScreen());
                      }
                    },
                    btnText: 'Save & Continue',
                  )))
        ],
      ),
    );
  }
}
