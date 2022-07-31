import 'package:flutter/material.dart';

import '../models/paginated_characters.dart';

class SearchCharacter extends SearchDelegate {
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Character>>(
        //future: _charactersList.getCharacters(query: query),
        builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      List<Character>? data = snapshot.data;
      return ListView.builder(
          itemCount: data?.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${data?[index].id}',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data?[index].name}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ])
                ],
              ),
            );
          });
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search Characters'),
    );
  }
}
