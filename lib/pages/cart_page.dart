import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_basic/providers/cart_provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart=Provider.of<CartProvider>(context).cart;
    // inreplace of above line -
    final cart=context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: TextStyle(fontSize: 32),),
      ),
      body: ListView.builder(
        itemCount: cart.length,
          itemBuilder: (context,index){
          final cartItem=cart[index];
          return  ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl']as String),
              radius: 30,
            ),
            trailing: IconButton(onPressed: (){
              showDialog(
                // barrierDismissible: false,
                context: context, builder: (context){

                return AlertDialog(
                  title: Text('Delete Product',style: Theme.of(context).textTheme.titleMedium,),
                  content: Text('Are you sure you want to delete this from your cart or not?'),
                  actions: [
                    TextButton(onPressed: (){

                      Navigator.of(context).pop();
                    },
                      child:Text('No',style: TextStyle(color: Colors.black)),),
                    TextButton(onPressed: (){
                      context.read<CartProvider>().removeProduct(cartItem);
                      // Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                      Navigator.of(context).pop();
                    },
                        child:Text('Yes',style: TextStyle(color: Colors.blue[150]),
                        )
                    ),
                  ],
                );
              },
              );
            }, icon: Icon(Icons.delete)),
            title: Text(cartItem['company'].toString(),style: Theme.of(context).textTheme.bodySmall,),
            subtitle: Text('Size: ${cartItem['size']}'),

          );
          }
      ),
    );
  }
}
