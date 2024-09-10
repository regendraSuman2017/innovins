
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovins/core/theme/app_color.dart';

class AppIconData {
  static const  IconData eye = Icons.remove_red_eye_outlined;
  static const  IconData eyeOff = Icons.visibility_off_outlined;

}


class AppIcons {


  static const   Icon backIcon = Icon(
    AppIconData.eye,
    color: AppColor.darkGrey,
  );
  static const   Icon eyeOffIcon = Icon(
    AppIconData.eyeOff,
    color: AppColor.darkGrey,
  );

  static Icon searchIcon = const Icon(
    CupertinoIcons.search,
    color: Colors.black54,
  );
}