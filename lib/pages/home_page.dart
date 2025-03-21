import 'package:flutter/material.dart';
import 'package:shoes_basic/pages/cart_page.dart';
import 'package:shoes_basic/global_variables.dart';
import 'package:shoes_basic/widgets/product_card.dart';
import 'package:shoes_basic/pages/product_details_page.dart';
import 'package:shoes_basic/pages/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage=0;
  List<Widget> pages= [ProductList(),CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value){
          setState(() {
            currentPage=value;
          });
        },
        currentIndex: currentPage ,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: '',
        ),
      ],
      ),
    );
  }
}
