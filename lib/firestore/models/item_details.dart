import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:restaurants/firestore/models/item_details.dart';
import 'package:restaurants/firestore/models/location.dart';

@JsonSerializable()
class ItemDetails {
  final XFile imageFile;
  String imageUrl;
  final String title;

  ItemDetails({
    this.imageFile,
    this.imageUrl,
    this.title,
  });

  static ItemDetails itemDetailsFromJson(Map<String, dynamic> json) =>
      ItemDetails(
        imageUrl: json['image'] as String,
        title: json['title'] as String,
      );

  Map<String, dynamic> itemDetailsToJson(ItemDetails instance) =>
      <String, dynamic>{
        'image': instance.imageUrl,
        'title': instance.title,
      };
}
