import 'package:flutter/material.dart';
class ProductCard extends StatelessWidget {
  final String company;
  final double price;
  final Color bgColor;
  final String image;
  const ProductCard({
    super.key,
    required this.company,
    required this.price,
    required this.image,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(26.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(company,style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 5.0,),
          Text('\$ $price',style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 5.0,),
          Center(
            child: Image(image: AssetImage(image),
            height: 275,),
          )
        ],
      ),
    );
  }
}
