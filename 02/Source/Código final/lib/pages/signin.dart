import 'package:flutter/material.dart';
import 'package:flutter_talks/theme/colors.dart';
import 'package:flutter_talks/widgets/custom_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'navigation.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: CustomIcon(
            icon: FontAwesomeIcons.arrowLeft,
            color: Colors.white,
            size: 20),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: kPrimary,
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text('Preencha para acessar', style: Theme.of(context).textTheme.title.apply(color: kWhite)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Text('Você está a dois passos de conhecer bichinhos que aguardam por adoção.', style: Theme.of(context).textTheme.body1.apply(color: kWhite70)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    style: TextStyle(color: kWhite),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      hintText: "Digite o seu e-mail",
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    style: TextStyle(color: kWhite),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      hintText: "Digite a sua senha.",
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: double.infinity),
                    child: RaisedButton(
                      elevation: 0,
                      disabledElevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      hoverElevation: 0,
                      color: kWhite,
                      onPressed: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => Navigation()
                        )
                        );
                      },
                      child: Text("ENTRAR", style: TextStyle(color: kPrimary)),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: double.infinity),
                  child: FlatButton(
                    onPressed: (){},
                    child: Text("Esqueceu a senha?", style: TextStyle(color: kWhite70, fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}