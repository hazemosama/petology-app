import 'package:flutter/material.dart';
import 'package:petology/widgets/deafult_drop_down_menu.dart';

class RequestScreen extends StatelessWidget {
  RequestScreen({Key? key}) : super(key: key);
  final List<String> genderItems = ['cat', 'dog', 'شخة'];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultDropDownMenu(items: genderItems),
    );
  }
}
