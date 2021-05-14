import 'package:flutter/material.dart';
import 'package:flutter_bxh/common/res/dimens.dart';

class RoundedTextView extends StatelessWidget {
  final text;
  final fontSize;
  final textColor;
  final padding;
  final borderColor;
  final borderRadius;
  final borderWidth;

  RoundedTextView(
      {@required this.text,
      @required this.textColor,
      this.fontSize: Dimens.font_sp10,
      @required this.padding,
      @required this.borderColor,
      this.borderRadius: 20.0,
      this.borderWidth: 1.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration:
          BoxDecoration(border: Border.all(color: borderColor, width: borderWidth), borderRadius: BorderRadius.circular((borderRadius))),
      child: Text(text, style: TextStyle(fontSize: fontSize, color: textColor)),
    );
  }
}
