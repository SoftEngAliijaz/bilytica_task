import 'package:bilytica_task/utils/app_colors.dart';
import 'package:bilytica_task/utils/assets.dart';
import 'package:bilytica_task/utils/size_config.dart';
import 'package:bilytica_task/views/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';

class UserImageWithBadget extends StatelessWidget {
  const UserImageWithBadget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: AppColors.whiteColor,
      alignment: Alignment(0.7, 0.4),
      padding: EdgeInsets.all(2),
      largeSize: 10,
      smallSize: 10,
      label: Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          color: AppColors.onlineColor,
          shape: BoxShape.circle,
        ),
      ),
      child: Container(
        height: SizeConfig.height40(),
        width: SizeConfig.width40(),
        decoration: BoxDecoration(
          border: Border.all(
            width: SizeConfig.borderWidth * 1.3,
            color: AppColors.onlineColor,
          ),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(
              SizeConfig.height20(),
            ),
          ),
          child: Image.network(
            imageUrl,
            height: SizeConfig.height40(),
            width: SizeConfig.width40(),
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, obj, stackTrace) {
              return CustomImageWidget(
                assetName: Assets.errorImagePlaceholder,
                fit: BoxFit.cover,
                height: SizeConfig.height40() * 2.5,
                width: SizeConfig.width40() * 2.5,
              );
            },
          ),
        ),
      ),
    );
  }
}
