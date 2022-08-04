import 'package:flutter/material.dart';
import 'package:petology/widgets/deafult_drop_down_menu.dart';
import 'package:petology/widgets/pet_container.dart';

class AdoptionScreen extends StatelessWidget {
  AdoptionScreen({Key? key}) : super(key: key);
  static const routeName = '/adoption';

  final items = ['choose 1', 'choose 2', 'choose 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ExpansionTile(
                leading: const Icon(Icons.filter_list_alt),
                title: const Text('Filters'),
                childrenPadding: const EdgeInsets.all(20),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultDropDownMenu(
                        items: items,
                        width: 150,
                        hint: 'Breed',
                      ),
                      DefaultDropDownMenu(
                        items: items,
                        width: 150,
                        hint: 'Age',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultDropDownMenu(
                        items: items,
                        width: 150,
                        hint: 'Gender',
                      ),
                      DefaultDropDownMenu(
                        items: items,
                        width: 150,
                        hint: 'Size',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultDropDownMenu(
                        items: items,
                        width: 150,
                        hint: 'Color',
                      ),
                      DefaultDropDownMenu(
                        items: items,
                        width: 150,
                        hint: 'Hair Length',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultDropDownMenu(
                        items: items,
                        width: 150,
                        hint: 'House Trained',
                      ),
                      DefaultDropDownMenu(
                        items: items,
                        width: 150,
                        hint: 'Vaccinated',
                      ),
                    ],
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemCount: 6,
                itemBuilder: (context, index) =>
                    const PetContainer(petName: '', forHome: false),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.6,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
