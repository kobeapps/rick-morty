import 'package:flutter/material.dart';
import 'package:rick_morty/models/paginated_characters.dart';
import 'package:rick_morty/theme/app_colors.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.results, required this.onTap, Key? key})
      : super(key: key);

  final Results results;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              "${results.image}",
              fit: BoxFit.fitWidth,
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "${results.name.toUpperCase()})",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 14.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
