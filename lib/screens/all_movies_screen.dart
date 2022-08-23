import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:movie_app/Network/all_movies_network.dart';
import 'package:movie_app/screens/movie_details_screen.dart';

class AllMoviesScreen extends StatefulWidget {
  const AllMoviesScreen({Key? key}) : super(key: key);

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
AllMoviesNetwork _allMoviesNetwork = AllMoviesNetwork();

  @override
  void initState() {
    _allMoviesNetwork.getAllMovies();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8E7E7),
      appBar: allmoviesApp(context),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
         return GestureDetector(
          child: MovieCard(),
          onTap: () {

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MovieDetailsScreen(CurrentIndex: index,);
                  },
                ),
              );
            },
          ); 
        }
      ),
    );
  }

  AppBar allmoviesApp(BuildContext context) {
    return AppBar(title: Text(
      "Timeline",
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
             fontSize: 20,
             fontWeight: FontWeight.bold,
           ),
      ),
    backgroundColor: Colors.grey.withOpacity(0.5),
    centerTitle: true,
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const[
                  Text("Release Date"),
                  Icon(Icons.more_horiz),
                ],
              ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(0, 5),
                        ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(FeatherIcons.heart),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(FeatherIcons.messageCircle),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(FeatherIcons.cornerUpRight),
                      ),
                     ],
                   ),
                  Row(
                     children: const [
                      Icon(Icons.star),
                      Text("4.5"),
                     ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}