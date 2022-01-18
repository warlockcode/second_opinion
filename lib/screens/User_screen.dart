import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titles('User Info'),
          UserListTile('Email', 'Email Sub', Icons.email, context),
          UserListTile('Phone Number', '+911-5646546', Icons.phone, context),
          UserListTile(
              'shipping address', 'xyz', Icons.local_shipping, context),
          ListTileSwitch(
            leading: Icon(Icons.wb_sunny),
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
            visualDensity: VisualDensity.comfortable,
            switchType: SwitchType.cupertino,
            switchActiveColor: Colors.indigo,
            title: Text('Theme'),
          )
        ],
      ),
    );
  }

  Widget titles(String text) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'User Info',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }

  Widget UserListTile(
      String title, String subtitle, IconData icon, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(icon),
        ),
      ),
    );
  }
}
