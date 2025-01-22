import 'package:bilytica_task/utils/app_colors.dart';
import 'package:bilytica_task/utils/size_config.dart';
import 'package:bilytica_task/views/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class LabelTextWidget extends StatelessWidget {
  const LabelTextWidget(
    this.text, {
    super.key,
    this.textColor,
    this.fontSize,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start,
  });

  final double? fontSize;
  final FontWeight fontWeight;
  final String text;
  final TextAlign textAlign;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return CustomTextWidget(
      text,
      fontSize: fontSize ?? SizeConfig.font14(),
      fontWeight: fontWeight,
      color: textColor ?? AppColors.textDarkColor,
      textAlign: textAlign,
    );
  }
}
