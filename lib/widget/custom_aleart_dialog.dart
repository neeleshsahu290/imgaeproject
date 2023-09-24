import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/widget/custom_container.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:edlerd_project/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<bool?> customAlertDialog({
  required String message,
  required BuildContext context,
  String? assetIcon,
  FontWeight? messageFontWeight,
}) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: assetIcon != null
          ? Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: [
                CustomContainer(
                  margin: const EdgeInsets.all(5.0),
                  verticalPadding: 14.0,
                  horizontalPadding: 14.0,
                  borderWidth: 1.2,
                  color: colorPrimary,
                  borderColor: blackColor,
                  height: 45.0,
                  width: 45.0,
                  radius: 50.0,
                  child: SvgPicture.asset(assetIcon, height: 20.0, width: 20.0),
                ),
              ],
            )
          : null,
      content: Wrap(
        direction: Axis.horizontal,
        children: [
          Container(
              alignment: Alignment.center,
              child: MyText(
                fontSize: 16.sp,
                color: commonTextColorDark,
                fontWeight: messageFontWeight ?? FontWeight.w600,
                text: message.toString(),
                textAlignment: TextAlign.center,
              )),
        ],
      ),
      alignment: Alignment.center,
      actions: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: PrimaryButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  height: 45.0,
                  btnText: 'Cancel',
                  textColor: commonTextColor,
                  disablePadding: true,
                  color: buttonBackgroundGrey,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: PrimaryButton(
                  onPressed: () => Navigator.pop(context, true),
                  height: 45.0,
                  disablePadding: true,
                  btnText: 'confirm',
                  textColor: white,
                  color: colorPrimary,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
