
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/globals.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/app_font_size.dart';
import 'package:innovins/core/theme/app_font_weight.dart';

class AppTextStyle {
  static TextStyle termConditionText = GoogleFonts.nunitoSans(
    fontSize: Get.width*0.035,
    fontWeight: FontWeight.bold,
    color: AppColor.primaryColor,
    decoration: TextDecoration.underline,
  );

  static TextStyle loginAgreeText = GoogleFonts.nunitoSans(
      fontSize: Get.width*0.035,
      fontWeight: FontWeight.bold,
      color: Colors.black54
  );
  static TextStyle outlineButtonText = TextStyle(
    color: AppColor.primaryColor,
    fontWeight: AppFontWeight.fontBold,
    letterSpacing: letterSpacing,
    fontSize: AppFontSize.buttonFontSize,
  );
  static TextStyle elevatedButtonText = GoogleFonts.nunitoSans(
    color : AppColor.whiteColor,
    fontWeight: AppFontWeight.fontBold,
    letterSpacing:letterSpacing,
    fontSize:AppFontSize.buttonFontSize,
  );
  static TextStyle  customListTileSubTitle = GoogleFonts.nunitoSans(color: Colors.black54, fontSize: Get.width*0.039,fontWeight: FontWeight.w500);

  static TextStyle listText = TextStyle(
      color: const Color(0xff828282),
      fontSize: Get.width * 0.043);

  static TextStyle listEditText = TextStyle(
    // color: const Color(0xff828282),
      color: Colors.green,
      fontSize: Get.width * 0.045);

  static TextStyle listDeleteText = TextStyle(
    // color: const Color(0xff828282),
      color: Colors.red,
      fontSize: Get.width * 0.045);


  static TextStyle dataTableListText = TextStyle(
      color: const Color(0xff828282),
      fontSize: Get.width * 0.035);

  static TextStyle alertBoxTitle = TextStyle(
      color: AppColor.settingTextColor,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.alertBoxTitle);

  static TextStyle settingTextStyle = GoogleFonts.nunitoSans(
      color: AppColor.black,
      fontSize: Get.width * 0.045);
  static TextStyle whiteAppTitle = const TextStyle(
    color: AppColor.black,
    fontWeight: AppFontWeight.fontBlack,
    letterSpacing: letterSpacing,
  );
  static TextStyle appTitle = GoogleFonts.nunitoSans(
    color: AppColor.black,
    fontWeight: AppFontWeight.fontBold,
    fontSize: Get.width*0.045
  );

  static TextStyle hindTextStyle = TextStyle(
    color : AppColor.darkGrey,
    fontWeight: AppFontWeight.fontRegular,
    letterSpacing:letterSpacing,
    fontSize:AppFontSize.hintTextFontSize,
  );

  static TextStyle orTextStyle = TextStyle(
    color: AppColor.primaryColor,
    fontWeight: AppFontWeight.fontSemiBold,
    letterSpacing: letterSpacing,
    fontSize:Get.width*0.035,
  );

  static TextStyle recommendedText = const TextStyle(
    color: AppColor.whiteColor,
    fontWeight: AppFontWeight.fontBold,
    letterSpacing: 0.2,
  );

  static TextStyle myAddonsText =const  TextStyle(
    fontSize: 16,
    fontWeight: AppFontWeight.fontRegular,
  );

  static TextStyle learnMoreText =const  TextStyle(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 15.0,
    decoration: TextDecoration.underline,
    color: AppColor.primaryColor,
  );

  static TextStyle suggestedTitleText =const  TextStyle(
    fontSize: 18,
    fontWeight: AppFontWeight.fontBlack,
  );

  static TextStyle tabBarText =const  TextStyle(
    fontSize: 14,
    fontWeight: AppFontWeight.fontBold,
  );


  static TextStyle suggestedDescriptionText =const  TextStyle(
    fontSize: 16,
    fontWeight: AppFontWeight.fontRegular,
  );

  static TextStyle attendanceText =TextStyle(fontSize: Get.width * 0.04, fontWeight: FontWeight.bold);

  static TextStyle teacherDashboardHeading =const  TextStyle(
    fontSize: 16,
    color: AppColor.primaryColor,
    fontWeight: AppFontWeight.fontBold,
  );
  static TextStyle reportTotalHeading = TextStyle(
      color: AppColor.primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: Get.width * 0.043);
  static TextStyle studentList = const  TextStyle(
      color: AppColor.whiteColor, fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle profileText = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 16,);

  static TextStyle classHeading = TextStyle(
      color: AppColor.primaryColor,
      fontWeight: FontWeight.w700,
      fontSize: Get.width * 0.041);
  static TextStyle programWiseAttendanceHeading = TextStyle(
      color: AppColor.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: Get.width * 0.042);

  static TextStyle programWiseAttendanceHeading1 = GoogleFonts.nunitoSans(
    color: AppColor.primaryColor,
    fontWeight: FontWeight.w600,
    fontSize: Get.width * 0.042,
    decoration:  TextDecoration.underline,
  );

  static TextStyle tableTitle = const TextStyle(
    color: AppColor.primaryColor,
    fontWeight: AppFontWeight.fontBold,
  );
  static TextStyle tableRowItemTitle = const TextStyle(
    color: Colors.black87,
    fontWeight: AppFontWeight.fontBold,
    fontSize: 16.0,
  );


  static TextStyle tableRowTitle = const TextStyle(
    fontWeight: AppFontWeight.fontBold,
  );
  static TextStyle appTitlePrimary = const TextStyle(
    color: AppColor.whiteColor,
    fontWeight: AppFontWeight.fontBold,
  );
  static TextStyle greyText = TextStyle(
      color: const Color(0xff828282),
      fontWeight: FontWeight.w500,
      fontSize: Get.width * 0.04);

  static TextStyle hyperlinkGray = TextStyle(
      color: AppColor.primaryColor,
      decorationThickness: 2,
      fontWeight: FontWeight.bold,
      fontSize: Get.width * 0.045);

  static TextStyle hyperlinkGray2 = TextStyle(
      color: AppColor.primaryColor,
      //color: Colors.black54,
      decoration: TextDecoration.underline,
      decorationThickness: 2,
      fontWeight: FontWeight.bold,
      fontSize: Get.width * 0.045);

  String? laTo = const TextStyle().fontFamily;

  static TextStyle stepperTitle = TextStyle(
      color: AppColor.darkGrey,
      fontWeight: AppFontWeight.fontSemiBold,
      fontSize: Get.width * 0.05);

  static TextStyle holiday = TextStyle(
    color: const Color(0xff303030),
    fontWeight: FontWeight.w600,
    fontSize: Get.width * 0.038,
  );

  static TextStyle hindTextFieldText = const TextStyle(
    color: AppColor.darkGrey,
    fontWeight: AppFontWeight.fontRegular,
    fontSize: 14,
  );

  static TextStyle studentList1 =TextStyle(
      fontSize: Get.width * 0.043,
      fontWeight: FontWeight.bold,
      color: AppColor.primaryColor);
  static TextStyle teacherPage = const TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle teacherPage1 = const TextStyle(

    color: Colors.blue,
    fontWeight: FontWeight.bold,
    decoration:TextDecoration. underline, decorationColor: Colors.blue,
  );
  static TextStyle searchStudentLightGrey = TextStyle(
    color: Colors.black54,
    fontSize: Get.width * 0.045,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
  );
  static TextStyle searchStudent = TextStyle(
      fontSize: Get.width * 0.07, color: Colors.black38,
      fontWeight: FontWeight.bold);
  static TextStyle alertButtonTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'openSanse',
      color: AppColor.whiteColor);


}