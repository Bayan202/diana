import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/generate/generated/locale_keys.g.dart';
import 'package:flutter_project/presentation/bloc/bloc/authh_bloc.dart';
import 'package:flutter_project/presentation/bloc/bloc/authh_event.dart';
import 'package:flutter_project/presentation/bloc/bloc/authh_state.dart';
import 'package:flutter_project/presentation/pages/dropmenu.dart';
import 'package:flutter_project/utils/const/const.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Register.tr()),
        backgroundColor: FlowerColors.primaryColor,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              switch (value) {
                case 'English':
                  context.setLocale(Locale('en'));
                  break;
                case 'Русский':
                  context.setLocale(Locale('ru'));
                  break;
                case 'Қазақша':
                  context.setLocale(Locale('kk'));
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'English', 'Русский', 'Қазақша'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Dropmenu()),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.primaryGradient
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    style: TextStyle(color: FlowerColors.secondaryColor),
                    decoration: InputDecoration(
                      labelText: LocaleKeys.Name.tr(),
                      labelStyle: TextStyle(color: FlowerColors.secondaryColor),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person, color: FlowerColors.secondaryColor),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: FlowerColors.secondaryColor),
                    decoration: InputDecoration(
                      labelText: LocaleKeys.Email.tr(),
                      labelStyle: TextStyle(color: FlowerColors.secondaryColor),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email, color: FlowerColors.secondaryColor),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: _cityController,
                    style: TextStyle(color: FlowerColors.secondaryColor),
                    decoration: InputDecoration(
                      labelText: LocaleKeys.City.tr(),
                      labelStyle: TextStyle(color: FlowerColors.secondaryColor),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_city, color: FlowerColors.secondaryColor),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: _passwordController,
                    style: TextStyle(color: FlowerColors.secondaryColor),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.Password.tr(),
                      labelStyle: TextStyle(color: FlowerColors.secondaryColor),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: FlowerColors.secondaryColor),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        RegisterUser(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          city: _cityController.text,
                        )
                      );
                    },
                    child: Text(LocaleKeys.Register.tr()),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: FlowerColors.primaryColor, backgroundColor: FlowerColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}