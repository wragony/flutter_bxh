import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bxh/common/res/colors.dart';
import 'package:flutter_bxh/common/res/dimens.dart';
import 'package:flutter_bxh/common/widgets/double_tap_back_exit_app.dart';
import 'package:flutter_bxh/common/widgets/load_image.dart';
import 'package:flutter_bxh/common/widgets/webview_page.dart';
import 'package:flutter_bxh/main/view/tab/mine_page.dart';
import 'package:flutter_bxh/main/provider/main_provider.dart';
import 'package:flutter_bxh/main/view/tab/resoures_page.dart';
import 'package:provider/provider.dart';

import 'tab/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _pageList;
  static const double _unselected_imageSize = 25.0;
  static const double _selected_imageSize = 28.0;
  final List<String> _barTitles = ['家园', '园本', '发现', '我的'];
  List<BottomNavigationBarItem> _list;
  final PageController _pageController = PageController();
  MainProvider provider = MainProvider();

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
      create: (_) {
        return provider;
      },
      child: DoubleTapBackExitApp(
        child: Scaffold(
          bottomNavigationBar: Consumer<MainProvider>(
            builder: (_, provider, __) {
              return BottomNavigationBar(
                backgroundColor: Colors.white,
                items: _buildBottomNavigationBarItem(),
                type: BottomNavigationBarType.fixed,
                currentIndex: provider.value,
                elevation: 5.0,
                selectedFontSize: Dimens.font_sp11,
                unselectedFontSize: Dimens.font_sp10,
                selectedItemColor: Colours.selected_item_color,
                unselectedItemColor: Colours.unselected_item_color,
                onTap: (index) {
                  return _pageController.jumpToPage(index);
                },
              );
            },
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(), // 禁止滑动
            controller: _pageController,
            onPageChanged: (int index) => provider.value = index,
            children: _pageList,
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      const _tabImages = [
        [
          LoadAssetImage(
            'navbars/botbar_home_def',
            width: _unselected_imageSize,
          ),
          LoadAssetImage(
            'navbars/botbar_home_pre',
            width: _selected_imageSize,
          ),
        ],
        [
          LoadAssetImage(
            'navbars/botbar_resource_def',
            width: _unselected_imageSize,
          ),
          LoadAssetImage(
            'navbars/botbar_resource_pre',
            width: _selected_imageSize,
          ),
        ],
        [
          LoadAssetImage(
            'navbars/botbar_find_def',
            width: _unselected_imageSize,
          ),
          LoadAssetImage(
            'navbars/botbar_find_pre',
            width: _selected_imageSize,
          ),
        ],
        [
          LoadAssetImage(
            'navbars/botbar_me_def',
            width: _unselected_imageSize,
          ),
          LoadAssetImage(
            'navbars/botbar_me_pre',
            width: _selected_imageSize,
          ),
        ]
      ];
      _list = List.generate(_tabImages.length, (i) {
        return BottomNavigationBarItem(
          icon: _tabImages[i][0],
          activeIcon: _tabImages[i][1],
          label: _barTitles[i],
        );
      });
    }
    return _list;
  }

  void initData() {
    _pageList = [
      const HomePage(),
      const FindPage(),
      const WebViewPage(title: "发现", url: "http://zy.91sst.cn/TeaResource/Index?from=3&xxtuserid=2210317100415460&grade=1&sex=1&countyname=%e6%9d%ad%e5%b7%9e&xxtschoolid=1306&tel=18667006550&roletype=1&username=%e5%90%b4%e8%80%81%e5%b8%88&schoolname=%e5%a4%a9%e9%9f%b31306%e5%b9%bc%e5%84%bf&skey=%2FhHLNylWzfNyuVaHgLS0cB2%2Ba8s%3D&noce=1690436199&time=1620373322&pic=http://assets.91118.com/img/SRoom/teacherdefault.jpg"),
      const MinePage(),
    ];
  }
}
