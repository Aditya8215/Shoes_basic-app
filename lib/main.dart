import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_basic/global_variables.dart';
import 'package:shoes_basic/pages/home_page.dart';
import 'package:shoes_basic/pages/product_details_page.dart';
import 'package:shoes_basic/providers/cart_provider.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=> CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(seedColor:Colors.lightBlueAccent,
          primary: Colors.blueAccent,
          secondary: Colors.blue[50]),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 12
            )
          ),
          textTheme: TextTheme(
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: TextStyle(fontSize: 28,fontWeight: FontWeight.w900),
            bodySmall: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black
            )
          ),
          useMaterial3: true,
        ),
        home:HomePage(),
      ),
    );
  }
}

