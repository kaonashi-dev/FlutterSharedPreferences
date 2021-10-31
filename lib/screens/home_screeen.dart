import 'package:flutter/material.dart';

import 'package:flutter_user_preference/shared_preferences/user_preference.dart';

import 'package:flutter_user_preference/widgets/menu_widget.dart';

class HomeScreen extends StatelessWidget {

   HomeScreen({Key? key}) : super(key: key);

   static const String routeName = 'home';

   final prefs = UserPreference();

   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            title: const Text('Preferecia de usuarios'),
            backgroundColor: (prefs.colorSecondary) ? Colors.blue : Colors.purple,
         ),
         drawer: const MenuDrawer(),
         body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Text('Color secundario: ${ prefs.colorSecondary }'),
               const Divider(),

               Text('Género: ${ prefs.gender } '),
               const Divider(),

               Text('Nombre de usuario: ${ prefs.nameUser }'),
               const Divider(),
            ],
         ),
      );
   }
}