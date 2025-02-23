import 'dart:convert';

import 'package:flutter/foundation.dart';

class PlaceDetailModel {
  const PlaceDetailModel({
    required this.formattedAddress,
    required this.addressComponents,
    required this.geometry,
  });

  factory PlaceDetailModel.fromMap(Map<String, dynamic> map) =>
      PlaceDetailModel(
        formattedAddress: map['formatted_address'] as String,
        addressComponents: List<AddressComponent>.from(
          (map['address_components'] as List? ?? []).map<AddressComponent>(
            (x) => AddressComponent.fromMap(x as Map<String, dynamic>),
          ),
        ),
        geometry: Geometry.fromMap(map['geometry']),
      );

  factory PlaceDetailModel.fromJson(
    String source,
  ) =>
      PlaceDetailModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String formattedAddress;
  final List<AddressComponent> addressComponents;
  final Geometry geometry;

  String get building {
    final components = addressComponents
        .where((e) => [
              'subpremise',
            ].any((b) => e.types.contains(b)))
        .toList();
    return components.map((e) => e.longName).join(', ');
  }

  String get line1 {
    final components = addressComponents
        .where((e) => [
              'route',
              'sublocality_level_3',
              'premise',
              'neighborhood',
            ].any((b) => e.types.contains(b)))
        .toList();
    return components.map((e) => e.longName).join(', ');
  }

  String get line2 {
    final components = addressComponents
        .where((e) => [
              'sublocality_level_1',
              'sublocality_level_2',
              'locality',
            ].any((b) => e.types.contains(b)))
        .toList();
    return components.map((e) => e.longName).join(', ');
  }

  String get pincode {
    final components = addressComponents
        .where((e) => [
              'postal_code',
            ].any((b) => e.types.contains(b)))
        .toList();
    return components.map((e) => e.longName).join(', ');
  }

  String get city {
    final components = addressComponents
        .where((e) => [
              'administrative_area_level_3',
            ].any((b) => e.types.contains(b)))
        .toList();
    return components.map((e) => e.longName).join(', ');
  }

  String get state {
    final components = addressComponents
        .where((e) => [
              'administrative_area_level_1',
            ].any((b) => e.types.contains(b)))
        .toList();
    return components.map((e) => e.longName).join(', ');
  }

  PlaceDetailModel copyWith({
    String? formattedAddress,
    List<AddressComponent>? addressComponents,
    Geometry? geometry,
  }) =>
      PlaceDetailModel(
        addressComponents: addressComponents ?? this.addressComponents,
        formattedAddress: formattedAddress ?? this.formattedAddress,
        geometry: geometry ?? this.geometry,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'formatted_address': formattedAddress,
        'address_components': addressComponents.map((x) => x.toMap()).toList(),
        'geometry': geometry.toMap(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'PlaceDetailModel(formatted_address: $formattedAddress, address_components: $addressComponents, geometry: $geometry)';

  @override
  bool operator ==(covariant PlaceDetailModel other) {
    if (identical(this, other)) return true;

    return other.formattedAddress == formattedAddress &&
        listEquals(other.addressComponents, addressComponents) &&
        other.geometry == geometry;
  }

  @override
  int get hashCode =>
      formattedAddress.hashCode ^
      addressComponents.hashCode ^
      geometry.hashCode;
}

class AddressComponent {
  AddressComponent({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  factory AddressComponent.fromMap(Map<String, dynamic> map) =>
      AddressComponent(
        longName: map['long_name'] as String,
        shortName: map['short_name'] as String,
        types: List<String>.from(map['types'] as List),
      );

  factory AddressComponent.fromJson(
    String source,
  ) =>
      AddressComponent.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String longName;
  final String shortName;
  final List<String> types;

  AddressComponent copyWith({
    String? longName,
    String? shortName,
    List<String>? types,
  }) =>
      AddressComponent(
        longName: longName ?? this.longName,
        shortName: shortName ?? this.shortName,
        types: types ?? this.types,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'long_name': longName,
        'short_name': shortName,
        'types': types,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'AddressComponent(long_name: $longName, short_name: $shortName, types: $types)';

  @override
  bool operator ==(covariant AddressComponent other) {
    if (identical(this, other)) return true;

    return other.longName == longName &&
        other.shortName == shortName &&
        listEquals(other.types, types);
  }

  @override
  int get hashCode => longName.hashCode ^ shortName.hashCode ^ types.hashCode;
}

class Geometry {
  const Geometry({
    required this.lat,
    required this.lng,
  });

  factory Geometry.fromMap(Map<String, dynamic> map) => Geometry(
        lat: map['location']['lat'] as double,
        lng: map['location']['lng'] as double,
      );

  factory Geometry.fromJson(
    String source,
  ) =>
      Geometry.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final double lat;
  final double lng;

  Geometry copyWith({
    double? lat,
    double? lng,
  }) =>
      Geometry(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'lat': lat,
        'lng': lng,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Geometry(lat: $lat, lng: $lng)';

  @override
  bool operator ==(covariant Geometry other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}
