import 'package:flutter_bxh/common/model/icon_text_model.dart';
import 'package:flutter_bxh/main/model/category_type.dart';

enum MineItems {
  phb,
  czda,
  sgz,
  bjgl,
  xxzx,
  kqklr,
  rlxxlr,
  grzl,
  jfsc,
  xtsz,
  scdl,
  bzyfk,
}

class MineItemModel {
  //
  static List<IconTextModel> getCategoryList() {
    List<IconTextModel> items = [];

    IconTextModel item = IconTextModel();
    item.code = MineItems.phb.index;
    item.name = "排行榜";
    item.icon = "mine/my_icon_ranklist";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = MineItems.czda.index;
    item.name = "成长档案";
    item.icon = "mine/my_icon_growth";
    item.type = CategoryType.html5;
    items.add(item);

    item = IconTextModel();
    item.code = MineItems.sgz.index;
    item.name = "时光轴";
    item.icon = "mine/my_icon_timeaxis";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = MineItems.bjgl.index;
    item.name = "班级管理";
    item.icon = "mine/my_icon_management";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = MineItems.xxzx.index;
    item.name = "消息中心";
    item.icon = "mine/my_icon_messagecenter";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = MineItems.kqklr.index;
    item.name = "考勤卡录入";
    item.icon = "mine/icon_space_attendance_record";
    item.type = CategoryType.html5;
    items.add(item);

    item = IconTextModel();
    item.code = MineItems.rlxxlr.index;
    item.name = "人脸信息录入";
    item.icon = "mine/icon_space_face_attendance";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = MineItems.grzl.index;
    item.name = "个人资料";
    item.icon = "mine/my_icon_personaldata";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = MineItems.jfsc.index;
    item.name = "积分商城";
    item.icon = "mine/my_icon_mall";
    item.type = CategoryType.html5;
    items.add(item);

    item = IconTextModel();
    item.code = MineItems.xtsz.index;
    item.name = "系统设置";
    item.icon = "mine/my_icon_systemsetup";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = MineItems.scdl.index;
    item.name = "上传队列";
    item.icon = "mine/my_icon_upload";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = MineItems.bzyfk.index;
    item.name = "帮助与反馈";
    item.icon = "mine/my_icon_help";
    item.type = CategoryType.native;
    items.add(item);

    return items;
  }
}
