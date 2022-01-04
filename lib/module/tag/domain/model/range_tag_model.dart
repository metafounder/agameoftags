class AllowedRangeTagModel {
  List<int> interval;
  int increment;
  String unitName;

  AllowedRangeTagModel({
    required this.interval,
    required this.increment,
    required this.unitName,
  });

  factory AllowedRangeTagModel.fromJson(Map<String, dynamic> json) {
    return AllowedRangeTagModel(
      interval:
          (json["interval"] as List<dynamic>).map((s) => s as int).toList(),
      increment: json["increment"] as int,
      unitName: json["unitName"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'interval': interval,
      'increment': increment,
      'unitName': unitName,
    };
  }
}

class AllowedRangeTagsModel {
  Map<String, AllowedRangeTagModel> allowedRangeTags;

  AllowedRangeTagsModel({
    required this.allowedRangeTags,
  });

  factory AllowedRangeTagsModel.fromJson(Map<String, dynamic> json) {
    final Map<String, AllowedRangeTagModel> range = <String, AllowedRangeTagModel>{};

    json.forEach((key, value) {
      range[key] = AllowedRangeTagModel.fromJson(
        json[key] as Map<String, dynamic>,
      );
    });

    return AllowedRangeTagsModel(allowedRangeTags: range);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> list = <String, dynamic>{};

    allowedRangeTags.forEach((key, value) {
      list[key] = allowedRangeTags[key]?.toJson();
    });

    return list;
  }
}

class RangeTagModel {
  int fromValue;
  int toValue;
  String unitId;

  RangeTagModel({
    required this.fromValue,
    required this.toValue,
    required this.unitId,
  });

  factory RangeTagModel.fromJson(Map<String, dynamic> json) {
    return RangeTagModel(
      fromValue: json["fromValue"] as int,
      toValue: json["toValue"] as int,
      unitId: json["unitId"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromValue': fromValue,
      'toValue': toValue,
      'unitId': unitId,
    };
  }
}

class RangeTagsModel {
  Map<String, RangeTagModel> rangeTags;

  RangeTagsModel({
    required this.rangeTags,
  });

  factory RangeTagsModel.fromJson(Map<String, dynamic> json) {
    final Map<String, RangeTagModel> dataRanges = <String, RangeTagModel>{};

    json.forEach((key, value) {
      final rangeValue =
          RangeTagModel.fromJson(json[key] as Map<String, dynamic>);
      dataRanges[key] = rangeValue;
    });

    return RangeTagsModel(rangeTags: dataRanges);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};

    rangeTags.forEach((key, value) {
      final jsonValue = value.toJson();
      jsonData[key] = jsonValue;
    });

    return jsonData;
  }
}

class RangeTagOptionalModel {
  int? fromValue;
  int? toValue;
  String unitId;

  RangeTagOptionalModel({
    this.fromValue,
    this.toValue,
    required this.unitId,
  });

  factory RangeTagOptionalModel.fromJson(Map<String, dynamic> json) {
    return RangeTagOptionalModel(
      fromValue: json["fromValue"] == null ? null : json["fromValue"] as int,
      toValue: json["toValue"] == null ? null : json["toValue"] as int,
      unitId: json["unitId"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromValue': fromValue,
      'toValue': toValue,
      'unitId': unitId,
    };
  }
}

class RangeTagsOptionalModel {
  Map<String, RangeTagOptionalModel> rangeTagsOptional;

  RangeTagsOptionalModel({
    required this.rangeTagsOptional,
  });

  factory RangeTagsOptionalModel.fromJson(Map<String, dynamic> json) {
    final Map<String, RangeTagOptionalModel> dataRanges =
        <String, RangeTagOptionalModel>{};

    json.forEach((key, value) {
      final rangeValue =
          RangeTagOptionalModel.fromJson(json[key] as Map<String, dynamic>);
      dataRanges[key] = rangeValue;
    });

    return RangeTagsOptionalModel(rangeTagsOptional: dataRanges);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};

    rangeTagsOptional.forEach((key, value) {
      final jsonValue = value.toJson();
      jsonData[key] = jsonValue;
    });

    return jsonData;
  }
}
