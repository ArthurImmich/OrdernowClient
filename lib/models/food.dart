class Food {
  int id;
  String name;
  String url;
  double price;

  Food({
    this.id,
    this.name,
    this.url,
    this.price,
  });

  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    var json = Map<String, dynamic>();
    json['id'] = id;
    json['name'] = name;
    json['url'] = url;
    json['price'] = price;
    return json;
  }
}
