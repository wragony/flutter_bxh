/// Api接口返回模型
class ApiResponseInfo {
  int resultCode;
  String resultMessage;
  dynamic value;
  String synDate;

  bool get success => resultCode >= 1;

  ApiResponseInfo({this.resultCode, this.resultMessage, this.value, this.synDate});

  @override
  String toString() {
    return 'ApiResponseInfo{resultCode: $resultCode, resultMessage: $resultMessage, value: $value, synDate: $synDate}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    data['resultMessage'] = this.resultMessage;
    data['value'] = this.value;
    data['synDate'] = this.synDate;
    return data;
  }

  ApiResponseInfo.fromJson(Map<String, dynamic> json) {
    this.resultCode = json['resultCode'];
    this.resultMessage = json['resultMessage'];
    this.value = json['value'];
    this.synDate = json['synDate'];
  }
}

///
class ApiPageInfo<T> {
  ///总记录数
  int totalCount;

  ///当前页的数据集
  List<T> dataList;

  ApiPageInfo({this.totalCount, this.dataList});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['dataList'] = this.dataList;
    return data;
  }

  ApiPageInfo.fromJson(Map<String, dynamic> json) {
    this.totalCount = json['totalCount'];
    this.dataList = json['dataList'];
  }
}
