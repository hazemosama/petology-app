import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/app_constants.dart';
import 'package:petology/utils/assets_manager.dart';
import 'package:petology/widgets/text_with_background.dart';

import '../widgets/care_item.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);
  static const routeName = '/services';

  @override //
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const TextWithBackground(
              text: 'How to take care of your friends?',
            ),
            const SizedBox(
              height: 22,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  AppConstants.appShowDialog(
                    context: context,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                          },
                          child: Container(
                            height: 165,
                            width: 126,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              border: Border.all(
                                color: AppColors.darkBrown,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage(
                                    ImageAssets.kindDog,
                                  ),
                                  width: 90.0,
                                  height: 90.0,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'Dogs',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                          },
                          child: Container(
                            height: 165,
                            width: 126,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: AppColors.darkBrown,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage('assets/images/cat.png'),
                                  width: 90.0,
                                  height: 90.0,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'Cats',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    text: 'What kind of friend you want to help?'
                  );
                },
                child: CareItem(index: index),
              ),
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
