import 'package:dio/dio.dart';
import 'package:rick_morty/models/detailed_character.dart';
import 'package:rick_morty/models/paginated_characters.dart';

abstract class Repository {
  static final _dio = Dio(
    BaseOptions(baseUrl: "https://rickandmortyapi.com/api"),
  );

  static Future<PaginatedCharacters> getUpcomingCaracters() async {
    var response = await _dio.get("/character");
    return PaginatedCharacters.fromJson(response.data);
  }

  static Future<DetailedCharacter> getDetailsCharacter(int id) async {
    var response = await _dio.get("/character/$id");
    return DetailedCharacter.fromJson(response.data);
  }
}
