import 'package:ecommerce_app/view/account.dart';
import 'package:ecommerce_app/view/cart.dart';
import 'package:ecommerce_app/view/category.dart';
import 'package:ecommerce_app/view/home.dart';
import 'package:ecommerce_app/view/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseScaffoldRiverpod extends ChangeNotifier{
List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home",),
  BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Wishlist"),
  BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: "Category"),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
  BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "Cart"),
];
int currentIndex = 0;

void setCurrentIndex(int index){
  currentIndex = index;
  notifyListeners();
}

Widget body(){
  switch (currentIndex){
    case 0:
  return Home();
    case 1:
  return Wishlist();
    case 2:
  return Category();
    case 3:
  return Account();
    case 4:
  return Cart();
    default:
    return Home();
  }
}
}