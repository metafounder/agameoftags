class GeoPoint {
  String lat;
  String lon;

  GeoPoint({
    required this.lat,
    required this.lon,
  });

  factory GeoPoint.fromJson(Map<String, dynamic> json) {
    return GeoPoint(
      lat: json["lat"] as String,
      lon: json["lon"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
    };
  }
}

class GeoLocTagModel {
  String country;
  String state;
  String settlement;
  String placeName;
  GeoPoint geoPoint;

  GeoLocTagModel({
    required this.country,
    required this.state,
    required this.settlement,
    required this.placeName,
    required this.geoPoint,
  });

  factory GeoLocTagModel.fromJson(Map<String, dynamic> json) {
    return GeoLocTagModel(
      country: json["country"] as String,
      state: json["state"] as String,
      settlement: json["settlement"] as String,
      placeName: json["placeName"] as String,
      geoPoint: GeoPoint.fromJson(
        json["geoPoint"] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'state': state,
      'settlement': settlement,
      'placeName': placeName,
      'geoPoint': geoPoint.toJson(),
    };
  }
}

class GeoLocTagsModel {
  Map<String, GeoLocTagModel> geoLocTags;

  GeoLocTagsModel({
    required this.geoLocTags,
  });

  factory GeoLocTagsModel.fromJson(Map<String, dynamic> json) {
    final Map<String, GeoLocTagModel> dataGeoLoc = <String, GeoLocTagModel>{};

    json.forEach((key, value) {
      final geoLocValue =
          GeoLocTagModel.fromJson(json[key] as Map<String, dynamic>);
      dataGeoLoc[key] = geoLocValue;
    });

    return GeoLocTagsModel(geoLocTags: dataGeoLoc);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};

    geoLocTags.forEach((key, value) {
      final jsonValue = value.toJson();
      jsonData[key] = jsonValue;
    });

    return jsonData;
  }
}

class GeoLocTagsOptionalModel {
  Map<String, GeoLocTagOptionalModel> geoLocTagsOptional;

  GeoLocTagsOptionalModel({
    required this.geoLocTagsOptional,
  });

  factory GeoLocTagsOptionalModel.fromJson(Map<String, dynamic> json) {
    final Map<String, GeoLocTagOptionalModel> dataGeoLoc =
        <String, GeoLocTagOptionalModel>{};

    json.forEach((key, value) {
      final geoLocValue =
          GeoLocTagOptionalModel.fromJson(json[key] as Map<String, dynamic>);
      dataGeoLoc[key] = geoLocValue;
    });

    return GeoLocTagsOptionalModel(geoLocTagsOptional: dataGeoLoc);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};

    geoLocTagsOptional.forEach((key, value) {
      final jsonValue = value.toJson();
      jsonData[key] = jsonValue;
    });

    return jsonData;
  }
}

class GeoLocTagOptionalModel {
  String? country;
  String? state;
  String? settlement;
  String? placeName;
  GeoPoint? geoPoint;

  GeoLocTagOptionalModel({
    this.country,
    this.state,
    this.settlement,
    this.placeName,
    this.geoPoint,
  });

  factory GeoLocTagOptionalModel.fromJson(Map<String, dynamic> json) {
    return GeoLocTagOptionalModel(
      country: json["country"] == null ? null : json["country"] as String,
      state: json["state"] == null ? null : json["state"] as String,
      settlement:
          json["settlement"] == null ? null : json["settlement"] as String,
      geoPoint: json["geoPoint"] == null
          ? null
          : GeoPoint.fromJson(
              json["geoPoint"] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'state': state,
      'settlement': settlement,
      'geoPoint': geoPoint == null ? null : geoPoint!.toJson(),
    };
  }
}
