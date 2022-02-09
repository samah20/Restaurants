import 'dart:ffi';

class ItemModel {
  final List<String> photos;
  final String status;
  final String price;
  final String title;
  final Location location;
  final List<ItemDetails> itemDetails;

  ItemModel({
    this.photos,
    this.status,
    this.price,
    this.title,
    this.location,
    this.itemDetails,
  });
}

class Location {
  final String addres;
  final String lag;
  final String long;

  Location({this.addres, this.lag, this.long});
}

class ItemDetails {
  final String image;
  final String title;

  ItemDetails({
    this.image,
    this.title,
  });
}

class Duration {
  bool isSelcted = false;
  final String title;
  final int value;

  Duration({
    this.isSelcted = false,
    this.title,
    this.value,
  });
}

List<Duration> duration = [
  Duration(isSelcted: true, title: "1 hr", value: 1),
  Duration(title: "1 hr", value: 1),
  Duration(title: "4 hr", value: 4),
  Duration(title: "8 hr", value: 8),
  Duration(title: "12 hr", value: 12),
];
