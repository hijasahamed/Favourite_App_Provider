import 'package:english_words/english_words.dart';
import 'package:favourite_app/provider/favourite_provider.dart';
import 'package:favourite_app/screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(50).toList();
    final providerInstance=Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Words'),
        centerTitle: true,        
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context,index){
          final word=words[index];
          return ListTile(
            title: Text(word),
            trailing: IconButton(
              onPressed: (){
                providerInstance.toggleFavourite(word);
              }, 
              icon: providerInstance.isInFavourite(word)
              ? const Icon(Icons.favorite,color: Colors.red,) 
              : const Icon(Icons.favorite_border)
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          final route=MaterialPageRoute(builder: (context) => const FavouriteScreen(),);
          Navigator.push(context, route);
        },
        label: const Text('Favourite Button')
      ),
    );
  }
}