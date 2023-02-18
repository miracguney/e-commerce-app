import 'package:ecommerce_app/view/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import '../constant/constant.dart';
import '../modal/product.dart';

class ProductCard extends StatelessWidget {

  ProductModal product;
  Function setMyWishList;
  Function setBasket;

  ProductCard({required this.product,required this.setMyWishList, required this.setBasket});



  @override
  Widget build(BuildContext context) {
    return GrockContainer(
      onTap: () => Grock.to(ProductDetail(product: product, setMyWishList: setMyWishList, setBasket: setBasket,)),
      width: 150,
      decoration: BoxDecoration(
        color: Constant.white,
        borderRadius: 10.allBR,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(product.image,fit: BoxFit.cover,),
          Padding(
            padding: 10.horizontalP,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(product.title,style: const TextStyle(fontSize: 15))),
                GrockContainer(
                  onTap:() => setMyWishList(),
                  child: Icon(product.isSaved  ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,color: Colors.orange ,)),
              ],
            ),
          ),
      Padding(
        padding: [10, 5].horizontalAndVerticalP,
         child: Text("\$ ${product.price.toString()}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
      ),

      Padding(
        padding: [10, 5].horizontalAndVerticalP,
          child: Row(
            children: [
              Icon(Icons.star,color: Colors.yellow.shade700 ,),
              Text(product.star.toString(),style: const TextStyle(fontSize: 12)),
            ],
          ),),

        ],
      ),

    );
  }
}
