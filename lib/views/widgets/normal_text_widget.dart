import 'package:bilytica_task/utils/app_colors.dart';
import 'package:bilytica_task/utils/size_config.dart';
import 'package:bilytica_task/views/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class NormalTextWidget extends StatelessWidget {
  const NormalTextWidget(
    this.text, {
    super.key,
    this.textColor,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.textOverflow = TextOverflow.visible,
    this.fontStyle,
    this.maxLines,
    this.letterSpacing,
  });

  final double? fontSize;
  final FontStyle? fontStyle;
  final FontWeight fontWeight;
  final double? letterSpacing;
  final int? maxLines;
  final String text;
  final TextAlign textAlign;
  final Color? textColor;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return CustomTextWidget(
      text,
      fontSize: fontSize ?? SizeConfig.font14(),
      fontWeight: fontWeight,
      color: textColor ?? AppColors.textDarkColor,
      textAlign: textAlign,
      overflow: textOverflow,
      fontStyle: fontStyle,
      maxLines: maxLines,
      letterSpacing: letterSpacing,
    );
  }
}
