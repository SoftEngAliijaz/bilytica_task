import 'package:bilytica_task/utils/app_colors.dart';
import 'package:bilytica_task/utils/size_config.dart';
import 'package:bilytica_task/views/widgets/custom_image_widget.dart';
import 'package:bilytica_task/views/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
    this.hintText,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.textAlign = TextAlign.left,
    this.fieldEnabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.isLabelGrey = false,
    this.autoFocus = false,
    this.suffixIconFunction,
    this.suffixIcon,
    this.onChanged,
    this.textFieldFilled = true,
    this.minLines = 1,
    this.asterick,
    this.inputFormatter,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIconColor,
    this.showFocusedColor = true,
  });

  final String? asterick;
  final bool autoFocus;
  final TextEditingController controller;
  final bool fieldEnabled;
  final String? hintText;
  final TextInputAction inputAction;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType inputType;
  final bool isLabelGrey;
  final String label;
  final int? maxLength;
  final int maxLines;
  final int minLines;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final Widget? prefixIcon;
  final bool showFocusedColor;
  final String? suffixIcon;
  final Color? suffixIconColor;
  final Function? suffixIconFunction;
  final TextAlign textAlign;
  final bool? textFieldFilled;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label.isEmpty
            ? SizedBox()
            : LabelTextWidget(
                label,
              ),
        label.isEmpty
            ? SizedBox()
            : SizedBox(
                height: SizeConfig.height6(),
              ),
        TextFormField(
          style: TextStyle(
            color: AppColors.textDarkColor,
            fontSize: SizeConfig.font14(),
          ),
          inputFormatters: inputFormatter,
          enabled: fieldEnabled,
          controller: controller,
          textInputAction: inputAction,
          keyboardType: inputType,
          textAlign: textAlign,
          validator: validator,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          autofocus: autoFocus,
          onChanged: (value) => onChanged == null ? null : onChanged!(value),
          onFieldSubmitted: (value) =>
              onFieldSubmitted == null ? null : onFieldSubmitted!(value),
          cursorColor: AppColors.textDarkColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.textDarkColor,
              fontWeight: FontWeight.w400,
            ),
            filled: textFieldFilled,
            fillColor: AppColors.whiteColor,
            prefixIcon: prefixIcon,
            prefixIconColor: AppColors.textDarkColor,
            suffixIcon: suffixIconFunction != null && suffixIcon != null
                ? IconButton(
                    onPressed: () => suffixIconFunction!(),
                    icon: CustomImageWidget(
                      assetName: suffixIcon!,
                      color: suffixIconColor,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.all(
              SizeConfig.hPad8() + (2 * SizeConfig.heightMultiplier),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.textFieldBorderRadius),
              ),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: SizeConfig.textFieldBorderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.textFieldBorderRadius),
              ),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: SizeConfig.textFieldBorderWidth,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.textFieldBorderRadius),
              ),
              borderSide: BorderSide(
                color: Colors.red,
                width: SizeConfig.textFieldBorderWidth,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.textFieldBorderRadius),
              ),
              borderSide: BorderSide(
                color: AppColors.errorColor,
                width: SizeConfig.textFieldBorderWidth,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
