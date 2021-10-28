class ItemFields{
  static final String id = 'id';
  static final String name = 'name';
  static final String description = 'description';
  static final String category = 'category';
  static final String brand = 'brand';
  static final String price = 'price';
  static final String image = 'image';
  static final String gallery = 'gallery';
  static final String country = 'country';
  static final String weight = 'weight';
  static final String pricePromo = 'price_promo';
  static final String discountPercentage = 'discount_percentage';
  static final String supplier = 'supplier';
  static final String quantity = 'quantity';

  static List<String> getFields() => [
    id,
    name,
    description,
    category,
    brand,
    price,
    image,
    gallery,
    country,
    weight,
    pricePromo,
    discountPercentage,
    supplier,
    quantity,
  ];
}