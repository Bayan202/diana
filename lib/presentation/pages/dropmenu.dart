import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/generate/generated/locale_keys.g.dart';
import 'package:flutter_project/presentation/pages/animation.dart';
import 'package:flutter_project/presentation/pages/flowerpage.dart';
import 'package:flutter_project/presentation/pages/qrscanpage.dart';
import 'package:flutter_project/presentation/pages/story.dart';
import 'package:flutter_project/presentation/pages/userpage.dart';
import 'package:flutter_project/utils/const/const.dart';

class Dropmenu extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Dropmenu> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    UserPage(),
    FlowersGridPage(),
    StoriesList(),
    FlowerShopApp(),
    ScanPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BloomHub'),
        backgroundColor: FlowerColors.primaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: AppGradients.primaryGradient
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(LocaleKeys.MENU.tr(), style: TextStyle(color: FlowerColors.secondaryColor, fontSize: 25)),
                ],
              ),
            ),
            _buildDrawerItem(Icons.person, LocaleKeys.Profile.tr(), 0),
            _buildDrawerItem(Icons.newspaper, LocaleKeys.Shop.tr(), 1),
            _buildDrawerItem(Icons.video_call, LocaleKeys.Story.tr(), 2),
            _buildDrawerItem(Icons.animation, LocaleKeys.Animation.tr(), 3),
            _buildDrawerItem(Icons.qr_code, 'QR', 4),
          ],
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.pop(context);
      },
    );
  }
}