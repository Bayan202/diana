import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/generate/generated/locale_keys.g.dart';
import 'package:flutter_project/utils/const/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb; 

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  User? user = FirebaseAuth.instance.currentUser;
  String _name = 'No Name';
  String _city = 'No City';
  String? _profilePicPath;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
    _loadProfilePicPath();
  }

  Future<void> _loadUserProfile() async {
    if (user != null) {
      try {
        DocumentSnapshot userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
        if (userData.exists) {
          Map<String, dynamic> data = userData.data() as Map<String, dynamic>;
          setState(() {
            _name = data['name'] ?? 'No Name';
            _city = data['city'] ?? 'No City';
          });
        }
      } catch (e) {
        print('Error loading user data: $e');
      }
    }
  }

  Future<void> _loadProfilePicPath() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _profilePicPath = prefs.getString('profilePic');
    });
  }

  Future<void> _selectProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profilePicPath = pickedFile.path;
      });

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profilePic', pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildProfileHeader(),
          Card(child: _buildUserInfo(LocaleKeys.Name.tr(), _name)),
          Card(child: _buildUserInfo(LocaleKeys.City.tr(), _city)),
          Card(child: _buildFavoriteFlowersSection()),
          Card(child: _buildOrderStats()),
          Card(child: _buildReviewsSection()),
          _buildFeedbackButton(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    ImageProvider? backgroundImg;
    if (_profilePicPath != null) {
      if (!kIsWeb) {
        backgroundImg = FileImage(File(_profilePicPath!));
      } else {
        backgroundImg = NetworkImage(_profilePicPath!);
      }
    }

    return GestureDetector(
      onTap: () {
        _selectProfileImage();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: backgroundImg,
          child: backgroundImg == null ? Icon(Icons.person, size: 50) : null,
        ),
      ),
    );
  }

  Widget _buildUserInfo(String title, String value) {
    return ListTile(
      title: Text(title, style: TextStyle(color: FlowerColors.primaryColor)),
      subtitle: Text(value),
      leading: Icon(Icons.person, color: FlowerColors.primaryColor),
    );
  }

  Widget _buildFavoriteFlowersSection() {
    return ListTile(
      title: Text(LocaleKeys.Favorite_Flowers.tr()),
      leading: Icon(Icons.favorite, color: FlowerColors.primaryColor),
    );
  }

  Widget _buildOrderStats() {
    return ListTile(
      title: Text(LocaleKeys.Order_Statistics.tr()),
      subtitle: Text('Total Orders: 5, Total Spent: \$200'),
      leading: Icon(Icons.shopping_cart, color: FlowerColors.primaryColor),
    );
  }

  Widget _buildReviewsSection() {
    return ListTile(
      title: Text(LocaleKeys.My_Reviews.tr()),
      leading: Icon(Icons.rate_review, color: FlowerColors.primaryColor),
    );
  }

  Widget _buildFeedbackButton() {
    return ListTile(
      leading: Icon(Icons.feedback, color: FlowerColors.primaryColor),
      title: Text(LocaleKeys.Give_Feedback.tr()),
      onTap: () {
      },
    );
  }
}