import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';

class KindScreen extends StatefulWidget {
  const KindScreen({Key? key}) : super(key: key);
  static const routeName = '/kind-screen';

  @override
  KindScreenState createState() => KindScreenState();
}

class KindScreenState extends State<KindScreen> {
  String selected = '';
  double height = 180;
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 100.0,
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Image.asset(
                  'assets/icons/foot.png',
                  height: 60.0,
                  width: 60.0,
                ),
                const Text(
                  'Let\'s get this right...',
                  style: TextStyle(
                    color: AppColors.darkBrown,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Text(
                    'What kind of friend you looking for?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.darkBrown,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 'dog';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: selected == 'dog'
                              ? AppColors.lightBrown
                              : Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(
                            color: AppColors.darkBrown,
                            width: selected == 'dog' ? 1.5 : 0.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage(
                                'assets/images/dog.png',
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
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 'cat';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: selected == 'cat'
                              ? AppColors.lightBrown
                              : Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: AppColors.darkBrown,
                            width: selected == 'cat' ? 1.5 : 0.5,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
