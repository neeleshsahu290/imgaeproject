import 'dart:typed_data';

import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/widget/custom_app_bar.dart';
import 'package:edlerd_project/widget/custom_card.dart';
import 'package:edlerd_project/widget/custom_container.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomizeCardScreen extends StatefulWidget {
  const CustomizeCardScreen({super.key});

  @override
  State<CustomizeCardScreen> createState() => _CustomizeCardScreenState();
}

class _CustomizeCardScreenState extends State<CustomizeCardScreen> {
  late CropController _controller;
 Future<Uint8List> _load(String assetName) async {
    final assetData = await rootBundle.load(assetName);
    return assetData.buffer.asUint8List();
  }
  @override
  void initState() {
    super.initState();
    _controller = CropController();
  }

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
          CustomContainer(
            hasBorder: true,
            borderColor: blueColor,
            borderWidth: 0.5,
            color: blueColor,
            child: Row(children: [
              const Icon(
                Icons.image,
                color: blueColor,
              ),
              MyText(text: 'Change picture here and adjust')
            ]),
          ),
  //         SizedBox(
  //           height: 80.w,
  //           width: 80.w,
  //           child: Crop(
  //   image:  , 
  //   controller: _controller,
  //   onCropped: (image) {
  //     // do something with image data 
  //   }
  // ),
  //         ),
        ],
      )),
    );
  }
}
