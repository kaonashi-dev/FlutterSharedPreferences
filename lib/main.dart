import 'package:flutter/material.dart';
import 'package:flutter_user_preference/screens/home_screeen.dart';
import 'package:flutter_user_preference/screens/setting_screeen.dart';
import 'package:flutter_user_preference/shared_preferences/user_preference.dart';

void main() async {

   WidgetsFlutterBinding.ensureInitialized();

   final prefs = UserPreference();
   await prefs.initPreferences();

   runApp(const MyApp());

}

class MyApp extends StatelessWidget {
   
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
      return MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'Preferencia de usuario',
         initialRoute: HomeScreen.routeName,
         routes: {
            HomeScreen.routeName: (BuildContext context, ) => HomeScreen(),
            SettingScreen.routeName: (BuildContext context, ) => const SettingScreen()
         },
      );
   }
}