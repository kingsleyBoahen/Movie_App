import 'package:http/http.dart';

class AllMoviesNetwork {
  ////Create a method to get the data from the API
  
  getAllMovies() async{
    final response = await get(Uri.parse("https://ghibliapi.herokuapp.com/films"));


////Check if the data is available
         if(response.statusCode == 200) {
          print(response.body);
         }else {
          print(response.statusCode);
         }
  }
}
