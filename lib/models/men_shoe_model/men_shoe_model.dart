
import 'dart:convert';

Map<String, Welcome> welcomeFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Welcome>(k, Welcome.fromJson(v)));

class Welcome {
  final int id;
  final String name;
  final Brand brand;
  final Gender gender;
  final Category category;
  final int price;
  final bool isInInventory;
  final int itemsLeft;
  final String imageUrl;
  final String slug;

  Welcome({
    required this.id,
    required this.name,
    required this.brand,
    required this.gender,
    required this.category,
    required this.price,
    required this.isInInventory,
    required this.itemsLeft,
    required this.imageUrl,
    required this.slug,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["id"],
    name: json["name"],
    brand: brandValues.map[json["brand"]]!,
    gender: genderValues.map[json["gender"]]!,
    category: categoryValues.map[json["category"]]!,
    price: json["price"],
    isInInventory: json["is_in_inventory"],
    itemsLeft: json["items_left"],
    imageUrl: json["imageURL"],
    slug: json["slug"],
  );

}

enum Brand {
  ADIDAS,
  HUSHPUPPIES,
  NIKE,
  REEBOK,
  VANS
}

final brandValues = EnumValues({
  "ADIDAS": Brand.ADIDAS,
  "HUSHPUPPIES": Brand.HUSHPUPPIES,
  "NIKE": Brand.NIKE,
  "Reebok": Brand.REEBOK,
  "Vans": Brand.VANS
});

enum Category {
  CASUAL,
  FOOTBALL,
  FORMAL,
  RUNNING
}

final categoryValues = EnumValues({
  "CASUAL": Category.CASUAL,
  "FOOTBALL": Category.FOOTBALL,
  "FORMAL": Category.FORMAL,
  "RUNNING": Category.RUNNING
});

enum Gender {
  KIDS,
  MEN,
  WOMEN
}

final genderValues = EnumValues({
  "KIDS": Gender.KIDS,
  "MEN": Gender.MEN,
  "WOMEN": Gender.WOMEN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
