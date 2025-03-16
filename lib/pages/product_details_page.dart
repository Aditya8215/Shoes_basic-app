import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoes_basic/providers/cart_provider.dart';
class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object> product;
  const ProductDetailsPage({super.key,
  required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize=0;
  void onTap() {
    // print('Adding Cart-Selected size:$selectedSize');
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'size': selectedSize,
        },

      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added successfully'),
        ),
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a Size!'),
          ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details',style: Theme.of(context).textTheme.titleMedium,),
      ),
      body: Column(
        children: [
          Text(widget.product['title'] as String,style:Theme.of(context).textTheme.titleLarge),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: Image.asset(widget.product['imageUrl']as String,height: 250,)),
          ),
          const Spacer(flex:3),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 220,
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('\$${widget.product['price'] as double}',style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length ,
                      itemBuilder: (context,index){
                        final size=(widget.product['sizes'] as List<int>)[index];
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedSize=size;
                                });
                                // print('Selected Size:$selectedSize');
                              },
                                child: Chip(label: Text(size.toString(),),
                                  backgroundColor: selectedSize==size?Theme.of(context).colorScheme.secondary:Colors.white70,
                                  shadowColor: Colors.black,
                                  elevation: 3,
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                ),
                            ),
                            SizedBox(width: 8,)
                          ],
                        );
                      }
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: ElevatedButton.icon(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        fixedSize: Size(350, 40)
                      ),
                    icon: Icon(Icons.shopping_cart,color: Colors.black,),
                    label: Text('Add To Cart',style: TextStyle(color: Colors.black),),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
