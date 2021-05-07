import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bxh/common/model/icon_text_model.dart';
import 'package:flutter_bxh/common/res/colors.dart';
import 'package:flutter_bxh/common/res/dimens.dart';
import 'package:flutter_bxh/common/widgets/load_image.dart';
import 'package:flutter_bxh/common/widgets/toast_utils.dart';
import 'package:flutter_bxh/main/model/mine_items.dart';
import 'package:flutter_bxh/main/widgets/mine_app_bar.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  List<IconTextModel> _itemList;

  @override
  void initState() {
    super.initState();
    _itemList = MineItemModel.getCategoryList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            floating: false,
            snap: false,
            primary: true,
            expandedHeight: 210.0,
            forceElevated: false,
            backgroundColor: Colours.content_gray_bg,
            flexibleSpace: FlexibleSpaceBar(
              background: MineAppBarWidget(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              final IconTextModel item = _itemList.elementAt(index);
              if (item.code == MineItems.rlxxlr.index) {
                return Container(
                  width: double.infinity,
                  height: Dimens.gap_dp15,
                  color: Colours.content_gray_bg,
                );
              } else {
                return Column(children: <Widget>[
                  Material(
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        Toast.show("test1");
                      },
                      leading: LoadAssetImage(
                        item.icon,
                        width: 25.0,
                        height: 25.0,
                      ),
                      trailing: LoadAssetImage(
                        "common/icon_right_arrow",
                        height: 11.0,
                      ),
                      title: Text(item.name),
                      horizontalTitleGap: 1,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: Dimens.gap_dp15,
                      ),
                    ),
                  ),
                  Divider(
                    height: 0.7,
                    indent: 15,
                  )
                ]);
              }
            }, childCount: _itemList.length),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colours.content_gray_bg,
              width: double.infinity,
              height: Dimens.gap_dp50,
            ),
          ),
        ],
      ),
    );
  }
}
