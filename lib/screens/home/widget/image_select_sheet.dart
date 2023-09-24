import 'package:edlerd_project/widget/bottom_modal_sheet.dart';
import 'package:edlerd_project/widget/custom_container.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

imageSelectSheet(BuildContext context) async {
  return await BottomModalSheet.customChildSheet(
      context,
      Consumer(
          builder: (context, ref, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemSelect(
                        isCamera: false,
                        onClick: () {
                          Navigator.pop(context,false) ;
                        },
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      ItemSelect(
                        isCamera: true,
                        onClick: () {
                          //   Navigator.pop(context);
                          Navigator.pop(context,true) ;
                          //  ref.read(homeScrenProvider).selectImage(isCamera: true);
                        },
                      )
                    ]),
          )));
}

// ignore: must_be_immutable
class ItemSelect extends StatelessWidget {
  bool isCamera = false;
  Function()? onClick;

  ItemSelect({super.key, this.isCamera = false, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          CustomContainer(
            hasBorder: true,
            borderWidth: 0.7,
            child: Icon(
              isCamera ? Icons.camera_alt_rounded : Icons.photo,
              color: Colors.brown,
            ),
          ),
          MyText(text: isCamera ? "Camera" : "Gallery")
        ],
      ),
    );
  }
}
