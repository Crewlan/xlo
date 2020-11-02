import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo/blocs/drawer_bloc.dart';
import 'package:xlo/blocs/home_bloc.dart';
import 'package:xlo/pages/base/base_page.dart';
import 'package:xlo/pages/filter/filter_page.dart';
import 'package:xlo/pages/home/home_page.dart';
import 'package:xlo/pages/login/login_page.dart';
import 'package:xlo/pages/signup/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerBloc>(create: (_) => DrawerBloc(),
        dispose: (context, value) => value.dispose(),
        ),
        Provider<HomeBloc>(create: (_) => HomeBloc(),
        dispose: (context, value) => value.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'XLO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => BasePage(),
          '/home': (context) => HomePage(),
          '/filter_page':(context) => FilterPage(),
          '/login': (context) => LoginPage(),
          '/signUp': (context) => SignUpPage(),

        },
      ),
    );
  }
}
