// ignore_for_file: use_build_context_synchronously

import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/constants/assets.dart';
import 'package:edlerd_project/helper/navigator_help.dart';
import 'package:edlerd_project/screens/home/widget/image_select_sheet.dart';
import 'package:edlerd_project/screens/upload_picture/ui/upload_picture.dart';
import 'package:edlerd_project/widget/custom_app_bar.dart';
import 'package:edlerd_project/widget/custom_container.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  
  // select image and Crop
  selectImage({bool isCamera = false}) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        maxHeight: 400,
        maxWidth: 400,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Edit Photo',
              toolbarColor: white,
              toolbarWidgetColor: Colors.black,
              initAspectRatio: CropAspectRatioPreset.original,
              showCropGrid: true,
              lockAspectRatio: false),
        ],
      );
      if (croppedFile != null) {
        navigatorPush(
            context,
            UploadPicure(
              file: croppedFile,
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleColor: commonTextColor,
        isTitleCenter: false,
        title: "Change design",
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomContainer(
              onClick: () async {
                var value = await imageSelectBottomSheet(context);

                if (value != null) {
                  selectImage(isCamera: value);
                }
              },
              horizontalPadding: 0.0,
              verticalPadding: 5.0,
              radius: 16.0,
              color: const Color(0xFFBBDEFB),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 30.0),
                    child: SvgPicture.asset(magicUpIcon),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: MyText(
                      text: "Upload Picture",
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
                    child: SvgPicture.asset(magicUpIcon),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
