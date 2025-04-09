import 'package:flutter/material.dart';
import 'package:porfolio/bottomnavigation.dart';
import 'package:porfolio/screens/home_page.dart';
import 'package:porfolio/screens/widgets/footer_Test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Builder(builder: (context) {
          final screenwidth = MediaQuery.of(context).size.width;
          if (screenwidth < 600) {
            return AdminLoginPage();
          } else {
            return HomePage();
          }
        }));
    // home: CustomFooter());
  }
}
