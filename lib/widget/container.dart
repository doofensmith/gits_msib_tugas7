import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    this.child,
    this.height,
    this.width,
    this.color,
    this.padding,
    this.borderRadius,
    this.boxShadow,
    this.margin,
  });

  final Widget? child;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        boxShadow: boxShadow,
        borderRadius: borderRadius,
      ),
      child: child,
      margin: margin,
    );
  }
}
