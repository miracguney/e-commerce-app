import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import '../constant/constant.dart';

class ProductCategory extends StatelessWidget {

   String image;
   String text;
   ProductCategory({required this.image, required this.text});


  @override
  Widget build(BuildContext context) {
    return GrockContainer(
      onTap: () => null,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image,fit: BoxFit.cover,),//product.image product.title
          Padding(
            padding: 10.horizontalP,
            child:
            Expanded(child: Text(text,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
          ),


        ],
      ),

    );
  }
}
