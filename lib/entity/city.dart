class City {
  final int id;
  final String name;
  final String imageUrl;
  final String description;

  City(this.id, this.name, this.imageUrl, this.description);

  City.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl = json['image'] ?? "",
        description = json['description'] ?? "";

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': imageUrl,
        'description': description,
      };
}

class CityList {
  List<City> citiesList;

  CityList(this.citiesList);

  CityList.fromMappedJson(Map<String, dynamic> json) {
    var list = json['cities'] as List;
    citiesList = list.map((i) => City.fromMappedJson(i)).toList();
  }
}
