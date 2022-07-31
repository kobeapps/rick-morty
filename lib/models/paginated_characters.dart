class PaginatedCharacters {
  final Info info;
  final List<Character> results;

  PaginatedCharacters({
    required this.info,
    required this.results,
  });

  factory PaginatedCharacters.fromJson(Map<String, dynamic> json) {
    return PaginatedCharacters(
      info: Info.fromJson(json['info']),
      results:
          List.from(json['results']).map((e) => Character.fromJson(e)).toList(),
    );
  }
}

class Info {
  final int count;
  final int pages;
  final String next;
  final String prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'] ?? '',
    );
  }
}

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        url: json['url'],
        created: json['created'],
        image: json['image'],
        origin: Origin.fromJson(json['origin']),
        location: Location.fromJson(json['location']),
        episode: List.castFrom<dynamic, String>(json['episode']));
  }
}

class Origin {
  final String name;
  final String url;

  Origin({
    required this.name,
    required this.url,
  });

  factory Origin.fromJson(Map<String, dynamic> map) {
    return Origin(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }
}

class Location {
  final String name;
  final String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> map) {
    return Location(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }
}
