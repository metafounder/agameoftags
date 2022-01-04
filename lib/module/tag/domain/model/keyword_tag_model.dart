class KeywordTagsModel {
  Map<String, KeywordTagModel> keywordTags;

  KeywordTagsModel({
    required this.keywordTags,
  });

  factory KeywordTagsModel.fromJson(Map<String, dynamic> json) {
    final Map<String, KeywordTagModel> dataKeyword =
        <String, KeywordTagModel>{};

    json.forEach((key, value) {
      final keywordValue =
          KeywordTagModel.fromJson(json[key] as Map<String, dynamic>);
      dataKeyword[key] = keywordValue;
    });

    return KeywordTagsModel(keywordTags: dataKeyword);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};

    keywordTags.forEach((key, value) {
      final jsonValue = value.toJson();
      jsonData[key] = jsonValue;
    });

    return jsonData;
  }
}

class KeywordTagModel {
  bool value;

  KeywordTagModel({
    required this.value,
  });

  factory KeywordTagModel.fromJson(Map<String, dynamic> json) {
    return KeywordTagModel(
      value: json['value'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}
