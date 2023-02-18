import 'package:ecommerce_app/companents/product_basket.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/riverpod/home_riverpod.dart';
import 'package:ecommerce_app/view/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import '../companents/custom_button.dart';
import '../riverpod/riverpod_management.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishlistState();
}

class _WishlistState extends ConsumerState<Cart> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(productRiverpod);
    return ListView(
      padding: [15, 30].horizontalAndVerticalP,
      children: [
        deliveryContainer(),
        ListView.separated(
            padding: 20.verticalP,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 20,),
            itemCount: watch.basketProducts.length,
            itemBuilder: (context, index){
            return  ProductBasket(product: watch.basketProducts[index], setMyWishList: () => watch.setMyWishlist(watch.myWishlist[index]));
            },
        ),
        price(watch),
        CustomButton(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutView()));}, text: "Checkout")
      ],
    );
  }

  Padding price(HomeRiverpod watch) {
    return Padding(
        padding: 25.onlyBottomP,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total",style: _textStyle(25, FontWeight.bold, Constant.black),),
            Text("\$ ${watch.totalPrice}",style: _textStyle(30, FontWeight.bold, Constant.black),),
          ],
        ),
      );
  }

  Container deliveryContainer() {
    return Container(
          padding: [15, 15].horizontalAndVerticalP,
          margin: 20.horizontalP,
          decoration: BoxDecoration(
            borderRadius: 10.allBR,
            color: Colors.orange,
          ),
          child: Center(child: Text("Delivery for FREE until the end of the month")),
        );
  }
  TextStyle _textStyle(double fontSize, FontWeight fontWeight, Color color) => TextStyle(fontSize: fontSize, fontWeight: fontWeight,color: color);
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
}
