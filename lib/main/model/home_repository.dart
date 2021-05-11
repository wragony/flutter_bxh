import 'dart:convert';

import 'package:flutter_bxh/common/network/api_manager.dart';
import 'package:flutter_bxh/common/utils/log_util.dart';

class HomeRepository {
  static getTrendsList() {
    var json = {
      "appId": "1",
      "cmd": "GetGrowingListV2",
      "jsonParts":
          "{\"Category\":-1,\"Classcode\":\"2020130610201\",\"Commentcount\":50,\"IsHasUploadWhere\":1,\"Iscomment\":1,\"Ispraised\":1,\"Loginuser\":\"2210317100415460\",\"Pageindex\":1,\"Pagesize\":10,\"Userid\":\"\",\"appsource\":\"2\",\"banzhurenoldclasscode\":\"2018130610705\",\"from\":1,\"isbanzhuren\":1,\"loginFamilyStudentUserId\":\"\",\"loginModel\":{\"MainUserId\":\"\",\"appsource\":\"2\",\"identity\":5,\"loginMode\":0,\"school\":\"1306\",\"schoolType\":\"幼\",\"studentUserId\":\"\",\"userAccountType\":0,\"userId\":\"2210317100415460\"},\"loginUserAccountType\":0,\"schoolType\":\"幼\",\"userType\":0,\"ver\":\"1.5.2\",\"xvbaseCategory\":-2}",
      "noce": "2112469923",
      "sKey": "57f77de51174d3d45c0562642e860b04",
      "unixTime": "1620455958"
    };
    var string = jsonEncode(json).toString();
    var result = ApiManager.post("/EventHandle", data: {"json": string});
    LogUtil.d(result);
  }
}
