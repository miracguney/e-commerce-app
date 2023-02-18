import 'package:ecommerce_app/companents/product_card.dart';
import 'package:ecommerce_app/modal/home_products_modal.dart';
import 'package:ecommerce_app/riverpod/home_riverpod.dart';
import 'package:ecommerce_app/riverpod/riverpod_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import '../constant/constant.dart';

final homeRiverpod = ChangeNotifierProvider((ref) => HomeRiverpod());

class Home extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);

    return Scaffold(
      body: ListView(
        children: [
          campaigns(read, watch),
          homeProductCategories(read.hotDeals),
          homeProductCategories(read.mostPopular),
        ],
      ),
    );
  }

  Widget homeProductCategories(HomeProductsModal model){
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);
    return Column(
      children: [
        Padding(
            padding:[20, 10, 20, 10].paddingLTRB,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(model.catagoryTitle,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
            Text(
              "See All",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 18, fontWeight: FontWeight.w800,
                color: Colors.grey
            ),)
          ],
        ),),
        SizedBox(
          height: 270,
          child: ListView.separated(
            separatorBuilder: (context, index)=> SizedBox(width: 15,),
              itemCount: model.products.length,
              padding: [20, 10, 20, 10].paddingLTRB,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
              return ProductCard(
                product: model.products[index],
                  setMyWishList: () => read.setMyWishlist(model.products[index]),
                  setBasket: () => read.addedBasket(model.products[index]),

              );
              }),
        )
      ],
    );
  }
  SizedBox campaigns(HomeRiverpod read, HomeRiverpod watch) {
    return SizedBox(
          height: 210,
          child: Stack(children: [
            campaignsPageView(read, watch),
            campaignsDot(read, watch)
          ]),
        );
  }

  Align campaignsDot(HomeRiverpod read, HomeRiverpod watch) {
    return Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: 12.onlyBottomP,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < read.compaigns.length; i++)
                    Container(
                      width: watch.campaignsCurrentIndex == i ? 13 : 8,
                      height: 8,
                      margin: 3.allP,
                      decoration: BoxDecoration(
                          color: watch.campaignsCurrentIndex == i
                              ? Constant.white
                              : Constant.gray,
                          borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                    )
                ],
              ),
            ),
          );
  }

  PageView campaignsPageView(HomeRiverpod read, HomeRiverpod watch) {
    return PageView.builder(
              controller: read.pageController,
              itemCount: read.compaigns.length,
              itemBuilder: (context, index) =>
                  Image.asset(watch.compaigns[index]),
              onPageChanged: (newPageValue) =>
                  read.setCampignsIndex(newPageValue));
  }
}
