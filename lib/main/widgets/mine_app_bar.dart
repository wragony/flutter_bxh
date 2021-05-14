import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bxh/common/res/colors.dart';
import 'package:flutter_bxh/common/res/dimens.dart';
import 'package:flutter_bxh/common/utils/image_utils.dart';
import 'package:flutter_bxh/common/widgets/load_image.dart';
import 'package:flutter_bxh/common/widgets/rounded_text.dart';

class MineAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 80),
          width: double.infinity,
          color: Colours.white,
          child: LoadAssetImage(
            "mine/ic_mine_top_bg",
            format: ImageFormat.jpg,
            width: double.infinity,
            height: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 115, left: Dimens.gap_dp15),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: LoadAssetImage(
                    "common/circle_head_admin",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: Dimens.gap_dp5,
                      ),
                      Text(
                        "吴老师",
                        style: TextStyle(fontSize: Dimens.font_sp16, color: Colours.text),
                      ),
                      SizedBox(
                        height: Dimens.gap_dp5,
                      ),
                      Text(
                        "天音1306幼儿-中班（1）班",
                        style: TextStyle(fontSize: Dimens.font_sp12, color: Colours.text_gray),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox.shrink(),
                  ),
                  RoundedTextView(
                    text: "切换账号",
                    fontSize: Dimens.font_sp16,
                    textColor: Colours.nav_action_color,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
                    borderColor: Colours.nav_action_color,
                    borderWidth: 1.2,
                  ),
                  SizedBox(
                    width: Dimens.gap_dp15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
