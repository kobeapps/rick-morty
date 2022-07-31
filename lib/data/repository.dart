import 'package:dio/dio.dart';

import '../models/detailed_character.dart';
import '../models/paginated_characters.dart';

abstract class Repository {
  static final _dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
  );

  static Future<PaginatedCharacters> getMoreData(int index) async {
    final res = await _dio.get('/character/?page=$index');

    final data = PaginatedCharacters.fromJson(res.data);

    return data;
  }

  static Future<PaginatedCharacters> getUpcomingCharacters() async {
    final res = await _dio.get('/character');

    final data = PaginatedCharacters.fromJson(res.data);

    return data;
  }

  static Future<DetailedCharacter> getDetailsCharacters(int characterId) async {
    final res = await _dio.get('/character/$characterId');

    final data = DetailedCharacter.fromJson(res.data);

    return data;
  }
}
