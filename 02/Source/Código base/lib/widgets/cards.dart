import 'package:flutter/material.dart';
import 'package:flutter_talks/pages/pet_details.dart';

class PetCard extends StatelessWidget{

  final String title;
  final String age;
  final String species;
  final String genre;
  final String size;
  final String image;

  PetCard({@required this.title, @required this.age, @required this.species, @required this.genre, @required this.size, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => PetDetails(
                title: title,
                age: age,
                species: species,
                genre: genre,
                size: size,
                image: image
              ),
            )
          );
        },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 111,
                      height: 148,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.topCenter,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  //info
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 14, 16, 2),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 222,
                              child: Text(title, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subhead,),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 12, 14, 2),
                            child: Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 14, 6),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 182,
                              child: Text(age, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.body1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 16),
                            width: MediaQuery.of(context).size.width - 160,
                            child: Wrap(
                              spacing: 8, // gap between adjacent chips
                              runSpacing: -6, // gap between lines
                              children: <Widget>[
                                Chip(label: Text(species)),
                                Chip(label: Text(genre)),
                                Chip(label: Text(size)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}