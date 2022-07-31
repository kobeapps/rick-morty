import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../components/app_bar_component.dart';
import '../components/character_card.dart';
import '../data/repository.dart';
import '../models/paginated_characters.dart';
import '../theme/app_colors.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int page = 2;
  final ScrollController _sc = ScrollController();
  bool isLoading = false;
  final dio = Dio();
  @override
  void initState() {
    characters = Repository.getUpcomingCharacters();
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        getMoreData(page);
      }
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  Future<PaginatedCharacters>? characters;

  @override
  Widget build(BuildContext context) {
    Widget _buildProgressIndicator() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Opacity(
            opacity: isLoading ? 1.0 : 00,
            child: const CircularProgressIndicator.adaptive(),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: appBarComponent(context),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
          future: characters,
          builder: (_, AsyncSnapshot<PaginatedCharacters> snapshot) {
            if (snapshot.hasData) {
              final dataResults = snapshot.data!.results;

              return ListView.separated(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: dataResults.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == dataResults.length) {
                      return _buildProgressIndicator();
                    } else {
                      final character = dataResults[index];

                      return CharacterCard(
                        characterCard: character,
                        onTap: () => Navigator.of(context).pushNamed(
                            DetailsPage.routeId,
                            arguments: character.id),
                      );
                    }
                  },
                  controller: _sc,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16));
            }

            return Container();
          }),
    );
  }

  void getMoreData(int index) async {
    final data = await Repository.getMoreData(index);
    final old = await characters;
    setState(() {
      isLoading = false;
      characters = Future.value(PaginatedCharacters(
          info: data.info, results: old!.results + data.results));
      page++;
    });
  }
}
