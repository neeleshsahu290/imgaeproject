import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/constants/assets.dart';
import 'package:edlerd_project/provider/home_screen_provider.dart';
import 'package:edlerd_project/screens/home/widget/image_select_sheet.dart';
import 'package:edlerd_project/widget/custom_app_bar.dart';
import 'package:edlerd_project/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final homeScrenProvider =
    ChangeNotifierProvider.autoDispose<HomeScreenProvider>((ref) {
  return HomeScreenProvider();
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(homeScrenProvider).init(context);
    });
    super.initState();
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
            child: GestureDetector(
              onTap: () async {
                var value = await imageSelectSheet(context);

                if (value != null) {
                 

                  ref.read(homeScrenProvider).selectImage(isCamera: value);
                  // }
                }
              },
              child: PhysicalModel(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color(0xFFBBDEFB),
                //elevation: 1.0,
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
            ),
          )
        ],
      )),
    );
  }
}
