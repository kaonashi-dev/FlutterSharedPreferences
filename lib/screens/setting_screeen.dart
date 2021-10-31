import 'package:flutter/material.dart';

import 'package:flutter_user_preference/shared_preferences/user_preference.dart';

import 'package:flutter_user_preference/widgets/menu_widget.dart';

class SettingScreen extends StatefulWidget {

   const SettingScreen({Key? key}) : super(key: key);

   static const String routeName = 'setting';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

   final prefs = UserPreference();

   late bool _colorSecondary;
   late int _radioGender;
   late String _name;

   late TextEditingController _textController;

   void _selectdRadio( value ) {
      _radioGender = value;
      prefs.gender = value;
      setState(() {});
   }

   @override
   void initState() {
      super.initState();
      _colorSecondary = prefs.colorSecondary;
      _radioGender = prefs.gender;
      _name = prefs.nameUser;
      _textController = TextEditingController(text: _name);
   }

   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            title: const Text('Ajustes'),
            backgroundColor: (prefs.colorSecondary) ? Colors.blue : Colors.purple,
         ),
         drawer: const MenuDrawer(),
         body: ListView(
            children: <Widget> [

               Container(
                  padding: const EdgeInsets.all(7),
                  child: const Text('Ajustes', style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold)),
               ),
               const Divider(),

               SwitchListTile(
                  title: const Text('Color secundario'),
                  value: _colorSecondary, 
                  onChanged: ( value ){
                     _colorSecondary = value;
                     prefs.colorSecondary = value;
                     setState(() {});
                  }
               ),

               RadioListTile(
                  title: const Text('Masculino'),
                  value: 1, 
                  groupValue: _radioGender, 
                  onChanged: _selectdRadio
               ),
               RadioListTile(
                  title: const Text('Femenino'),
                  value: 2,
                  groupValue: _radioGender, 
                  onChanged: _selectdRadio
               ),

               const Divider(),

               Container(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: TextField(
                     controller: _textController,
                     decoration: const InputDecoration(
                        label: Text('Nombre de usuario')
                     ),
                     onChanged: ( String value ) {
                        prefs.nameUser = value;
                     },
                  ),
               )

            ],
         ),
      );
   }
}