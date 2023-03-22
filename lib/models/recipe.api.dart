import 'dart:convert';
// import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_list_app/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "20", "start": "0", "tag": "list.recipe.popular"});

    print(uri);

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "421e2de7e0msh8ed0adc5d517ab3p107cb4jsn367338fa7c40",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
