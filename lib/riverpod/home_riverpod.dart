import 'package:ecommerce_app/generated/assets.dart';
import 'package:ecommerce_app/modal/home_products_modal.dart';
import 'package:ecommerce_app/modal/product.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class HomeRiverpod extends ChangeNotifier{

  List<ProductModal> myWishlist = [];
  List<ProductModal> basketProducts = [];
  double totalPrice = 0.0;
  List<String> categoryImage = [Assets.imagesImg1,Assets.imagesImg4,Assets.imagesImg3,Assets.imagesImg6,];
  List<String> categoryTitle = ["iphones"," Watches","i Macs","Macbooks",];



  void setMyWishlist(ProductModal model){
    if(model.isSaved){
      model.isSaved = false;
      myWishlist.remove(model);
      notifyListeners();
    }else{
      model.isSaved = true;
      myWishlist.add(model);
      notifyListeners();
    }
  }

  void setTotalPrice(ProductModal model) {
    totalPrice += model.price;
  }

  void addedBasket(ProductModal model) {
    basketProducts.add(model);
    setTotalPrice(model);
    Grock.snackBar(
      title: "Başarılı",
      description: "${model.title} başarıyla sepete eklendi",

    );
  }



  List<String> compaigns = [Assets.imagesImg,Assets.imagesImg,Assets.imagesImg,];

  int campaignsCurrentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  void setCampignsIndex(int newPageValue){
    campaignsCurrentIndex = newPageValue;
    notifyListeners();
  }

  HomeProductsModal hotDeals =
      HomeProductsModal(
          catagoryTitle: "Hot Deals",
          products:[ ProductModal(
              image: Assets.imagesImg1,
              title: "Apple iPhone 12",
              price: 1299,
              star: 4.9,
              isSaved: false,
              colors: [Colors.cyan, Colors.deepPurple, Colors.greenAccent],
              descTitle: "Our environmental goals",
              descDetail: "The iPhone 12 does not come with a power adapter or EarPods as part of our efforts to reach our goal of being completely carbon neutral by 2030. Inside the box is a USB-C to Lightning Cable that supports fast charging, compatible with USB-C power adapters and computer ports."
          ),
            ProductModal(
                image: Assets.imagesImg4,
                title: "Apple Watch V1 (2020)",
                price: 900,
                star: 4.7,
                isSaved: false,
                colors: [Colors.cyan, Colors.deepPurple, Colors.greenAccent],
                descTitle: "Our environmental goals",
                descDetail: "The iPhone 12 does not come with a power adapter or EarPods as part of our efforts to reach our goal of being completely carbon neutral by 2030. Inside the box is a USB-C to Lightning Cable that supports fast charging, compatible with USB-C power adapters and computer ports."

            ),
            ProductModal(
                image: Assets.imagesImg3,
                title: "Apple iMac 24'(2021)",
                price: 1909,
                star: 4.7,
                isSaved: false,
                colors: [Colors.cyan, Colors.deepPurple, Colors.greenAccent],
                descTitle: "Our environmental goals",
                descDetail: "The iPhone 12 does not come with a power adapter or EarPods as part of our efforts to reach our goal of being completely carbon neutral by 2030. Inside the box is a USB-C to Lightning Cable that supports fast charging, compatible with USB-C power adapters and computer ports."

            ),]);

  HomeProductsModal mostPopular =
          HomeProductsModal(
          catagoryTitle: "Most Popular",
          products:[ ProductModal(
              image: Assets.imagesImg2,
              title: "iPad Pro 11 inç (2. nesil)",
              price: 1099,
              star: 4.6,
              isSaved: false,
              colors: [Colors.cyan, Colors.deepPurple, Colors.greenAccent],
              descTitle: "Our environmental goals",
              descDetail: "The iPhone 12 does not come with a power adapter or EarPods as part of our efforts to reach our goal of being completely carbon neutral by 2030. Inside the box is a USB-C to Lightning Cable that supports fast charging, compatible with USB-C power adapters and computer ports."

          ),
            ProductModal(
                image: Assets.imagesImg5,
                title: "APPLE Watch Series SE ",
                price: 1399,
                star: 4.8,
                isSaved: false,
                colors: [Colors.cyan, Colors.deepPurple, Colors.greenAccent],
                descTitle: "Our environmental goals",
                descDetail: "The iPhone 12 does not come with a power adapter or EarPods as part of our efforts to reach our goal of being completely carbon neutral by 2030. Inside the box is a USB-C to Lightning Cable that supports fast charging, compatible with USB-C power adapters and computer ports."

            ),
            ProductModal(
                image: Assets.imagesImg4,
                title: "APPLE Watch Ultra",
                price: 1909,
                star: 4.8,
                isSaved: false,
                colors: [Colors.cyan, Colors.deepPurple, Colors.greenAccent],
                descTitle: "Our environmental goals",
                descDetail: "The iPhone 12 does not come with a power adapter or EarPods as part of our efforts to reach our goal of being completely carbon neutral by 2030. Inside the box is a USB-C to Lightning Cable that supports fast charging, compatible with USB-C power adapters and computer ports."

            ),]);




}