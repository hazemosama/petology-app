import 'package:flutter/material.dart';
import 'package:petology/models/pets_model.dart' show Animals;

class PetDetailsScreen extends StatelessWidget {
  Animals pet;

  PetDetailsScreen({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Image.network(pet.image[0].imUrl),
              SizedBox(
                height: 10.0,
              ),
              Text(pet.name),
              SizedBox(
                height: 10.0,
              ),
              Text(pet.color),
              SizedBox(
                height: 10.0,
              ),
              Text(pet.size),
              SizedBox(
                height: 10.0,
              ),
              Text(pet.phone),
              SizedBox(
                height: 10.0,
              ),
              Text(pet.ages),
              SizedBox(
                height: 10.0,
              ),
              Text(pet.description),

              Text(pet.breed),
            ],
          ),
        ),
      ),
    );
  }
}
