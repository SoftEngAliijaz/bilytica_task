import 'package:bilytica_task/utils/app_colors.dart';
import 'package:bilytica_task/utils/assets.dart';
import 'package:bilytica_task/utils/size_config.dart';
import 'package:bilytica_task/views/widgets/custom_image_widget.dart';
import 'package:bilytica_task/views/widgets/text_form_field_widget.dart';
import 'package:bilytica_task/views/widgets/normal_text_widget.dart';
import 'package:flutter/material.dart';

class SearchCardComponent extends StatelessWidget {
  const SearchCardComponent({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height110() * 1.5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.wPad16(),
          right: SizeConfig.wPad16(),
          top: SizeConfig.hPad20(),
          bottom: SizeConfig.hPad20(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: SizeConfig.screenWidth,
              child: Row(
                children: [
                  CustomImageWidget(
                    assetName: Assets.arrowLeftIcon,
                    color: AppColors.whiteColor,
                    height: SizeConfig.height24(),
                    width: SizeConfig.width24(),
                  ),
                  Expanded(
                    child: Center(
                      child: NormalTextWidget(
                        "Dating List",
                        textColor: AppColors.textWhiteColor,
                        fontSize: SizeConfig.height20(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.width28(),
                  ),
                ],
              ),
            ),
            TextFormFieldWidget(
              controller: controller,
              hintText: "Search",
              label: '',
              prefixIcon: GestureDetector(
                onTap: () {},
                child: const CustomImageWidget(
                  assetName: Assets.searchIcon,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
