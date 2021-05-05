class Restaurant {
  String adress;
  String number;
  String city;
  String image;
  String name;
  String descricao;

  Restaurant(
      {this.adress,
      this.number,
      this.city,
      this.image,
      this.name,
      this.descricao});

  void fromJson(Map<String, dynamic> json) {
    adress = json['adress'];
    number = json['number'];
    city = json['city'];
    name = json['name'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    var json = Map<String, dynamic>();
    json['adress'] = adress;
    json['number'] = number;
    json['city'] = city;
    json['image'] = image;
    json['name'] = name;
    json['descricao'] = descricao;
    return json;
  }
}
