import 'package:bilytica_task/models/user_model.dart';
import 'package:bilytica_task/utils/app_colors.dart';
import 'package:bilytica_task/utils/assets.dart';
import 'package:bilytica_task/utils/size_config.dart';
import 'package:bilytica_task/views/widgets/custom_image_widget.dart';
import 'package:bilytica_task/views/widgets/user_image_with_badget.dart';
import 'package:bilytica_task/views/widgets/normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserCardComponent extends StatelessWidget {
  const UserCardComponent({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.hPad14()),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          SizeConfig.hPad16(),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomImageWidget(
                      assetName: Assets.calendarIcon,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: SizeConfig.width10(),
                    ),
                    NormalTextWidget(
                      "Dinner",
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.font20(),
                    ),
                  ],
                ),
                Icon(
                  Icons.more_horiz,
                  color: AppColors.blackColor,
                  size: SizeConfig.hPad24(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.hPad8(),
                bottom: SizeConfig.hPad8(),
              ),
              child: SizedBox(
                width: SizeConfig.screenWidth - (SizeConfig.wPad16() * 6),
                child: Divider(
                  color: Colors.grey.withValues(alpha: 0.3),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    UserImageWithBadget(
                      imageUrl: userModel.picture?.medium ?? "",
                    ),
                    SizedBox(
                      width: SizeConfig.width8(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NormalTextWidget(
                          "${userModel.name?.first ?? ""} - ${userModel.dob?.age ?? 0}",
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.font16(),
                        ),
                        NormalTextWidget(
                          "3 km away from you",
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.font12(),
                          textColor:
                              AppColors.blackColor.withValues(alpha: 0.4),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomImageWidget(
                      assetName: Assets.chatIcon,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: SizeConfig.width8(),
                    ),
                    Icon(
                      Icons.phone,
                      size: SizeConfig.height24(),
                      color: AppColors.primaryColor,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.height8(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomImageWidget(
                          assetName: Assets.calendarIcon,
                          color: AppColors.blackColor,
                          height: SizeConfig.height15(),
                          width: SizeConfig.width15(),
                        ),
                        SizedBox(
                          width: SizeConfig.width8(),
                        ),
                        NormalTextWidget(
                          "Date",
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.font14(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.height5(),
                    ),
                    NormalTextWidget(
                      DateFormat('MMM d, yyyy').format(DateTime.now()),
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.font16(),
                    ),
                    SizedBox(
                      height: SizeConfig.height5(),
                    ),
                    NormalTextWidget(
                      TimeOfDay.now().format(context),
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.font16(),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.height40() * 1.5,
                  child: VerticalDivider(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.pin_drop,
                          color: AppColors.blackColor,
                          size: SizeConfig.height15(),
                        ),
                        SizedBox(
                          width: SizeConfig.width8(),
                        ),
                        NormalTextWidget(
                          "Location",
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.font14(),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: SizeConfig.width110() * 1.4,
                      child: NormalTextWidget(
                        "${userModel.location?.city ?? ""} ${userModel.location?.country ?? ""}",
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.font16(),
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
