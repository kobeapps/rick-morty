import 'package:flutter/material.dart';
import 'package:kobe_start_rick_morty/models/paginated_characters.dart';
import 'package:kobe_start_rick_morty/theme/app_colors.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.characterCard,
    this.onTap,
  }) : super(key: key);

  final Character characterCard;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              // character[index]['image'],
              characterCard.image,
              fit: BoxFit.fitWidth,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                characterCard.name.toUpperCase(),
                style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
