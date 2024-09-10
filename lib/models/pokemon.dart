// ignore_for_file: constant_identifier_names

class Pokemon {
  int? id;
  int? pokedexId;
  String? name;
  String? image;
  String? sprite;
  String? slug;
  Stats? stats;
  List<ApiType>? apiTypes;

  Pokemon(
      {this.id,
      this.pokedexId,
      this.name,
      this.image,
      this.sprite,
      this.slug,
      this.stats,
      this.apiTypes});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final List<ApiType>? temp = [];
    for (var element in json["apiTypes"]) {
      temp!.add(ApiType.fromJson(element));
    }
    return Pokemon(
      id: json["id"],
      pokedexId: json["pokedexId"],
      name: json["name"],
      image: json["image"],
      sprite: json["sprite"],
      slug: json["slug"],
      stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
      apiTypes: temp,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "pokedexId": pokedexId,
        "name": name,
        "image": image,
        "sprite": sprite,
        "slug": slug,
        "stats": stats?.toJson(),
        "apiTypes": apiTypes?.map((elt) => elt.toJson()).toList(),
      };
}

class Stats {
  Stats({
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
  });
  double? hp;
  double? attack;
  double? defense;
  double? specialAttack;
  double? specialDefense;
  double? speed;

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      hp: json['hp']?.toDouble(),
      attack: json['attack']?.toDouble(),
      defense: json['defense']?.toDouble(),
      specialAttack: json['specialAttack']?.toDouble(),
      specialDefense: json['specialDefense']?.toDouble(),
      speed: json['speed']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "hp": hp,
        "attack": attack,
        "defense": defense,
        "specialAttack": specialAttack,
        "specialDefense": specialDefense,
        "speed": speed,
      };
}

class ApiType {
  ApiType({
    this.name,
    this.image,
  });
  String? name;
  String? image;

  factory ApiType.fromJson(Map<String, dynamic> json) {
    return ApiType(
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
