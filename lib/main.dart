import 'package:flutter/material.dart';
import 'package:shop_app_flutter/homepage.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
              suffixIconColor: Colors.black45,
            ),
            fontFamily: 'Lato',
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              bodySmall: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          home: const HomePage()),
    );
  }
}
