import 'package:flutter/material.dart';

import 'package:flutter_user_preference/screens/home_screeen.dart';
import 'package:flutter_user_preference/screens/setting_screeen.dart';

class MenuDrawer extends StatelessWidget {
   const MenuDrawer({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
      return Drawer(
         child: ListView(
            padding: const EdgeInsets.only(top: 0),
            children: <Widget>[
               DrawerHeader(
                  child: Container(),
                  decoration: const BoxDecoration(
                     image: DecorationImage(
                        image: AssetImage('assets/background.jpg'),
                        fit: BoxFit.cover
                     )
                  ),
               ),

               ListTile(
                  title: const Text('Home'),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                     Navigator.pop(context);
                     Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  },
               ),

               ListTile(
                  title: const Text('Ajustes'),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                     Navigator.pop(context);
                     Navigator.pushReplacementNamed(context, SettingScreen.routeName);
                  },
               ),

            ],
         ),
      );
   }
}