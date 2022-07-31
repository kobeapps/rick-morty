import 'package:flutter/material.dart';
import 'package:kobe_start_rick_morty/models/detailed_character.dart';
import 'package:kobe_start_rick_morty/theme/app_colors.dart';

class DetailedCharacterCard extends StatelessWidget {
  const DetailedCharacterCard({
    Key? key,
    required this.detailedCharacter,
  }) : super(key: key);

  final DetailedCharacter detailedCharacter;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        Card(
          color: AppColors.primaryColorLight,
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12, //mudei
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                detailedCharacter.image,
                fit: BoxFit.fitWidth,
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 16,
                  right: 16,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detailedCharacter.name.toUpperCase(),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 14.5,
                      ),
                    ),
                    const SizedBox(height: 38),
                    Row(
                      children: [
                        detailedCharacter.status == "Alive"
                            ? Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.white),
                                  shape: BoxShape.circle,
                                  color: AppColors.aliveGreen,
                                ),
                              )
                            : detailedCharacter.status == "Dead"
                                ? Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.white),
                                      shape: BoxShape.circle,
                                      color: AppColors.deadRed,
                                    ),
                                  )
                                : Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.white),
                                      shape: BoxShape.circle,
                                      color: AppColors.unknownGrey,
                                    ),
                                  ),
                        const SizedBox(height: 18),
                        Text(
                          "   ${detailedCharacter.status} - ${detailedCharacter.species} - ${detailedCharacter.gender}",
                          style: const TextStyle(
                            fontSize: 12.5,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Last know location:",
                      style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w300,
                          color: AppColors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      detailedCharacter.location.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.5,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "First seen in:",
                      style: TextStyle(fontSize: 12.5, color: AppColors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      detailedCharacter.origin.name,
                      style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
