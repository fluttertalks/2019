import 'package:flutter/material.dart';
import 'package:flutter_talks/widgets/cards.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(
          child: ListView(
            children: <Widget>[
              Container(
                height: 47,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, top: 15),
                  child: Text("8 bichinhos encontrados.", style: Theme.of(context).textTheme.body2, overflow: TextOverflow.ellipsis),
                ),
              ),
              Container(
                height: 1,
                color: Colors.black12,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 14),
                child: Column(
                  children: <Widget>[
                    PetCard(
                      title: "Adam",
                      age: "± 2 anos",
                      species: "Cachorro",
                      genre: "Macho",
                      size: "Pequeno",
                      image: "assets/images/pets/adam.png",
                    ),
                    PetCard(
                      title: "Kira",
                      age: "± 3 meses",
                      species: "Gato",
                      genre: "Fêmea",
                      size: "Pequeno",
                      image: "assets/images/pets/kira.png",
                    ),
                    PetCard(
                      title: "Chelsea",
                      age: "± 4 meses",
                      species: "Coelho",
                      genre: "Fêmea",
                      size: "Médio",
                      image: "assets/images/pets/chelsea.png",
                    ),
                    PetCard(
                      title: "Lucky",
                      age: "± 1 ano",
                      species: "Gato",
                      genre: "Macho",
                      size: "Médio",
                      image: "assets/images/pets/lucky.png",
                    ),
                    PetCard(
                      title: "Madonna",
                      age: "± 3 anos",
                      species: "Gato",
                      genre: "Fêmea",
                      size: "Pequeno",
                      image: "assets/images/pets/madonna.png",
                    ),
                    PetCard(
                      title: "Pingo",
                      age: "± 8 meses",
                      species: "Cachorro",
                      genre: "Macho",
                      size: "Grande",
                      image: "assets/images/pets/pingo.png",
                    ),
                    PetCard(
                      title: "Fifi",
                      age: "± 2 anos",
                      species: "Cachorro",
                      genre: "Fêmea",
                      size: "Grande",
                      image: "assets/images/pets/fifi.png",
                    ),
                    PetCard(
                      title: "Duquesa",
                      age: "± 4 anos",
                      species: "Gato",
                      genre: "Fêmea",
                      size: "Pequeno",
                      image: "assets/images/pets/duquesa.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}