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
    var data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['price'] = price;
    return data;
  }
}
