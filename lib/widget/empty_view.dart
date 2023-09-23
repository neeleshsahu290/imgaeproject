import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/constants/assets.dart';
import 'package:edlerd_project/widget/custom_container.dart';
import 'package:edlerd_project/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'my_text.dart';

// class EmptyView extends StatelessWidget {
//   final String? image;
//   final String? message;
//   const EmptyView({
//     Key? key,
//     this.message = "",
//     this.image,
//     required Function() onReload,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: PhysicalModel(
//       color: white,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CustomContainer(
//             verticalPadding: 10.0,
//             horizontalPadding: 10.0,
//             height: 60.w,
//             width: 60.w,
//             radius: 20.w,
//             child: Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: SvgPicture.asset(
//                 image ?? noDataIcon,
//                 // ignore: deprecated_member_use
//              //   color: Colors.redAccent,
//                 width: double.infinity,
//                 height: double.infinity,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 5.0,
//           ),
//           SizedBox(
//             width: 70.w,
//             child: MyText(
//               text: message ?? "No data Found",
//               fontSize: 17.sp,
//               textAlignment: TextAlign.center,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(
//             height: 15.h,
//           )
//         ],
//       ),
//     ));
//   }
//}

class ErrorView extends StatelessWidget {
  final String? image;
  final String? message;
  final Function()? onReload;
  const ErrorView({
    Key? key,
    this.message = "",
    this.image,
    this.onReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(12),
        color: white,
        elevation: 2.0,
        shadowColor: blueColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomContainer(
              verticalPadding: 10.0,
              horizontalPadding: 10.0,
              height: 50.w,
              width: 50.w,
              radius: 20.w,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SvgPicture.asset(
                  image ?? errorIcon,
                  // ignore: deprecated_member_use
                  // color: Colors.redAccent,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
              width: 70.w,
              child: MyText(
                text: message ?? "No data Found",
                fontSize: 17.sp,
                textAlignment: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            PrimaryButton(
              btnText: "Retry",
              color: Colors.red.shade500,
              onPressed: onReload,
            ),
            const SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    ));
  }
}
