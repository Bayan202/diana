import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/generate/generated/locale_keys.g.dart';
import 'package:flutter_project/utils/const/const.dart';

class FlowerShopApp extends StatefulWidget {
  @override
  _FlowerAnimationScreenState createState() => _FlowerAnimationScreenState();
}

class _FlowerAnimationScreenState extends State<FlowerShopApp> {
  double opacity1 = 0;
  double opacity2 = 0;
  double opacity3 = 0;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

 void _initAnimations() async {
  await Future.delayed(Duration(seconds: 1));
  if (!mounted) return;
  setState(() => opacity1 = 1);
  
  await Future.delayed(Duration(seconds: 1));
  if (!mounted) return;
  setState(() => opacity2 = 1);

  await Future.delayed(Duration(seconds: 1));
  if (!mounted) return;
  setState(() => opacity3 = 1);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlowerColors.secondaryColor,
      body: ListView(
        children: <Widget>[
          _animatedHeader(LocaleKeys.Almaty.tr()),
          _animatedProductCard(LocaleKeys.Rose.tr(), 'assets/image/flower1.jpg', opacity1),
          _animatedProductCard(LocaleKeys.Tulip.tr(), 'assets/image/flower2.jpg', opacity2),
          _animatedProductCard(LocaleKeys.Orchid.tr(), 'assets/image/flower3.jpg', opacity3),
        ],
      ),
    );
  }

  Widget _animatedHeader(String text) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: 2),
      builder: (context, double opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: FlowerColors.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Widget _animatedProductCard(String title, String imagePath, double opacity) {
    return Opacity(
      opacity: opacity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        shadowColor: FlowerColors.accentColor,
        elevation: 5,
        child: ListTile(
          leading: Image.asset(imagePath),
          title: Text(
            title,
            style: TextStyle(color: FlowerColors.primaryColor),
          ),
          subtitle: Text(
            LocaleKeys.For.tr(),
            style: TextStyle(color: FlowerColors.secondaryColor),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: FlowerColors.secondaryColor),
          onTap: () {},
        ),
      ),
    );
  }
}