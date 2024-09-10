import 'package:innovins/core/globals.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/text_style.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends GetView {
  final String title;
  final VoidCallback? onPress;
  final TextStyle? textStyle;
  final Color? color;
  final ShapeBorder? shape;
  final double? elevation;
  final double? borderRadius;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPress,
    this.textStyle,
    this.color,
    this.shape,
    this.elevation,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialButton(
          onPressed: isDisable.value ? () {} : onPress,
          color: color == null
              ? isDisable.value
                  ? Colors.grey.shade400
                  : AppColor.buttonColor
              :color ?? AppColor.buttonColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5))),
          child: Text(
              isDisable.value ? 'Processing...' : title,
              style: AppTextStyle.elevatedButtonText),
        ));
  }
}
