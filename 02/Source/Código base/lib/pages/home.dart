import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // FIRST CARD
            Padding(
              padding: EdgeInsets.only(left: 12, top: 12, right: 12),
              child: Card(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16/9,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/banner_no_theme.png"),
                            fit: BoxFit.cover,
                            alignment: FractionalOffset.topCenter,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 4),
                            child: Text('Não compre, adote!', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.title),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 12),
                            child: Text('Muitos bichinhos fofíneos aguardam por um lar. Não os deixe passar fome e sede. Colabore com a nossa causa.', style: Theme.of(context).textTheme.body2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: double.infinity),
                        child: RaisedButton(
                          child: Text("SAIBA COMO"),
                          onPressed: (){},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // SECOND CARD
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Card(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 16, right: 24, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("9", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.title),
                          Text('aguardando por um lar', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 48,
                      color: Colors.black12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24, top: 16, right: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("1", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.title),
                          Text('adotados esse ano', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // THIRD CARD
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 14),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 4),
                            child: Text('Nossos bichinhos fofinhos', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.title),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 16),
                            child: Text('Nossa lista de bichinhos fofíneos é enorme. Todos eles aguardam por um lar e pela chance de amarem e serem amados. Essa é a sua chance de salvar vidas! ', style: Theme.of(context).textTheme.body2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: AspectRatio(
                            aspectRatio: 37/16,
                            child: GridView.count(
                              padding: EdgeInsets.only(left: 16,right: 16, bottom: 16),
                              crossAxisCount: 3,
                              crossAxisSpacing: 4,
                              physics: NeverScrollableScrollPhysics(),
                              childAspectRatio: 3/4,
                              children: <Widget>[
                                Container(
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/pets/adam.png"),
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.topCenter),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/pets/kira.png"),
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.topCenter),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/pets/chelsea.png"),
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.topCenter),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }
}