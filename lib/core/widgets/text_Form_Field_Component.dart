

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/text_style.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    Key? key,
    this.controller,
    this.border,
    this.hintText,
    this.suffix,
    this.inputFormatters,
    this.validator,
    this.enabled,
    this.keyboardType,
    this.onchange,
    this.prefixIcon,
    this.suffixIcon,
    this.onFieldSubmit,
    this.textScaleFactor,
    this.onSaved,
    this.obscureText,
    this.labelText,
    this.color,
    this.onTap,
    this.contentPadding,
    this.initialValue,
    this.autoFocus,
    this.autoValidateMode,
    this.readOnly,
    this.maxLine

  }) : super(key: key);
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final bool? enabled;
  final bool? readOnly;
  final InputBorder? border;
  final Widget? prefixIcon;
  final Function(String)? onchange;
  final Function(String)? onFieldSubmit;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final double? textScaleFactor;
  final String? labelText;
  final String? initialValue;
  final Color? color;
  final EdgeInsetsGeometry? contentPadding;
  final bool? autoFocus;
  final AutovalidateMode? autoValidateMode;
  final int? maxLine;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: const EdgeInsets.only(bottom:40),
        decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: prefixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: color??AppColor.primaryColor,
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: color == null ? AppColor.primaryColor : color!,)),
            border: const OutlineInputBorder(),
            suffix: suffix,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            hintText: hintText,
            hintStyle: AppTextStyle.hindTextStyle,
            labelStyle: AppTextStyle.hindTextStyle,
            errorMaxLines: 2),
        onFieldSubmitted: onFieldSubmit,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText??false,
        onChanged: onchange,
        autovalidateMode:autoValidateMode?? AutovalidateMode.onUserInteraction,
        onTap: onTap,
        enabled: enabled,
        onSaved: onSaved,
        initialValue: initialValue,
        inputFormatters: inputFormatters,
        autofocus:autoFocus??false,
        validator: validator,
      readOnly: readOnly ?? false,
       maxLines: maxLine??1,

    );
  }
}

