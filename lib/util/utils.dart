






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

