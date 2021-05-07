import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bxh/common/res/colors.dart';
import 'package:flutter_bxh/common/res/dimens.dart';
import 'package:flutter_bxh/common/widgets/my_app_bar.dart';

class FindPage extends StatefulWidget {
  const FindPage({Key key}) : super(key: key);

  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
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
      appBar: MyAppBar(
        centerTitle: "园本课程",
      ),
      body: Container(
        color: Colours.content_gray_bg,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            "园本课程页面",
            style: TextStyle(fontSize: Dimens.font_sp16, color: Colours.text),
          ),
        ),
      ),
    );
  }
}
