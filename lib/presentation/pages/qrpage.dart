import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/generate/generated/locale_keys.g.dart';
import 'package:flutter_project/utils/const/const.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratePage extends StatefulWidget {
  @override
  _GeneratePageState createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.QrGen.tr(), style: TextStyle(color: Colors.white)),
        backgroundColor: FlowerColors.primaryColor, 
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: LocaleKeys.write.tr(),
                hintStyle: TextStyle(color: FlowerColors.appColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: FlowerColors.primaryColor, width: 2.0), 
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: FlowerColors.secondaryColor, backgroundColor: FlowerColors.primaryColor, 
              ),
              onPressed: () {
                setState(() {});
              },
              child: Text(LocaleKeys.QrGen.tr()),
            ),
          ),
          if (textController.text.isNotEmpty) 
            QrImageView(
              data: textController.text,
              version: QrVersions.auto,
              size: 200.0,
            ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}