import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bxh/common/res/dimens.dart';
import 'package:flutter_bxh/common/widgets/icon_text.dart';
import 'package:flutter_bxh/common/widgets/image.dart';
import 'package:flutter_bxh/common/widgets/load_image.dart';
import 'package:flutter_bxh/common/widgets/rounded_text.dart';
import 'package:nine_grid_view/nine_grid_view.dart';

class TrendsItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).accentColor.withAlpha(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: WrapperImage(
                  url: "https://picsum.photos/250?image=9",
                  height: 35,
                  width: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: Dimens.gap_dp10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("校管理员",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimens.font_sp14,
                        )),
                    SizedBox(height: 5),
                    Text("2020-10-22",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: Dimens.font_sp12,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox.shrink(),
              ),
              RoundedTextView(
                  text: "相册",
                  textColor: Colors.orangeAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                  borderColor: Colors.orangeAccent),
            ],
          ),
          SizedBox(height: 10),
          Text("动态内容动态内容动态内容动态内容动态内容动态内容动态内容动态内容",
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimens.font_sp16,
              )),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NineGridView(
                width: 300,
                space: 5,
                type: NineGridType.weiBo,
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return LoadImage(
                    "https://picsum.photos/250?image=12",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ],
          ),
          Container(
            width: double.infinity,
            color: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                LoadImage(
                  "https://picsum.photos/500?image=13",
                  fit: BoxFit.fitWidth,
                  height: 200,
                ),
                LoadAssetImage(
                  "common/icon_video_play",
                  width: 45,
                  height: 45,
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text(
                "来自：校管理员",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: Dimens.font_sp14,
                ),
              ),
              Expanded(
                child: SizedBox.shrink(),
              ),
              IconText(
                "1000",
                icon: LoadAssetImage(
                  "common/icon_item_like",
                  width: 15,
                  height: 15,
                ),
                textAlign: TextAlign.center,
                direction: Axis.horizontal,
                maxLines: 1,
                style: TextStyle(color: Colors.black38, fontSize: Dimens.font_sp14),
              ),
              SizedBox(width: 15),
              IconText(
                "12",
                icon: LoadAssetImage(
                  "common/icon_item_comment",
                  width: 15,
                  height: 15,
                ),
                textAlign: TextAlign.center,
                direction: Axis.horizontal,
                maxLines: 1,
                style: TextStyle(color: Colors.black38, fontSize: Dimens.font_sp14),
              ),
              SizedBox(width: 15),
              LoadAssetImage(
                "common/icon_item_more",
                width: 15,
                height: 15,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: Dimens.gap_dp20, horizontal: 0),
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context, width: 0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
