import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoldText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontsize;
  const BoldText({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 3,
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
          fontSize: fontsize.sp, color: textColor, fontWeight: FontWeight.bold),
    );
  }
}
