import 'package:ecommerce_app/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import '../modal/product.dart';


class ProductBasket extends ConsumerStatefulWidget {
  ProductModal product;
  Function setMyWishList;

  ProductBasket({required this.product,required this.setMyWishList});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductBasketState();
}

class _ProductBasketState extends ConsumerState<ProductBasket> {
  @override
  Widget build(BuildContext context) {

   return Container(
          height: Grock.height/5,
          padding: 2.allP,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: 10.allBR,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                )]
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.product.image,
                  width: Grock.width * 0.3,
                  height: Grock.height * 0.3,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.product.title,style: _textStyle(18, FontWeight.bold, Constant.black),),
                    Text("\$ ${widget.product.price}",style: _textStyle(25, FontWeight.bold, Constant.black),),
                    Row(
                      children: [
                        Text("Quantify ",style: _textStyle(17, FontWeight.bold, Constant.gray),),
                        SizedBox(width: 7,),
                        quantifyButton(Icons.remove, (){}),
                        Padding(padding: 7.allP,child: Text("1"),),
                        quantifyButton(Icons.add, (){}),

                      ],
                    ),
                  ],
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.clear))
              ],
            ),
          ),
        );

  }
  Widget quantifyButton(IconData icon, Function onTap){
    return GrockContainer(
      onTap: () => onTap(),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: 4.allBR,
      ),
      child: Center(
        child: Icon(icon,size: 20,),
      ),
    );


  }
  TextStyle _textStyle(double fontSize, fontWeight, Color gray) =>
      TextStyle(fontSize: fontSize, fontWeight: fontWeight);
}