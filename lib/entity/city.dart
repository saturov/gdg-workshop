class City {
  final int id;
  final String name;

  City(this.id, this.name);

  City.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
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
