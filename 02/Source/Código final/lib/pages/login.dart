import 'package:flutter_talks/pages/signin.dart';
import 'package:flutter_talks/theme/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/img_login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
                padding: EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kPrimary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text('Seja bem-vindo!', style: Theme.of(context).textTheme.title.apply(color: kWhite)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text('Bichinhos fofinhos aguardam por você. Entre ou cadastre-se para conhecê-los.', style: Theme.of(context).textTheme.body1.apply(color: kWhite70)),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(minWidth: double.infinity),
                      child: RaisedButton(
                        elevation: 0,
                        disabledElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        hoverElevation: 0,
                        color: kWhite,
                        child: Text("CADASTRAR", style: TextStyle(color: kPrimary)),
                        onPressed: (){},
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(minWidth: double.infinity),
                      child: RaisedButton(
                        elevation: 0,
                        disabledElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        hoverElevation: 0,
                        color: kWhite,
                        child: Text("ENTRAR", style: TextStyle(color: kPrimary)),
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