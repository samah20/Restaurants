import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Location {
  final String addres;
  final double lag;
  final double long;

  Location({this.addres, this.lag, this.long});

  static Location locationFromJson(Map<String, dynamic> json) => Location(
        addres: json['addres'] as String,
        lag: json['lag'] as double,
        long: json['long'] as double,
      );

  Map<String, dynamic> locationToJson(Location instance) => <String, dynamic>{
        'addres': instance.addres,
        'lag': instance.lag,
        'long': instance.long,
      };
}
