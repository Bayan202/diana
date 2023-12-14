import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/generate/generated/locale_keys.g.dart';
import 'package:flutter_project/utils/const/const.dart';
import 'package:image_picker/image_picker.dart';

class StoriesList extends StatefulWidget {
  @override
  _StoriesListState createState() => _StoriesListState();
}

class _StoriesListState extends State<StoriesList> {
  List<Uint8List> _stories = [];

  void _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      final Uint8List imageData = await image.readAsBytes();
      setState(() {
        _stories.add(imageData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.primaryGradient
        ),
        child: _stories.isEmpty
            ? Center(child: Text('Нет историй', style: TextStyle(color: FlowerColors.secondaryColor)))
            : ListView.builder(
                itemCount: _stories.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: FlowerColors.secondaryColor,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: MemoryImage(_stories[index]),
                      ),
                      title: Text('Story ${index + 1}', style: TextStyle(color: FlowerColors.afterColors)),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryPage(imageData: _stories[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showImageSourceDialog(context),
        child: Icon(Icons.add),
        backgroundColor: FlowerColors.primaryColor,
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(LocaleKeys.source.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: Text(LocaleKeys.camera.tr()),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text(LocaleKeys.gallery.tr()),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    },
  );
}
}

class StoryPage extends StatelessWidget {
  final Uint8List imageData;

  StoryPage({required this.imageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.memory(imageData),
      ),
    );
  }
}