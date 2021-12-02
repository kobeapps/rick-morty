import 'package:flutter/material.dart';
import 'package:rick_morty/components/appBar.dart';
import 'package:rick_morty/components/detailed_character.dart';
import 'package:rick_morty/data/repository.dart';
import 'package:rick_morty/models/detailed_character.dart';
import 'package:rick_morty/theme/app_colors.dart';

class DetailsCharacterPage extends StatefulWidget {
  const DetailsCharacterPage({required this.id, Key? key}) : super(key: key);

  final int id;

  @override
  _DetailsCharacterPageState createState() => _DetailsCharacterPageState();
}

class _DetailsCharacterPageState extends State<DetailsCharacterPage> {
  Future<DetailedCharacter>? detailedCharacter;

  @override
  initState() {
    detailedCharacter = Repository.getDetailsCharacter(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context, isSecondPage: true),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: detailedCharacter,
        builder: (context, AsyncSnapshot<DetailedCharacter> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView(
              children: [
                DetailedCharacterCard(detailedCharacter: data),
              ],
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
