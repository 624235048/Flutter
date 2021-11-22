// To parse this JSON data, do
//
//     final mansionModel = mansionModelFromJson(jsonString);

import 'dart:convert';

MansionModel mansionModelFromJson(String str) => MansionModel.fromJson(json.decode(str));

String mansionModelToJson(MansionModel data) => json.encode(data.toJson());

class MansionModel {
  MansionModel({
    this.mansions,
  });

  List<Mansion> mansions;

  factory MansionModel.fromJson(Map<String, dynamic> json) => MansionModel(
    mansions: List<Mansion>.from(json["mansions"].map((x) => Mansion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "mansions": List<dynamic>.from(mansions.map((x) => x.toJson())),
  };
}

class Mansion {
  Mansion({
    this.msId,
    this.msName,
    this.msPrice,
    this.msLocation,
    this.msPhone,
    this.msLimitedroom,
    this.msFacilities,
    this.msType,
    this.msImage,
    this.msReview,
    this.msImage2,
    this.msImage3,
    this.msImage4,
    this.msDetail
  });

  String msId;
  String msName;
  String msPrice;
  String msLocation;
  String msPhone;
  String msLimitedroom;
  String msFacilities;
  String msType;
  String msImage;
  String msReview;
  String msImage2;
  String msImage3;
  String msImage4;
  String msDetail;

  factory Mansion.fromJson(Map<String, dynamic> json) => Mansion(
    msId: json["ms_id"],
    msName: json["ms_name"],
    msPrice: json["ms_price"],
    msLocation: json["ms_location"],
    msPhone: json["ms_phone"],
    msLimitedroom: json["ms_limitedroom"],
    msFacilities: json["ms_facilities"],
    msType: json["ms_type"],
    msImage: json["ms_image"],
    msReview: json["ms_review"],
    msImage2: json["ms_image2"],
    msImage3: json["ms_image3"],
    msImage4: json["ms_image4"],
    msDetail: json['ms_detail'],
  );

  Map<String, dynamic> toJson() => {
    "ms_id": msId,
    "ms_name": msName,
    "ms_price": msPrice,
    "ms_location": msLocation,
    "ms_phone": msPhone,
    "ms_limitedroom": msLimitedroom,
    "ms_facilities": msFacilities,
    "ms_type": msType,
    "ms_image": msImage,
    "ms_review" : msReview,
    "ms_image2" : msImage2,
    "ms_image3" : msImage3,
    "ms_image4" : msImage4,
    "ms_detail" : msDetail
  };
}
