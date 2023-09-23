import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class Ripple extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  final Color rippleSplashColor;
  final double rippleRadius;

  const Ripple({
    Key? key,
    this.child,
    this.onTap,
    this.rippleSplashColor = rippleColor,
    this.rippleRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: rippleSplashColor,
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(rippleRadius),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
