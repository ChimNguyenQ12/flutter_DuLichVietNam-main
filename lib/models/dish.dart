class Dish {
  int? id;
  String? name;
  String? body;
  String? image;
  String? address;
  int? place_id;

  Dish({
    this.id,
    this.name,
    this.body,
    this.image,
    this.address,
    this.place_id,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      name: json['name'],
      body: json['body'],
      address: json['address'],
      image: json['image'],
      place_id: json['place_id'],
      // user: User(
      //   id: json['user']['id'],
      //   name: json['user']['name'],
      // ),
    );
  }
}
