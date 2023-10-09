import 'package:flutter/material.dart';

class BottomModalSheet {
  static Future<bool?>? customChildSheet(context, child,
      {isCancelable = true, horizontalPadding = 16.0, verticalPadding = 16.0}) {
    return showModalBottomSheet<bool?>(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: isCancelable,
        enableDrag: isCancelable,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async {
                return isCancelable;
              },
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                              vertical: verticalPadding),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                24.0,
                              ),
                            ),
                          ),
                          child: child),
                    ]),
              ));
        });
  }
}
