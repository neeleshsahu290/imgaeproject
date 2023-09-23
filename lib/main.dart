import 'dart:async';
import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/screens/home/ui/home_screen.dart';
import 'package:edlerd_project/screens/upload_picture/ui/crop_img.dart';
import 'package:edlerd_project/util/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // Status bar brightness (optional)

    statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    statusBarBrightness: Brightness.dark, // For iOS (dark icons)
  ));

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //message notification
  // FirebaseMessaging.onBackgroundMessage(messageHandler);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // await GetStorage.init(localStorageContainer);
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await setupServiceLocator();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
  // Future.delayed(const Duration(seconds: 1)).then(
  //   (value) => FlutterNativeSplash.remove(),
  // );
}

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: ((context, orientation, screenType) => MaterialApp(
            navigatorKey: NavigationService.navigatorKey,
            title: 'Better You',
            scaffoldMessengerKey: snackbarKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: 'Poppins',
                primarySwatch: colorPrimaryAccent,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                brightness: Brightness.light,
                primaryColor: colorPrimary,
                progressIndicatorTheme:
                    const ProgressIndicatorThemeData(color: redColor),
                // pageTransitionsTheme: const PageTransitionsTheme(
                //   builders: {
                //     TargetPlatform.android: CustomTransitionBuilder(),
                //   },
                // ),
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  color: Colors.deepPurpleAccent,
                  foregroundColor: Colors.black,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.light,
                  ),
                )),
            home: const HomeScreen(),
            // home: SessionManager.getBool(isLoggedIn)
            //     ? const DashbordLoadingScreen()
            //     : const IntroScreen(),
          )),
    );
  }
}