import 'package:flutter_demo_design/config/models/items_fields_model.dart';

class ItemsModel{
  final int id;
  final String name;
  final String description;
  final String category;
  final String brand;
  final String price;
  final String image;
  final String gallery;
  final String country;
  final String weight;
  final String pricePromo;
  final String discountPercentage;
  final String supplier;
  final String quantity;

  ItemsModel({
    this.id,
    this.name,
    this.description,
    this.category,
    this.brand,
    this.price,
    this.image,
    this.gallery,
    this.country,
    this.weight,
    this.pricePromo,
    this.discountPercentage,
    this.supplier,
    this.quantity,
  });

  ItemsModel copy({
    int id,
    String name,
    String description,
    String category,
    String brand,
    String price,
    String image,
    String gallery,
    String country,
    String weight,
    String pricePromo,
    String discountPercentage,
    String supplier,
    String quantity,
}) => ItemsModel(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    category: category ?? this.category,
    brand: brand ?? this.brand,
    price: price ?? this.price,
    image: image ?? this.image,
    gallery: gallery ?? this.gallery,
    country: country ?? this.country,
    weight: weight ?? this.weight,
    pricePromo: pricePromo ?? this.pricePromo,
    discountPercentage: discountPercentage ?? this.discountPercentage,
    supplier: supplier ?? this.supplier,
    quantity: quantity ?? this.quantity,
  );

  Map<String, dynamic> toJson() => {
    ItemFields.id: id,
    ItemFields.name: name,
    ItemFields.description: description,
    ItemFields.category: category,
    ItemFields.brand: brand,
    ItemFields.price: price,
    ItemFields.image: image,
    ItemFields.gallery: gallery,
    ItemFields.country: country,
    ItemFields.weight: weight,
    ItemFields.pricePromo: pricePromo,
    ItemFields.discountPercentage: discountPercentage,
    ItemFields.supplier: supplier,
    ItemFields.quantity: quantity,
  };
}
