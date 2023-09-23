import 'dart:io';

import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/helper/navigator_help.dart';
import 'package:edlerd_project/screens/upload_picture/ui/card_view.dart';
import 'package:edlerd_project/widget/custom_app_bar.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:edlerd_project/widget/primary_button.dart';
import 'package:flutter/material.dart';

class UploadPicure extends StatelessWidget {
  String path;
  UploadPicure({super.key, required this.path});

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
                      child: Image.file(File(path))),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                MyText(text: 'Picture ready to be saved')
              ],
            )),
          ),
          Positioned(
              left: 10.0,
              right: 10.0,
              bottom: 10.0,
              child: PrimaryButton(
                height: 50.0,
                cornerRadius: 25.0,
                color: redColor,
                onPressed: () {
                  navigatorPush(context, const CardView());
                },
                btnText: 'Save & Continue',
              ))
        ],
      ),
    );
  }
}
