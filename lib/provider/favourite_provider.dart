import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier{
  List<String> wordsList = [];
  List<String> get favouritewords=>wordsList;

  void toggleFavourite(String favWord){
    final isExist=wordsList.contains(favWord);
    if(isExist){
      wordsList.remove(favWord);
    }
    else{
      wordsList.add(favWord);
    }
    notifyListeners();
  }

  void clearFavourite(){
    wordsList=[];
    notifyListeners();
  }

  bool isInFavourite(String word){
    final isInFavourite=wordsList.contains(word);
    return isInFavourite;
  }

}