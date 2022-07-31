import 'package:flutter/material.dart';

import '../components/app_bar_component.dart';
import '../components/detailed_character.dart';
import '../data/repository.dart';
import '../models/detailed_character.dart';
import '../theme/app_colors.dart';

class DetailsPage extends StatefulWidget {
  static const routeId = '/details'; //mudei

  final int characterId;

  const DetailsPage({
    Key? key,
    required this.characterId,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<DetailedCharacter>? character;

  @override
  void initState() {
    character = Repository.getDetailsCharacters(widget.characterId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context, isSecondPage: true),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder<DetailedCharacter>(
        future: character,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;

            return DetailedCharacterCard(
              detailedCharacter: data,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Ocorreu um erro!',
                style: TextStyle(color: AppColors.white),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
