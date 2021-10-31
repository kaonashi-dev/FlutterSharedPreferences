import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {

   static final UserPreference _intance = UserPreference._internal();

   factory UserPreference() {
      return _intance;
   }


   UserPreference._internal();

   late SharedPreferences _prefs;

   initPreferences() async {
      _prefs = await SharedPreferences.getInstance();
   }

   /// Genero
   int get gender {
      return _prefs.getInt('gender') ?? 1;
   }
   set gender( int value ) {
      _prefs.setInt('gender', value);
   }

   /// Color 
   bool get colorSecondary {
      return _prefs.getBool('colorsecondary') ?? false;
   }
   set colorSecondary( bool value ) {
      _prefs.setBool('colorsecondary', value);
   }

   /// Nombre del usuario 
   String get nameUser {
      return _prefs.getString('name') ?? '';
   }
   set nameUser( String value ) {
      _prefs.setString('name', value);
   }
}