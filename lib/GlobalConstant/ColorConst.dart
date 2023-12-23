import 'package:flutter/material.dart';

const Map<int, String> percentAlpha = {
  0: "FF",
  5: "F2",
  10: "E5",
  15: "D8",
  20: "CC",
  25: "BF",
  30: "B2",
  35: "A5",
  40: "99",
  45: "8c",
  50: "7F",
  55: "72",
  60: "66",
  65: "59",
  70: "4c",
  75: "3F",
  80: "33",
  85: "21",
  90: "19",
  95: "0c",
  100: "00",
};

class HexColor extends Color {
  static int _getColorFromHex(String hexColor, {int alpha = 0}) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      final alphaStr = percentAlpha[alpha] ?? "FF";
      hexColor = alphaStr + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor, {int alpha = 0}) : super(_getColorFromHex(hexColor, alpha: alpha));
}

class ColorConst {
  ///主题色
  static const Color wyMainColor = Color(0xFF926EFF);

  ///主字体颜色
  static const Color wyMainText = Color(0xFF1A1A1A);

  /// 副字体颜色
  static const Color wySubText = Color(0xFFB3B3B3);

  /// 字体颜色99999
  static const Color color999999 = Color(0xFF999999);

  /// 字体颜色666666
  static const Color wyText666666 = Color(0xFF666666);

  /// 字体颜色CCCCCC
  static const Color wyTextCCCCCC = Color(0xFFCCCCCC);

  /// 字体颜色CCCCCC
  static const Color color333333 = Color(0xFF333333);

  static const Color colorWhite = Color(0xFFffffff);
  static const Color color40White = Color(0x66ffffff);
  static const Color colorBlank = Color(0xFF000000);
  static const Color color30Blank = Color(0x4D000000);

  /// 主背景颜色
  static const Color wyMainBg = Color(0xFFF4F5F9);

  /// 副背景颜色
  static const Color wySubBg = Color(0xFFF5F5F5);

  /// 副背景颜色
  static const Color wyBgF3F4F9 = Color(0xFFF3F4F9);

  /// 背景颜色#F1F1F1
  static const Color wyBgF1F1F1 = Color(0xFFF1F1F1);
  static const Color colorF176B0 = Color(0xffF176B0);
  static const Color colorA7A7A7 = Color(0xffA7A7A7);

  static const Color greyHint = Color.fromRGBO(221, 221, 221, 1);

  ///按钮渐变开始颜色enable
  static const Color wyBtnStartColor = Color(0xffF474A3);
  static const Color wyBtnEndColor = Color(0xffde84ff);

  ///按钮渐变开始颜色disble
  static const Color wyBtnDisStartColor = Color(0x80f474a3);
  static const Color wyBtnDisEndColor = Color(0x80de84ff);
  static const Color transparent = Color(0x00000000);
  static const Color colorEDEF78 = Color(0xffEDEF78);
  static const Color colorE293FF = Color(0xffE293FF);
  static const Color colorFFCE39 = Color(0xffFFCE39);
  static const Color colorEEDFFC = Color(0xffEEDFFC);
  static const Color colorED9D56 = Color(0xffED9D56);
  static const Color colorEDEE78 = Color(0xffEDEE78);
  static const Color color50E6DDFF = Color(0x80e6ddff);
}
