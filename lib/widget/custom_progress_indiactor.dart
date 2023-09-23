import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomProgressIndicator extends StatelessWidget {
  final double? size;
  double? value;
  CustomProgressIndicator({this.size, this.value});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 40.0,
      width: size ?? 40.0,
      child: CircularProgressIndicator(
          strokeWidth: 6.0,
          value: value,
          color: Colors.blueAccent,
          backgroundColor: Colors.grey.shade300),
    );
  }
}
