class AllowedListTagModel {
  Map<String, String> allowedList;

  AllowedListTagModel({
    required this.allowedList,
  });

  factory AllowedListTagModel.fromJson(Map<String, dynamic> json) {
    final Map<String, String> list = <String, String>{};

    json.forEach((key, value) {
      list[key] = json[key] as String;
    });

    return AllowedListTagModel(allowedList: list);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> list = <String, dynamic>{};

    allowedList.forEach((key, value) {
      list[key] = allowedList[key];
    });

    return list;
  }
}

class ListTagsModel {
  Map<String, ListTagModel> listTags;

  ListTagsModel({
    required this.listTags,
  });

  factory ListTagsModel.fromJson(Map<String, dynamic> json) {
    final Map<String, ListTagModel> dataList = <String, ListTagModel>{};

    json.forEach((key, value) {
      final listValue =
          ListTagModel.fromJson(json[key] as Map<String, dynamic>);
      dataList[key] = listValue;
    });

    return ListTagsModel(listTags: dataList);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    listTags.forEach((key, value) {
      final jsonValue = value.toJson();
      jsonData[key] = jsonValue;
    });
    return jsonData;
  }
}

class ListTagModel {
  List<String> values;

  ListTagModel({
    required this.values,
  });

  factory ListTagModel.fromJson(Map<String, dynamic> json) {
    return ListTagModel(
      values:
          (json['values'] as List<dynamic>).map((s) => s as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'values': values,
    };
  }
}
