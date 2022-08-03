import 'package:flutter/material.dart';
import 'package:petology/widgets/text_with_background.dart';

import '../widgets/care_item.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);
  static const routeName = '/services';

  @override//
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextWithBackground(
              text: 'How to take care of your friends?',
            ),
            const SizedBox(
              height: 22,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CareItem(index: index),
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
              ),
              itemCount: 7,
              scrollDirection: Axis.vertical,
            ),
          ],
        ),
      ),
    );
  }
}
