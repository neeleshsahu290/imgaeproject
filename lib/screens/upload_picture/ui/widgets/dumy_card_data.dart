import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/constants/assets.dart';
import 'package:edlerd_project/widget/custom_container.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DummyDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          CustomContainer(
            color: white,
            height: 80.0,
            radius: 80.0,
            width: 80.0,
            horizontalPadding: 0.0,
            verticalPadding: 0.0,
            hasBorder: true,
            borderColor: white,
            child: Image.asset(profileImg),
          ),
          SizedBox(
            height: 15.0,
          ),
          MyText(text: "Alexendria", fontSize: 20.sp),
          SizedBox(
            height: 15.0,
          ),
          MyText(
            text: "Panner bvalley",
            fontSize: 15.sp,
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }
}
