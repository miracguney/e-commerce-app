import 'package:ecommerce_app/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import '../companents/custom_button.dart';
import '../modal/product.dart';

class ProductDetail extends ConsumerStatefulWidget {
  ProductModal product;
  Function setMyWishList;
  Function setBasket;

  ProductDetail({required this.product,required this.setMyWishList, required this.setBasket});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              image(),
              title(),
              colors(),
              subDetail(),
              price(),
              button()
            ],
          ),
          appBar(context),

        ],
      ),

    );
  }

  Padding button() {
    return Padding(
      padding: [10, 20, 10, 10].paddingLTRB,
        child: CustomButton(onTap: () => widget.setBasket() , text: "Add to card")
    );
  }

  Padding price() {
    return Padding(
              padding: [10, 20, 10, 0].paddingLTRB,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: _subTitle(19, FontWeight.bold),),
                  Text("\$ ${widget.product.price}", style: _subTitle(30, FontWeight.bold),),
                ],
              ),
            );
  }

  Padding title() {
    return Padding(
              padding: [10, 10, 10, 0].paddingLTRB,
              child: Text(widget.product.title,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            );
  }

  SafeArea appBar(BuildContext context) {
    return SafeArea(
          child: Padding(
            padding: 10.horizontalP,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back, size: 32, color: Constant.black,),),
                IconButton(
                    onPressed: () => widget.setMyWishList(),
                    icon: Icon(widget.product.isSaved  ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,color: Colors.orange ,size: 32,)),
              ],
            ),
          ),

        );
  }

  Padding subDetail() {
    return Padding(
              padding: [10, 10, 10, 0].paddingLTRB,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.descTitle, style: _subTitle(21, FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text(widget.product.descDetail, style: _subTitle(14, FontWeight.normal),),
                ],
              ),
            );
  }

  Padding colors() {
    return Padding(
              padding: [10, 10, 10, 0].paddingLTRB,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Colors", style: _subTitle(25, FontWeight.bold)),
                  SizedBox(height: 10,),

                  Wrap(
                    spacing: 15,
                    children: [
                      for(int i = 0; i < widget.product.colors.length; i++)
                        Container(
                          width: 113,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: 10.allBR,
                              color: widget.product.colors[i]
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
  }

  SizedBox image() {
    return SizedBox(
              height: 320,
              width: double.maxFinite,
              child: Hero(tag: widget.product.image,
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.cover,
                  )),
            );
  }

  TextStyle _subTitle(double fontSize, fontWeight) =>
      TextStyle(fontSize: fontSize, fontWeight: fontWeight);
}
  /* appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: null,
      leading: IconButton(onPressed: () =>Navigator.pop(context), icon: Icon(Icons.arrow_back,size: 32,color: Constant.black,),),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bookmark,size: 32,color: Constant.black,))
      ],
    ),*/