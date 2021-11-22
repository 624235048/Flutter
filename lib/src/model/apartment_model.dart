// To parse this JSON data, do
//
//     final apartmentModel = apartmentModelFromJson(jsonString);

import 'dart:convert';

ApartmentModel apartmentModelFromJson(String str) => ApartmentModel.fromJson(json.decode(str));

String apartmentModelToJson(ApartmentModel data) => json.encode(data.toJson());

class ApartmentModel {
  ApartmentModel({
    this.apartments,
  });

  List<Apartment> apartments;

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
    apartments: List<Apartment>.from(json["apartments"].map((x) => Apartment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "apartments": List<dynamic>.from(apartments.map((x) => x.toJson())),
  };
}

class Apartment {
  Apartment({
    this.apmId,
    this.apmName,
    this.apmPrice,
    this.apmLocation,
    this.apmPhone,
    this.apmLimitedroom,
    this.apmFacilities,
    this.apmType,
    this.apmDetail,
    this.apmImage,
    this.apmReview,
    this.apmImage2,
    this.apmImage3,
    this.apmImage4,
  });

  String apmId;
  String apmName;
  String apmPrice;
  String apmLocation;
  String apmPhone;
  String apmLimitedroom;
  String apmFacilities;
  String apmType;
  String apmDetail;
  String apmImage;
  String apmReview;
  String apmImage2;
  String apmImage3;
  String apmImage4;

  factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
    apmId: json["apm_id"],
    apmName: json["apm_name"],
    apmPrice: json["apm_price"],
    apmLocation: json["apm_location"],
    apmPhone: json["apm_phone"] == null ? null : json["apm_phone"],
    apmLimitedroom: json["apm_limitedroom"],
    apmFacilities: json["apm_facilities"],
    apmType: json["apm_type"],
    apmDetail: json["apm_detail"] == null ? null : json["apm_detail"],
    apmImage: json["apm_image"],
    apmReview: json["apm_review"],
    apmImage2: json["apm_image2"],
    apmImage3: json["apm_image3"],
    apmImage4: json["apm_image4"],
  );

  Map<String, dynamic> toJson() => {
    "apm_id": apmId,
    "apm_name": apmName,
    "apm_price": apmPrice,
    "apm_location": apmLocation,
    "apm_phone": apmPhone == null ? null : apmPhone,
    "apm_limitedroom": apmLimitedroom,
    "apm_facilities": apmFacilities,
    "apm_type": apmType,
    "apm_detail": apmDetail == null ? null : apmDetail,
    "apm_image": apmImage,
    "apm_review": apmReview,
    "apm_image2": apmImage2,
    "apm_image3": apmImage3,
    "apm_image4": apmImage4,
  };
}
