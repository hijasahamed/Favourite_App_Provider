import 'package:favourite_app/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final providerInstance = Provider.of<FavouriteProvider>(context);
    final words = providerInstance.favouritewords;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: words.isEmpty
          ? const Center(
              child: Text('No Favourites',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            )
          : ListView.builder(
              itemCount: words.length,
              itemBuilder: (context, index) {
                final word = words[index];
                return Card(
                  elevation: 5,
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text('${index + 1}. '),
                          Text(word),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
