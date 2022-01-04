import 'package:agameoftags/core/paginate/paginate.dart';
import 'package:agameoftags/module/tag/domain/model/geoloc_tag_model.dart';
import 'package:agameoftags/module/tag/domain/model/keyword_tag_model.dart';
import 'package:agameoftags/module/tag/domain/model/list_tag_model.dart';
import 'package:agameoftags/module/tag/domain/model/range_tag_model.dart';

enum TagType {
  keyword,
  list,
  geoloc,
  range,
  unknown,
}

extension Stringify on TagType {
  String stringify() {
    switch (this) {
      case TagType.keyword:
        return 'keyword';
      case TagType.list:
        return 'list';
      case TagType.geoloc:
        return 'geoloc';
      case TagType.range:
        return 'range';
      default:
        return 'unknown';
    }
  }
}

class TagCategoryModel {
  String name;
  int order;

  TagCategoryModel({
    required this.name,
    required this.order,
  });

  factory TagCategoryModel.fromJson(Map<String, dynamic> json) {
    return TagCategoryModel(
      name: json['name'] as String,
      order: json['order'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'order': order,
    };
  }
}

class TagModel implements Comparable<TagModel> {
  String languageCode;
  String id;
  TagCategoryModel category;
  String name;
  String type;
  AllowedListTagModel? allowedList;
  AllowedRangeTagsModel? allowedRange;
  String displayFormat;
  int sortOrder;
  String createdAt;
  String updatedAt;

  TagModel({
    required this.languageCode,
    required this.id,
    required this.category,
    required this.name,
    required this.type,
    this.allowedList,
    this.allowedRange,
    required this.displayFormat,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    final Map<String, String> list = <String, String>{};
    final Map<String, AllowedRangeTagModel> range = <String, AllowedRangeTagModel>{};

    if (json['allowedList'] != null) {
      final Map<String, dynamic> allowedList =
          json['allowedList'] as Map<String, dynamic>;
      for (final key in allowedList.keys) {
        list[key] = allowedList[key] as String;
      }
    }

    if (json['allowedRange'] != null) {
      final Map<String, dynamic> allowedRange =
          json['allowedRange'] as Map<String, dynamic>;
      for (final key in allowedRange.keys) {
        range[key] = AllowedRangeTagModel.fromJson(
          allowedRange[key] as Map<String, dynamic>,
        );
      }
    }

    return TagModel(
      languageCode: json["languageCode"] as String,
      id: json["id"] as String,
      category: TagCategoryModel.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      name: json["name"] as String,
      type: json["type"] as String,
      allowedList: json['allowedList'] == null
          ? null
          : AllowedListTagModel.fromJson(
              json['allowedList'] as Map<String, dynamic>,
            ),
      allowedRange: json["allowedRange"] == null
          ? null
          : AllowedRangeTagsModel.fromJson(
              json['allowedRange'] as Map<String, dynamic>,
            ),
      displayFormat: json["displayFormat"] as String,
      sortOrder: json["sortOrder"] as int,
      createdAt: json["createdAt"] as String,
      updatedAt: json["updatedAt"] as String,
    );
  }

  static List<TagModel> fromJsonArray(List<Map<String, dynamic>> jsonArray) {
    final List<TagModel> result = [];

    for (final element in jsonArray) {
      result.add(TagModel.fromJson(element));
    }

    return result;
  }

  Map<String, dynamic> toJson() {
    return {
      'languageCode': languageCode,
      'id': id,
      'category': category.toJson(),
      'name': name,
      'type': type,
      'allowedList': allowedList == null ? null : allowedList!.toJson(),
      'allowedRange': allowedRange == null ? null : allowedRange!.toJson(),
      'displayFormat': displayFormat,
      'sortOrder': sortOrder,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  int compareTo(TagModel other) {
    if (id.compareTo(other.id) == -1) {
      return -1;
    }

    if (id.compareTo(other.id) == 0) {
      if (category.order < other.category.order) {
        return -1;
      } else if (sortOrder == other.sortOrder) {
        return 0;
      } else {
        return 1;
      }
    }

    return 1;
  }
}

class TagsModel {
  RangeTagsModel? rangeTags;
  KeywordTagsModel? keywordTags;
  ListTagsModel? listTags;
  GeoLocTagsModel? geoLocTags;

  TagsModel({
    this.rangeTags,
    this.keywordTags,
    this.listTags,
    this.geoLocTags,
  });

  factory TagsModel.fromJson(Map<String, dynamic> json) {
    return TagsModel(
      rangeTags: json['rangeTags'] == null
          ? null
          : RangeTagsModel.fromJson(
              json['rangeTags'] as Map<String, dynamic>,
            ),
      keywordTags: json['keywordTags'] == null
          ? null
          : KeywordTagsModel.fromJson(
              json['keywordTags'] as Map<String, dynamic>,
            ),
      listTags: json['listTags'] == null
          ? null
          : ListTagsModel.fromJson(
              json['listTags'] as Map<String, dynamic>,
            ),
      geoLocTags: json['geoLocTags'] == null
          ? null
          : GeoLocTagsModel.fromJson(
              json['geoLocTags'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rangeTags': rangeTags == null ? null : rangeTags!.toJson(),
      'keywordTags': keywordTags == null ? null : keywordTags!.toJson(),
      'listTags': listTags == null ? null : listTags!.toJson(),
      'geoLocTags': geoLocTags == null ? null : geoLocTags!.toJson(),
    };
  }
}

class FilterTagsModel {
  RangeTagsOptionalModel? rangeTags;
  KeywordTagsModel? keywordTags;
  ListTagsModel? listTags;
  GeoLocTagsOptionalModel? geoLocTags;

  FilterTagsModel({
    this.rangeTags,
    this.keywordTags,
    this.listTags,
    this.geoLocTags,
  });

  factory FilterTagsModel.fromJson(Map<String, dynamic> json) {
    return FilterTagsModel(
      rangeTags: json['rangeTags'] == null
          ? null
          : RangeTagsOptionalModel.fromJson(
              json['rangeTags'] as Map<String, dynamic>,
            ),
      keywordTags: json['keywordTags'] == null
          ? null
          : KeywordTagsModel.fromJson(
              json['keywordTags'] as Map<String, dynamic>,
            ),
      listTags: json['listTags'] == null
          ? null
          : ListTagsModel.fromJson(
              json['listTags'] as Map<String, dynamic>,
            ),
      geoLocTags: json['geoLocTags'] == null
          ? null
          : GeoLocTagsOptionalModel.fromJson(
              json['geoLocTags'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rangeTags': rangeTags == null ? {} : rangeTags!.toJson(),
      'keywordTags': keywordTags == null ? {} : keywordTags!.toJson(),
      'listTags': listTags == null ? {} : listTags!.toJson(),
      'geoLocTags': geoLocTags == null ? {} : geoLocTags!.toJson(),
    };
  }
}

class TagsPaginatedModel {
  List<TagModel> data;
  Paginate? nextPage;

  TagsPaginatedModel({
    required this.data,
    this.nextPage,
  });
}
