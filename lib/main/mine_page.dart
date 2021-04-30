import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bxh/common/res/colors.dart';
import 'package:flutter_bxh/common/res/dimens.dart';
import 'package:flutter_bxh/common/widgets/toast_utils.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {
    super.initState();
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
          SliverToBoxAdapter(
            child: Container(
              color: Colours.content_gray_bg,
              width: double.infinity,
              height: Dimens.gap_dp15,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(Dimens.gap_dp15),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Toast.show("test");
                  },
                  child: Container(
                    child: ListTile(
                      leading: Icon(Icons.map),
                      title: Text('Map'),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: Dimens.gap_dp5, horizontal: 0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: Divider.createBorderSide(context, width: 0.7),
                      ),
                    ),
                  ),
                );
              }, childCount: 8),
            ),
          ),
        ],
      ),
    );
  }
}
