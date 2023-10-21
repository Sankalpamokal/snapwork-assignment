import 'package:flutter/material.dart';
import 'package:snapwork_assignment/app/common/values/app_colors.dart';

import '../common/values/styles/font_family.dart';

class Style {
  static Widget errorMessage(String error) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        error,
        style: const TextStyle(
            fontFamily: FontFamily.NunitoRegular,
            color: AppColors.FFF50031,
            fontSize: 12),
      ),
    );
  }

  static InputDecoration getInputDecoration(String hintText,
      {bool alignLabelWithHint = false,
      Widget? prefixIcon,
      Widget? suffixIcon,
      bool enabled = true,
      double leftTextPadding = 15,
      double rightTextPadding = 15,
      double topTextPadding = 0,
      double bottomTextPadding = 0,
      double borderWidth = 1.0,
      Color hintColor = AppColors.FF404040,
      double hintFontSize = 16,
      Color outlineBorderColor = AppColors.kPrimaryLight,
      bool filled = false}) {
    return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(
          leftTextPadding, topTextPadding, rightTextPadding, bottomTextPadding),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      counterText: "",
      //labelText: labelText,
      hintText: hintText,
      fillColor: AppColors.offWhite,
      hintStyle: TextStyle(
        color: hintColor,
        fontSize: hintFontSize,
        fontFamily: FontFamily.NunitoRegular,
      ),
      filled: filled ? true : false,
      labelStyle: TextStyle(color: AppColors.FF404040, fontSize: 14),
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: outlineBorderColor, width: borderWidth),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: AppColors.FFDBDBDB, width: borderWidth),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: AppColors.FFDBDBDB, width: borderWidth),
      ),
      errorBorder: InputBorder.none,
      enabled: enabled,
      alignLabelWithHint: alignLabelWithHint,
      //disabledBorder: InputBorder.none,
    );
  }

  static Widget getInputTextField(String name, TextInputType inputType,
      TextEditingController controller, double width,
      {Key? key,
      int? maxLength,
      bool obscure = false,
      double topMargin = 0,
      double leftMargin = 0,
      double rightMargin = 0,
      double leftpadding = 0,
      double bottomPadding = 0,
      double height = 48,
      ValueChanged<String>? onChanged,
      FocusNode? focusNode,
      ValueChanged<String>? onFieldSubmitted,
      FormFieldValidator<String>? validator,
      Function? validation,
      bool enable = true,
      bool autofocus = false,
      double fontSize = 16,
      int? minLines,
      int? maxLines,
      Widget? prefixIcon,
      Widget? suffixIcon,
      TextAlign textAlign = TextAlign.left,
      TextAlignVertical textAlignVertical = TextAlignVertical.center,
      AutovalidateMode? autovalidateMode,
      Color backgroundColor = Colors.transparent,
      double borderWidth = 2.0,
      Color? hintColor,
      double? hintfontsize,
      Color textColor = AppColors.FF404040,
      outlineBorderColor = AppColors.kPrimaryDark}) {
    return Container(
        // height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: backgroundColor,
        ),
        child: TextFormField(
          key: key,
          maxLength: maxLength,
          controller: controller,
          keyboardType: inputType,
          minLines: minLines,
          maxLines: maxLines,
          obscureText: obscure,
          expands: false,
          textAlign: textAlign,
          focusNode: focusNode,
          textAlignVertical: textAlignVertical,
          style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontFamily: FontFamily.NunitoRegular),
          decoration: Style.getInputDecoration(name,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              enabled: enable,
              hintColor: hintColor ?? AppColors.FF808080,
              borderWidth: borderWidth,
              hintFontSize: hintfontsize ?? 16,
              outlineBorderColor: outlineBorderColor),
          onChanged: onChanged,
          autofocus: autofocus,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          autovalidateMode: autovalidateMode,
        ));
  }

  static Widget getButtonWithRoundedCorners(
      double width, double height, Function onPressed, Widget textWidget,
      {Color backgroundColor = AppColors.FF404040,
      Color borderColor = AppColors.FF404040,
      Widget? image,
      double leftMargin = 16,
      double rightMargin = 16,
      bool hasBoxShadow = false,
      double borderRadius = 6.0}) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: backgroundColor,
        border: Border.all(color: borderColor),
        boxShadow: hasBoxShadow
            ? [
                const BoxShadow(
                    color: AppColors.A6000000, blurRadius: 6, spreadRadius: 2),
              ]
            : [],
      ),
      child: InkWell(
        onTap: () => onPressed(),
        child: image != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 20, height: 20, child: image),
                  const SizedBox(
                    width: 10,
                  ),
                  textWidget
                ],
              )
            : Center(
                child: textWidget,
              ),
      ),
    );
  }

  static Widget multiLineText(
      {String? text,
      double? width,
      Color? color,
      double? fontSize,
      String? fontFamily,
      TextAlign textAlign = TextAlign.center}) {
    return SizedBox(
      width: width,
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          text: text,
          style: TextStyle(
              height: 1.5,
              color: color,
              fontSize: fontSize,
              fontFamily: fontFamily,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
