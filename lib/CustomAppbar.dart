
import 'package:flutter/material.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/text_style.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.spacing,
    this.elevation = 0.0,
  }) : super(key: key);
  final String? title;
  final Widget? leading;
  final double elevation;
  final List<Widget>? actions;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: AppBar(
        elevation: 0.0,
          title: Text(title!,style: AppTextStyle.appTitle,),
        backgroundColor: Colors.transparent,
        actions: actions,
        leading: leading,
        titleSpacing: spacing??1,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
class CustomWhiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomWhiteAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.spacing,
    this.elevation = 0.0,
  }) : super(key: key);
  final String? title;
  final Widget? leading;
  final double elevation;
  final List<Widget>? actions;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: AppBar(
        elevation: 0.0,
        leadingWidth: 0.1,
        title: Text(title!,style: AppTextStyle.whiteAppTitle,),
        backgroundColor: AppColor.whiteColor,
        actions: actions,
        leading: leading ?? const SizedBox(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}