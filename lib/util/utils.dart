


import 'dart:io';
import 'dart:typed_data';

// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';



import 'package:edlerd_project/main.dart';
import 'package:edlerd_project/widget/snackbar_widget.dart';
import 'package:flutter/material.dart';

bool isSuccess(int statusCode) {
  return statusCode == 200 || statusCode == 201 || statusCode == 202;
}



TValue? case2<TOptionType, TValue>(
  TOptionType selectedOption,
  Map<TOptionType, TValue> branches, [
  TValue? defaultValue,
]) {
  if (!branches.containsKey(selectedOption)) {
    return defaultValue;
  }

  return branches[selectedOption];
}


class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}


showSnackBar({required var message}) {
  final SnackBar snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    behavior: SnackBarBehavior.floating,
    content: SnackbarWidget(msgTitle: "Msg Recieved",darkColor:const Color(0xFF5691E9) ,lightColor:const Color.fromARGB(255, 35, 91, 175) ,message: message.toString()),
  );
  snackbarKey.currentState?.showSnackBar(snackBar);
}
showErrorSnackBar({required var message}) {
  final SnackBar snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    behavior: SnackBarBehavior.floating,
    content: SnackbarWidget(msgTitle: "Oh snap!",darkColor:const Color.fromARGB(255, 190, 34, 22) ,lightColor:const Color.fromARGB(255, 228, 83, 72) ,message: message.toString()),
  );
  snackbarKey.currentState?.showSnackBar(snackBar);
}

//save unit8List format image to image file and return Url
saveUint8ListAsImageFile(Uint8List uint8List) async {
  try {
    final tempdir = await getTemporaryDirectory();

    final File imageFile = File('${tempdir.path}/image2.jpg');
    await imageFile.writeAsBytes(uint8List);
    return imageFile;
  } catch (e) {
    return null;
  }
}
