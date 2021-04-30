import 'package:flutter_bxh/common/model/icon_text_model.dart';
import 'package:flutter_bxh/main/model/category_type.dart';

enum HomeCategory {
  notice,
  attendance,
  food,
  morning_check,
  leave,
  apprise,
  class_album,
  plan,
  visitor,
  health_report,
}

class HomeCategoryModel {
  //
  static List<IconTextModel> getCategoryList() {
    List<IconTextModel> items = [];

    IconTextModel item = IconTextModel();
    item.code = HomeCategory.notice.index;
    item.name = "通知";
    item.icon = "home/more_icon_notice";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = HomeCategory.attendance.index;
    item.name = "考勤";
    item.icon = "home/more_icon_checkwork";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = HomeCategory.food.index;
    item.name = "食谱";
    item.icon = "home/more_icon_recipes";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = HomeCategory.morning_check.index;
    item.name = "晨检";
    item.icon = "home/more_icon_morningcheck";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = HomeCategory.leave.index;
    item.name = "请假";
    item.icon = "home/more_icon_leave";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = HomeCategory.apprise.index;
    item.name = "班级评价";
    item.icon = "home/more_icon_evaluation";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = HomeCategory.class_album.index;
    item.name = "班级相册";
    item.icon = "home/more_icon_classalbum";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = HomeCategory.visitor.index;
    item.name = "访客记录";
    item.icon = "home/more_icon_visitor";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = HomeCategory.plan.index;
    item.name = "周计划";
    item.icon = "home/more_icon_weeklyplan";
    item.type = CategoryType.native;
    items.add(item);

    item = IconTextModel();
    item.code = HomeCategory.health_report.index;
    item.name = "健康上报";
    item.icon = "home/more_icon_health_report";
    item.type = CategoryType.native;
    items.add(item);

    return items;
  }
}
