import 'package:json_annotation/json_annotation.dart';
import 'package:restaurants/firestore/models/item_details.dart';
import 'package:restaurants/firestore/models/location.dart';

@JsonSerializable()
class ItemModel {
  String id;
  List<String> photos;
  String imgU;
  String status;
  num price;
  String title;
  String name;
  Location location;
  List<ItemDetails> itemDetails;

  ItemModel({
    this.id,
    this.photos,
    this.imgU,
    this.status,
    this.price,
    this.title,
    this.name,
    this.location,
    this.itemDetails,
  });

  static ItemModel itemModelFromJson(Map<String, dynamic> json) => ItemModel(
        id: json['id'] as String,
        photos:
            (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
        imgU: json['imgU'] as String,
        status: json['status'] as String,
        price: json['price'] as num,
        title: json['title'] as String,
        name: json['name'] as String,
        location:
            Location.locationFromJson(json['location'] as Map<String, dynamic>),
        itemDetails: (json['itemDetails'] as List<dynamic>)
            .map((e) =>
                ItemDetails.itemDetailsFromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> itemModelToJson(ItemModel instance) => <String, dynamic>{
        'id': instance.id,
        'photos': instance.photos,
        'imgU': instance.imgU,
        'status': instance.status,
        'price': instance.price,
        'title': instance.title,
        'name': instance.name,
        'location': instance.location,
        'itemDetails': instance.itemDetails,
      };

  /* ItemModel.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.imgU = map['imgU'];
    this.status = map['status'];
    this.price = map['price'];
    // this.location = map['location'];
    // this.itemDetails = map['itemDetails'];
    // this.photos = map['photos'];
    this.id = map['id'];
  }

  toMap() {
    return {
      'name': this.name,
      'imgU': this.imgU,
      'status': this.status,
      'price': this.price,
      'title': this.title,
    };
  } */
}
