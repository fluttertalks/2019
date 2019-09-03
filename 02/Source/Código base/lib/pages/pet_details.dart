import 'package:flutter/material.dart';
import 'package:flutter_talks/widgets/custom_icons.dart';

class PetDetails extends StatelessWidget {

  final String title;
  final String age;
  final String species;
  final String genre;
  final String size;
  final String image;

  PetDetails({@required this.title, @required this.age, @required this.species, @required this.genre, @required this.size, @required this.image});

  @override
  Widget build(BuildContext context) {

    String petSpecies = "";
    String article = "uma";

    if(genre == "Fêmea" && species == "Cachorro") {
      petSpecies = "cachorra";
    }else if (genre == "Fêmea" && species == "Gato") {
      petSpecies = "gata";
    }else if (genre == "Fêmea" && species == "Coelho") {
      petSpecies = "coelha";
    }else if (genre == "Fêmea" && species == "Furão"){
      article = "um";
    }else if (genre == "Fêmea" && species == "Hamster"){
      article = "um";
    }else if (genre == "Fêmea" && species == "Porquinho da Índia"){
      article = "um";
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        icon: Icon(Icons.check),
        label: Text("INFORMAR ADOÇÃO"),
        isExtended: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(title),
              pinned: true,
              expandedHeight: 270,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                      alignment: FractionalOffset.center,
                    )
                  ),
                ),
              ),
              actions: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: (){},
                    ),
                  ],
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text('Entre em contato para adotar', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.title),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Text('Em breve nosso sistema de adoção estará disponível. Por enquanto, pedimos que entre em contato com o doador para combinar a adoção.', style: Theme.of(context).textTheme.body2, overflow: TextOverflow.clip),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 3),
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(minWidth: double.infinity),
                                            child: RaisedButton(
                                              onPressed: (){},
                                              child: Icon(FlutterTalks.whatsapp, size: 20),
                                            ),
                                          ),
                                        )
                                    ),
                                    Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 1, right: 2),
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(minWidth: double.infinity),
                                            child: RaisedButton(
                                              onPressed: (){},
                                              child: Icon(FlutterTalks.facebook, size: 20,),
                                            ),
                                          ),
                                        )
                                    ),
                                    Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 2),
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(minWidth: double.infinity),
                                            child: RaisedButton(
                                              onPressed: (){},
                                              child: Icon(Icons.phone),
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black12,
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text('História', style: Theme.of(context).textTheme.title),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vulputate at velit auctor dapibus. Cras faucibus accumsan odio sit amet imperdiet. Curabitur tincidunt nisi nec sapien faucibus, vitae facilisis velit cursus.',
                                  style: Theme.of(context).textTheme.body2.merge(TextStyle(fontStyle: FontStyle.italic)), overflow: TextOverflow.clip),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black12,
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text('Descrição', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.title),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: genre == "Macho" ? Text(
                                  'O $title possui $age e é um ${species.toLowerCase()} macho muito lindo de porte ${size.toLowerCase()}.',
                                  style: Theme.of(context).textTheme.body2
                                ) : Text(
                                  'A $title possui $age e é $article $petSpecies fêmea muito linda de porte ${size.toLowerCase()}.',
                                  style: Theme.of(context).textTheme.body2
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black12,
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Text('Saúde', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.title),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: genre == "Macho" ? Text("O estado de saúde do $title é perfeito!", style: Theme.of(context).textTheme.body2, overflow: TextOverflow.clip) : Text("O estado de saúde da $title é perfeito!", style: Theme.of(context).textTheme.body2, overflow: TextOverflow.clip)
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: Row(
                                  children: <Widget>[
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 4,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(right: 4),
                                              child: Text(genre == "Macho" ? 'Castrado' : 'Castrada', style: Theme.of(context).textTheme.body2, overflow: TextOverflow.clip),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(right: 4),
                                              child: Icon(Icons.check, size: 16),
                                            ),
                                            Container(
                                              width: 4,
                                              height: 4,
                                              decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius: BorderRadius.all(Radius.circular(2)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(right: 4),
                                              child: Text(genre == "Macho" ? 'Vacinado' : 'Vacinada', style: Theme.of(context).textTheme.body2, overflow: TextOverflow.clip),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(right: 4),
                                              child: Icon(Icons.check, size: 16),
                                            ),
                                            Container(
                                              width: 4,
                                              height: 4,
                                              decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius: BorderRadius.all(Radius.circular(2)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(right: 4),
                                              child: Text(genre == "Macho" ? 'Vermifugado' : 'Vermifugada', style: Theme.of(context).textTheme.body2, overflow: TextOverflow.clip),
                                            ),
                                            Icon(Icons.check, size: 16),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black12,
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text('Doador', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.title),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Container(
                                      width: 72,
                                      height: 72,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/donor_image.png"),
                                            fit: BoxFit.cover,
                                            alignment: FractionalOffset.topCenter),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("João Henrique", style: Theme.of(context).textTheme.body2, overflow: TextOverflow.clip),
                                          Padding(
                                            padding: EdgeInsets.only(top: 2, bottom: 2),
                                            child: Text("UX/UI Designer", style: Theme.of(context).textTheme.body2, overflow: TextOverflow.clip),
                                          ),
                                          Text("São Carlos - SP", style: Theme.of(context).textTheme.body2, overflow: TextOverflow.clip),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vulputate at velit auctor dapibus. Cras faucibus accumsan odio sit amet imperdiet.", style: Theme.of(context).textTheme.body2.merge(TextStyle(fontStyle: FontStyle.italic)), overflow: TextOverflow.clip),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      color: Colors.white,
                    )
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
