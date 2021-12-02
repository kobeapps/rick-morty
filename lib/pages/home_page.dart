import 'package:flutter/material.dart';
import 'package:rick_morty/components/appBar.dart';
import 'package:rick_morty/components/caracter_card.dart';
import 'package:rick_morty/data/repository.dart';
import 'package:rick_morty/models/paginated_characters.dart';

import 'package:rick_morty/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<PaginatedCharacters>? characters;

  @override
  initState() {
    characters = Repository.getUpcomingCaracters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: characters,
        builder: (context, AsyncSnapshot<PaginatedCharacters> snapshot) {
          if (snapshot.hasData) {
            final dataResults = snapshot.data!.results;
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 17),
              itemBuilder: (context, index) {
                return CharacterCard(
                  results: dataResults[index],
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/details',
                      arguments: dataResults[index].id,
                    );
                  },
                );
              },
              itemCount: dataResults.length,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Ocorreu um erro.",
                style: TextStyle(color: AppColors.white),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
