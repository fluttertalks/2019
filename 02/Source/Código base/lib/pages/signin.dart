import 'package:flutter/material.dart';
import 'package:flutter_talks/widgets/custom_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'navigation.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text('Preencha para acessar', style: Theme.of(context).textTheme.title),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Text('Você está a dois passos de conhecer bichinhos que aguardam por adoção.', style: Theme.of(context).textTheme.body1),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: TextFormField(
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
                      onPressed: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => Navigation()
                        )
                        );
                      },
                      child: Text("ENTRAR"),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: double.infinity),
                  child: FlatButton(
                    onPressed: (){},
                    child: Text("Esqueceu a senha?", style: TextStyle(fontWeight: FontWeight.w400)),
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