class Place {
  final String name;
  final String description;
  final String price;
  final String location;
  final String image;

  Place(
      {required this.name,
      required this.description,
      required this.price,
      required this.location,
      required this.image});

  static Place fromJson(Map<String, dynamic> json) => Place(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      location: json['location'],
      image: json['image']);
}
