import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project/data/repository/authrepository.dart';
import 'package:flutter_project/generate/generated/codegen_loader.g.dart';
import 'package:flutter_project/presentation/bloc/bloc/authh_bloc.dart';
import 'package:flutter_project/presentation/pages/logpage.dart';
import 'package:flutter_project/presentation/pages/regpage.dart';
import 'package:flutter_project/presentation/pages/splash.dart';
import 'package:flutter_project/presentation/pages/userpage.dart';
import 'generate/generated/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('kk'), Locale('ru')],
      path: 'assets/translation', 
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp()
    ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: AuthRepository()),
      child: MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        routes: {
          '/':(context) => SplashScreen(),
          '/loginpage': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/userProfile': (context) => UserPage(),
        },
      ),
    );
  }
}