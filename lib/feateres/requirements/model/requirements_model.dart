// To parse this JSON data, do
//
//     final venderRequirements = venderRequirementsFromJson(jsonString);

import 'dart:convert';

List<VenderRequirements> venderRequirementsFromJson(String str) =>
    List<VenderRequirements>.from(
        json.decode(str).map((x) => VenderRequirements.fromJson(x)));

String venderRequirementsToJson(List<VenderRequirements> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VenderRequirements {
  int id;
  int fkVehicleTypeId;
  int fkBrandId;
  int fkVehicleModelId;
  int fkVehicleVariantId;
  int fkTransmissionId;
  int fkFuelTypeId;
  int fkVehicleColorId;
  String year;
  String status;
  Brand vehicleType;
  Brand brand;
  Brand vehicleModel;
  Brand vehicleVariant;
  Brand transmission;
  Brand fuelType;
  Brand vehicleColor;

  VenderRequirements({
    required this.id,
    required this.fkVehicleTypeId,
    required this.fkBrandId,
    required this.fkVehicleModelId,
    required this.fkVehicleVariantId,
    required this.fkTransmissionId,
    required this.fkFuelTypeId,
    required this.fkVehicleColorId,
    required this.year,
    required this.status,
    required this.vehicleType,
    required this.brand,
    required this.vehicleModel,
    required this.vehicleVariant,
    required this.transmission,
    required this.fuelType,
    required this.vehicleColor,
  });

  factory VenderRequirements.fromJson(Map<String, dynamic> json) =>
      VenderRequirements(
        id: json["id"],
        fkVehicleTypeId: json["fk_vehicle_type_id"],
        fkBrandId: json["fk_brand_id"],
        fkVehicleModelId: json["fk_vehicle_model_id"],
        fkVehicleVariantId: json["fk_vehicle_variant_id"],
        fkTransmissionId: json["fk_transmission_id"],
        fkFuelTypeId: json["fk_fuel_type_id"],
        fkVehicleColorId: json["fk_vehicle_color_id"],
        year: json["year"],
        status: json["status"],
        vehicleType: Brand.fromJson(json["vehicle_type"]),
        brand: Brand.fromJson(json["brand"]),
        vehicleModel: Brand.fromJson(json["vehicle_model"]),
        vehicleVariant: Brand.fromJson(json["vehicle_variant"]),
        transmission: Brand.fromJson(json["transmission"]),
        fuelType: Brand.fromJson(json["fuel_type"]),
        vehicleColor: Brand.fromJson(json["vehicle_color"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fk_vehicle_type_id": fkVehicleTypeId,
        "fk_brand_id": fkBrandId,
        "fk_vehicle_model_id": fkVehicleModelId,
        "fk_vehicle_variant_id": fkVehicleVariantId,
        "fk_transmission_id": fkTransmissionId,
        "fk_fuel_type_id": fkFuelTypeId,
        "fk_vehicle_color_id": fkVehicleColorId,
        "year": year,
        "status": status,
        "vehicle_type": vehicleType.toJson(),
        "brand": brand.toJson(),
        "vehicle_model": vehicleModel.toJson(),
        "vehicle_variant": vehicleVariant.toJson(),
        "transmission": transmission.toJson(),
        "fuel_type": fuelType.toJson(),
        "vehicle_color": vehicleColor.toJson(),
      };
}

class Brand {
  int id;
  String name;

  Brand({
    required this.id,
    required this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
