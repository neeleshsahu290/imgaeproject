import 'package:edlerd_project/helper/navigator_help.dart';
import 'package:edlerd_project/screens/upload_picture/ui/crop_img_screen.dart';
import 'package:edlerd_project/screens/upload_picture/widgets/dumy_card_data.dart';
import 'package:edlerd_project/widget/custom_app_bar.dart';
import 'package:edlerd_project/widget/custom_image_view.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:edlerd_project/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/app_color.dart';

final imageProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});

// ignore: must_be_immutable
class EditCard extends ConsumerStatefulWidget {
  String imgUrl;
  EditCard({super.key, required this.imgUrl});

  @override
  ConsumerState<EditCard> createState() => _EditCardState();
}

class _EditCardState extends ConsumerState<EditCard> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(imageProvider.notifier).state = widget.imgUrl;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, ref.read(imageProvider));
        return Future.value(true);
      },
      child: Scaffold(
        appBar: CustomAppBar(
          isTitleCenter: false,
          title: "Custom Image Card",
          onBackPressed: () {
            Navigator.pop(context, ref.read(imageProvider));
          },
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Consumer(
                        builder: (context, ref, child) => CustomImageView(
                            width: double.infinity,
                            cornerRadius: 20.0,
                            height: 75.h,
                            url: ref.watch(imageProvider),
                            fallBackText: ref.watch(imageProvider).toString()),
                      ),
                      const DummyDate()
                    ],
                  ),
                  Positioned(
                    right: 15.0,
                    top: 15.0,
                    child: PrimaryButton(
                      onPressed: () async {
                        var value = await navigatorPush(
                            context,
                            CropImageScreen(
                              imgUrl: widget.imgUrl,
                            ));
                        if (value != null) {
                          ref.read(imageProvider.notifier).state = value;
                        }
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
                Navigator.pop(context, ref.read(imageProvider));

                // navigatorPush(context, EditCard());
              },
              textColor: white,
              btnText: 'Save',
            )
          ],
        )),
      ),
    );
  }
}
