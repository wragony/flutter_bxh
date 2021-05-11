import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bxh/common/model/common_enum.dart';
import 'package:flutter_bxh/common/model/icon_text_model.dart';
import 'package:flutter_bxh/common/res/colors.dart';
import 'package:flutter_bxh/common/res/dimens.dart';
import 'package:flutter_bxh/common/widgets/icon_text.dart';
import 'package:flutter_bxh/common/widgets/load_image.dart';
import 'package:flutter_bxh/common/widgets/toast_utils.dart';
import 'package:flutter_bxh/main/model/home_repository.dart';
import 'package:flutter_bxh/main/widgets/list_item_trends.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IconTextModel> _categoryList;

  IconButton _filterBtn;

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _categoryList = HomeCategoryModel.getCategoryList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backwardsCompatibility: false,
        title: Text('中班（1）班', style: TextStyle(fontSize: Dimens.font_sp18, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          _filterBtn = IconButton(
            tooltip: '筛选',
            onPressed: () {
              Toast.show('点击了${_filterBtn.tooltip}');
              HomeRepository.getTrendsList();
            },
            icon: LoadAssetImage(
              'appbars/appbar_list_filter',
              key: const Key('list_filter'),
              width: Dimens.appbar_icon_size,
              height: Dimens.appbar_icon_size,
            ),
          ),
          IconButton(
            tooltip: '扫一扫',
            onPressed: () {
              Toast.show('点击了');
            },
            icon: LoadAssetImage(
              'appbars/appbar_scan',
              key: const Key('scan'),
              width: Dimens.appbar_icon_size,
              height: Dimens.appbar_icon_size,
            ),
          ),
        ],
      ),
      body: RefreshConfiguration.copyAncestor(
        context: context,
        child: SmartRefresher(
          onRefresh: () {
            Toast.show("onRefresh...");
          },
          onLoading: () {
            Toast.show("onLoading...");
          },
          enablePullUp: true,
          controller: _refreshController,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: Dimens.gap_dp15, horizontal: Dimens.gap_dp5),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, mainAxisSpacing: Dimens.gap_dp10, crossAxisSpacing: Dimens.gap_dp15),
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    final IconTextModel item = _categoryList.elementAt(index);
                    return InkWell(
                      onTap: () {
                        Toast.show('点击了：${item.name}');
                      },
                      child: IconText(
                        item.name,
                        style: TextStyle(fontSize: Dimens.font_sp14, color: Colors.black),
                        icon: LoadAssetImage(
                          item.icon,
                          width: 30.0,
                          height: 30.0,
                        ),
                        direction: Axis.vertical,
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                    );
                  }, childCount: _categoryList.length),
                ),
              ),
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
                    return TrendsItemWidget();
                  }, childCount: 14),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "发布",
        key: ValueKey(Icons.create_rounded),
        onPressed: () {
          Toast.show("click floatingActionButton");
        },
        child: Icon(
          Icons.create_rounded,
          color: Colors.white,
        ),
        backgroundColor: Colours.nav_action_color,
        elevation: 6.0,
      ),
    );
  }
}
