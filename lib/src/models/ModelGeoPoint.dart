import 'dart:convert';

class ModelGeoPoint {
  final double latitude;
  final double longitude;
  final int idx;
  ModelGeoPoint({
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.idx = 0,
  });

  ModelGeoPoint copyWith({
    double? latitude,
    double? longitude,
    int? idx,
  }) {
    return ModelGeoPoint(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      idx: idx ?? this.idx,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'idx': idx,
    };
  }

  factory ModelGeoPoint.fromMap(Map<String, dynamic> map) {
    return ModelGeoPoint(
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      idx: map['idx']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelGeoPoint.fromJson(String source) =>
      ModelGeoPoint.fromMap(json.decode(source));

  @override
  String toString() =>
      'ModelGeoPoint(latitude: $latitude, longitude: $longitude, idx: $idx)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelGeoPoint &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.idx == idx;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ idx.hashCode;
}
