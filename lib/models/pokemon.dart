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
  List<ApiResistance>? apiResistances;
  List<ApiEvolution>? apiEvolutions;
  ApiPreEvolution? apiPreEvolution;

  Pokemon({
    this.id,
    this.pokedexId,
    this.name,
    this.image,
    this.sprite,
    this.slug,
    this.stats,
    this.apiTypes,
    this.apiResistances,
    this.apiEvolutions,
    this.apiPreEvolution,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final List<ApiType> temp = [];
    final List<ApiEvolution> evol = [];
    final List<ApiResistance> resist = [];
    for (var element in json["apiTypes"]) {
      temp.add(ApiType.fromJson(element));
    }
    for (var element in (json["apiEvolutions"] ?? [])) {
      evol.add(ApiEvolution.fromJson(element));
    }

    for (var element in (json["apiResistances"] ?? [])) {
      resist.add(ApiResistance.fromJson(element));
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
      apiEvolutions: evol,
      apiPreEvolution: json["apiPreEvolution"] == "none"
          ? null
          : ApiPreEvolution.fromJson(json["apiPreEvolution"]),
      apiResistances: resist,
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
        "apiEvolutions": apiEvolutions?.map((elt) => elt.toJson()).toList(),
        "apiPreEvolutions": apiPreEvolution!.toJson(),
        "apiResistances": apiResistances?.map((elt) => elt.toJson()).toList(),
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
      hp: json['HP']?.toDouble(),
      attack: json['attack']?.toDouble(),
      defense: json['defense']?.toDouble(),
      specialAttack: json['special_attack']?.toDouble(),
      specialDefense: json['special_defense']?.toDouble(),
      speed: json['speed']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "HP": hp,
        "attack": attack,
        "defense": defense,
        "special_attack": specialAttack,
        "special_defense": specialDefense,
        "speed": speed,
      };

  double sumAll() {
    double temp = 0;
    List<double?> tempList = [
      hp,
      attack,
      defense,
      specialAttack,
      specialDefense,
      speed
    ];
    for (var element in tempList) {
      if (element != null) {
        temp += element;
      }
    }
    return temp;
  }
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

class ApiEvolution {
  String? name;
  int? pokedexId;

  ApiEvolution({
    this.name,
    this.pokedexId,
  });

  factory ApiEvolution.fromJson(Map<String, dynamic> json) => ApiEvolution(
        name: json["name"],
        pokedexId: json["pokedexId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "pokedexId": pokedexId,
      };
}

class ApiPreEvolution {
  String? name;
  int? pokedexIdd;

  ApiPreEvolution({
    this.name,
    this.pokedexIdd,
  });

  factory ApiPreEvolution.fromJson(Map<String, dynamic> json) =>
      ApiPreEvolution(
        name: json["name"],
        pokedexIdd: json["pokedexIdd"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "pokedexIdd": pokedexIdd,
      };
}

class ApiResistance {
  String? name;
  double? damageMultiplier;
  String? damageRelation;

  ApiResistance({
    this.name,
    this.damageMultiplier,
    this.damageRelation,
  });

  factory ApiResistance.fromJson(Map<String, dynamic> json) => ApiResistance(
        name: json["name"],
        damageMultiplier: json["damage_multiplier"]?.toDouble(),
        damageRelation: json["damage_relation"].toString().toUpperCase(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "damage_multiplier": damageMultiplier,
        "damage_relation": name!.toLowerCase(),
      };
}
