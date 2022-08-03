import 'package:flutter/material.dart';
import 'package:petology/widgets/text_with_background.dart';

import '../widgets/care_item.dart';

class CareScreen extends StatelessWidget {
  const CareScreen({Key? key}) : super(key: key);
  static const routeName = '/care';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              TextWithBackground(
                text: 'How to take care of your friends?',
              ),
              SizedBox(
                height: 22,
              ),
              SizedBox(
                width: double.infinity,
                height: 590,
                child: ListView.separated(
                  itemBuilder: (context, index) => CareItem(index: index),
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                  ),
                  itemCount: 7,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
