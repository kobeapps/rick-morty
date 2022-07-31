class DetailedCharacter {
  final int id;
  final String name;
  final String image;
  final String species;
  final String gender;
  final String status;
  final Location location;
  final Origin origin;
  final String type;
  final String url;
  final String created;
  final List<String> episode;

  DetailedCharacter({
    required this.id,
    required this.name,
    required this.image,
    required this.species,
    required this.gender,
    required this.status,
    required this.location,
    required this.origin,
    required this.type,
    required this.url,
    required this.created,
    required this.episode,
  });

  factory DetailedCharacter.fromJson(Map<String, dynamic> json) {
    return DetailedCharacter(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        species: json['species'],
        gender: json['gender'],
        status: json['status'],
        location: Location.fromJson(json['location']),
        origin: Origin.fromJson(json['origin']),
        type: json['type'],
        url: json['url'],
        created: json['created'],
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

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
      url: json['url'],
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

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      url: json['url'],
    );
  }
}
