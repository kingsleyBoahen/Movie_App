import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MovieDetailsScreen extends StatelessWidget {
   MovieDetailsScreen({Key? key,this.CurrentIndex}) : super(key: key);

   int? CurrentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
              margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage("https://image.tmdb.org/t/p/w600_and_h900_bestv2/byKAndF6KQSDpGxp1mTr23jPbYp.jpg"),
                  fit: BoxFit.fill,
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context), 
                        icon: Icon(Icons.arrow_back_ios)),
                    ),
                    
                    Container(
                      height: 50,
                      color: Colors.black.withOpacity(0.3),
                       child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Material(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(FeatherIcons.playCircle),
                              ),
                            ),
                          )
                        ],
                       ),
                    ),
                  ],
                ),
              ),
            ),
          ),
           Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Wrap(
                children: [
                  Text(
                    "Description:",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20, fontWeight: FontWeight.bold), 
                    ),
                 ],
                ),
                  
                 Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text("Director:",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                 ),

                 Wrap(
                  children: [
                    Text("Producer:",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                 ),
              ],
          ),
            ))
        ],
      ),
    );
  }
}