import 'package:flutter/material.dart';
import 'package:shoes_basic/global_variables.dart';
import 'package:shoes_basic/widgets/product_card.dart';
import 'package:shoes_basic/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}
class _ProductListState extends State<ProductList> {
  final List<String> filters=const[
    'Nike',
    'Adidas',
    'Redtape',
    'Sketchers',
    'Puma',
  ];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter=filters[0];
  }
  @override
  Widget build(BuildContext context) {
    // final size=MediaQuery.of(context).size;
    final size=MediaQuery.sizeOf(context);
    // can use layoutBuilder
    // You are only listening to one property- entire widgets are not build
    final borderTextfield=OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(23.0)
    );

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0 ),
                  child: Text('NextBuy',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border:borderTextfield,
                    enabledBorder: borderTextfield,
                    focusedBorder: borderTextfield,
                  ),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context,index){
                  final filter=filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedFilter=filter;
                        });

                      },
                      child: Chip(
                        label: Text(filter),
                        backgroundColor: selectedFilter==filter?Theme.of(context).colorScheme.secondary:Color.fromRGBO(245, 247, 247, 1),
                        side: BorderSide(
                          color: Color.fromRGBO(245, 247, 247, 1),
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        elevation: 4.0,
                        shadowColor: Colors.black,
                      ),
                    ),
                  );
                }
            ),
          ),

          Expanded(
            child: size.width>650 ?GridView.builder(
    itemCount: products.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 1.7,
    crossAxisCount: 2,
    ),
    itemBuilder: (context,index){
    final product=products[index];
    return GestureDetector(
    onTap: (){
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context){
    return ProductDetailsPage(product: product);
    })
    );
    },
    child: ProductCard(
    company: product['title'] as String,
    price: product['price'] as double,
    image: product['imageUrl'] as String,
    bgColor: index.isEven? Color.fromRGBO(247,245, 243, 1) :(Colors.blue[50]?? Colors.blue),
    ),
    );
    },
    ) :ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index){
                  final product=products[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return ProductDetailsPage(product: product);
                          })
                      );
                    },
                    child: ProductCard(
                      company: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      bgColor: index.isEven? Color.fromRGBO(247,245, 243, 1) :(Colors.blue[50]?? Colors.blue),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
