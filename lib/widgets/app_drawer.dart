import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_cubit.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: BlocConsumer<AppCubit, AppStates>(
                listener: (context, state) {},
                builder: (context, state) =>  Text(
                    'Hi ${AppCubit.get(context).userModel!.data.firstName}'+' '+'${AppCubit.get(context).userModel!.data.lastName} :)')),
            automaticallyImplyLeading: false,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Row(
              children: const [
                Text('Account Information'),
                Spacer(),
                Icon(Icons.account_box),
              ],
            ),
          )
        ],
      ),
    );
  }
}
