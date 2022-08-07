import 'package:flutter/material.dart';
import 'package:petology/models/pets_model.dart' show Animals;

class PetDetailsScreen extends StatelessWidget {

  const PetDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = '/pet-details';

  @override
  Widget build(BuildContext context) {
    final pet = ModalRoute.of(context)!.settings.arguments as Animals;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network(pet.image[0].imUrl),
            const SizedBox(
              height: 10.0,
            ),
            Text(pet.name),
            const SizedBox(
              height: 10.0,
            ),
            Text(pet.color),
            const SizedBox(
              height: 10.0,
            ),
            Text(pet.size),
            const SizedBox(
              height: 10.0,
            ),
            Text(pet.phone),
            const SizedBox(
              height: 10.0,
            ),
            Text(pet.ages),
            const SizedBox(
              height: 10.0,
            ),
            Text(pet.description),

            Text(pet.breed),
          ],
        ),
      ),
    );
  }
}
