typedef Json = Map<String, dynamic>;

class Restaurant {
  String? address;
  String? number;
  String? city;
  String? image;
  String? name;
  String? descricao;

  Restaurant(
      {this.address,
      this.number,
      this.city,
      this.image,
      this.name,
      this.descricao});

  Restaurant.fromJson(Json json)
      : address = json['address'],
        number = json['number'],
        city = json['city'],
        name = json['name'],
        descricao = json['descricao'];

  Json get json => {
        'name': name,
        'address': address,
        'number': number,
        'descricao': descricao,
        'image': image,
        'city': city,
      };
}
