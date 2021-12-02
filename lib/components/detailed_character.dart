import 'package:flutter/material.dart';
import 'package:rick_morty/models/detailed_character.dart';

import 'package:rick_morty/theme/app_colors.dart';

class DetailedCharacterCard extends StatelessWidget {
  const DetailedCharacterCard({required this.detailedCharacter, Key? key})
      : super(key: key);

  final DetailedCharacter detailedCharacter;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            "${detailedCharacter.image}",
            fit: BoxFit.fitWidth,
            height: 160,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${detailedCharacter.name.toUpperCase()}",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5,
                  ),
                ),
                SizedBox(height: 38),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                    ),
                    Text(
                        "       ${detailedCharacter.status} - (${detailedCharacter.species})",
                        style: TextStyle(
                          fontSize: 12.5,
                          color: AppColors.white,
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "Last know location:",
                  style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.normal,
                      color: AppColors.white),
                ),
                SizedBox(height: 4),
                Text(
                  "${detailedCharacter.location.name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "First seen in:",
                  style: TextStyle(fontSize: 12, color: AppColors.white),
                ),
                SizedBox(height: 4),
                Text(
                  "${detailedCharacter.origin.name}",
                  style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
                SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
