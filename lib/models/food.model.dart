typedef Json = Map<String, dynamic>;

class Food {
  int? id;
  String? name;
  String? url;
  double? price;

  Food({
    this.id,
    this.name,
    this.url,
    this.price,
  });

  Food.fromJson(Json json)
      : id = json['id'],
        name = json['name'],
        url = json['url'],
        price = json['price'];

  Json get json => {
        'id': id,
        'name': name,
        'url': url,
        'price': price,
      };
}
