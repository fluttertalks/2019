import 'package:flutter/material.dart';
import 'package:flutter_talks/pages/signin.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/img_login_bg_no_theme.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text('Seja bem-vindo!', style: Theme.of(context).textTheme.title),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text('Bichinhos fofinhos aguardam por você. Entre ou cadastre-se para conhecê-los.', style: Theme.of(context).textTheme.body1),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(minWidth: double.infinity),
                      child: RaisedButton(
                        child: Text("CADASTRAR"),
                        onPressed: (){},
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(minWidth: double.infinity),
                      child: RaisedButton(
                        child: Text("ENTRAR"),
                        onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => SignIn()
                          )
                          );
                        },
                      ),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}