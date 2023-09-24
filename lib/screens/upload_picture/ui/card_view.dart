import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/helper/navigator_help.dart';
import 'package:edlerd_project/provider/edit_card_provider.dart';
import 'package:edlerd_project/screens/upload_picture/ui/widgets/dumy_card_data.dart';
import 'package:edlerd_project/widget/custom_app_bar.dart';
import 'package:edlerd_project/widget/custom_image_view.dart';
import 'package:edlerd_project/widget/custom_progress_indiactor.dart';
import 'package:edlerd_project/widget/empty_view.dart';
import 'package:edlerd_project/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'edit_card.dart';

final editCardProvider =
    ChangeNotifierProvider.autoDispose<EditCardProvider>((ref) {
  return EditCardProvider();
});

class CardView extends ConsumerStatefulWidget {
  const CardView({super.key});

  @override
  ConsumerState<CardView> createState() => _EditCardState();
}

class _EditCardState extends ConsumerState<CardView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getImgData();
    });
  }

  getImgData({var isRefreshing = false}) async {
    ref.read(editCardProvider).getImageData(isRefreshing: isRefreshing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isTitleCenter: false,
        title: "Artist",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ref.watch(editCardProvider).imageData.when(
            data: ((data) {
              var imgUrl = ref.watch(editCardProvider).imgUrl ?? "";
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomImageView(
                              width: double.infinity,
                              cornerRadius: 20.0,
                              height: 75.h,
                              url: imgUrl,
                              fallBackText: "fallBackText"),
                        ),
                        DummyDate()
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    PrimaryButton(
                      height: 50.0,
                      borderWidth: 2.0,
                      cornerRadius: 25.0,
                      color: white,
                      borderColor: colorPrimary,
                      hasBorder: true,
                      //   width: 2.0,
                      onPressed: () async {
                        var value = await navigatorPush(
                            context,
                            EditCard(
                              imgUrl: imgUrl,
                            ));

                        if (value != null) {
                          ref.read(editCardProvider).setImgUrl(value);
                        }
                      },
                      textColor: colorPrimary,
                      btnText: 'Edit Card',
                    )
                  ],
                ),
              );
            }),
            error: ((error, stackTrace) => ErrorView(
                  message: error.toString(),
                  onReload: () {
                    getImgData(isRefreshing: true);
                  },
                )),
            loading: () => SizedBox(height: double.infinity,width: double.infinity,child: Center(child: CustomProgressIndicator())),
          ),
    );
  }
}
