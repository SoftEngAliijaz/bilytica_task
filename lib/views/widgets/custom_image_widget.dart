import 'package:bilytica_task/utils/app_colors.dart';
import 'package:bilytica_task/utils/assets.dart';
import 'package:bilytica_task/utils/enums.dart';
import 'package:bilytica_task/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.scaleDown,
    this.alignment = Alignment.center,
    this.matchTextDirection = false,
    this.placeholder,
    this.clipBehavior = Clip.hardEdge,
    this.imageType = ImageType.svg,
  });

  final Alignment alignment;
  final String assetName;
  final Clip clipBehavior;
  final Color? color;
  final BoxFit fit;
  final double? height;
  final ImageType imageType;
  final bool matchTextDirection;
  final WidgetBuilder? placeholder;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return imageType == ImageType.svg
        ? SvgPicture.asset(
            assetName,
            height: height ?? SizeConfig.height24(),
            width: width ?? SizeConfig.width24(),
            colorFilter: color == null
                ? null
                : ColorFilter.mode(
                    color!,
                    BlendMode.srcIn,
                  ),
            fit: fit,
            alignment: alignment,
            matchTextDirection: matchTextDirection,
            placeholderBuilder: placeholder,
            clipBehavior: clipBehavior,
          )
        : imageType == ImageType.pngAndOthers
            ? Image.asset(
                assetName,
                height: height,
                width: width,
                fit: fit,
              )
            : Image.network(
                assetName,
                height: height,
                width: width,
                fit: fit,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    Assets.errorImagePlaceholder,
                    width: SizeConfig.width20() * 4,
                    height: SizeConfig.height20() * 4,
                  );
                },
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
              );
  }
}
