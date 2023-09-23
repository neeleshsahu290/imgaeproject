import 'package:edlerd_project/helper/navigator_help.dart';
import 'package:edlerd_project/screens/upload_picture/ui/crop_img.dart';
import 'package:edlerd_project/screens/upload_picture/ui/customize_card_screen.dart';
import 'package:edlerd_project/widget/custom_app_bar.dart';
import 'package:edlerd_project/widget/custom_image_view.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:edlerd_project/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/app_color.dart';

// ignore: must_be_immutable
class EditCard extends StatelessWidget {
  String imgUrl;
  EditCard({super.key, required this.imgUrl});

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
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                CustomImageView(
                    width: double.infinity,
                    cornerRadius: 20.0,
                    height: 75.h,
                    url: imgUrl,
                    fallBackText: "fallBackText"),
                Positioned(
                  right: 15.0,
                  top: 15.0,
                  child: PrimaryButton(
                    onPressed: () {
                      navigatorPush(context,  CropSampleMain(imgUrl: imgUrl,));
                    },
                    disablePadding: true,
                    color: white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(children: [
                        const Icon(Icons.edit, color: colorPrimary),
                        const SizedBox(
                          width: 10.0,
                        ),
                        MyText(
                          text: 'Customize',
                          color: colorPrimary,
                        )
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          PrimaryButton(
            height: 50.0,
            cornerRadius: 25.0,
            color: colorPrimary,
            onPressed: () {
              // navigatorPush(context, EditCard());
            },
            textColor: white,
            btnText: 'Save',
          )
        ],
      )),
    );
  }
}
