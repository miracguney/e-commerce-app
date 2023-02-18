import 'dart:ui';

class ProductModal{
  String image;
  String title;
  int price;
  double star;
  bool isSaved;
  String descTitle;
  String descDetail;
  List<Color> colors;

  ProductModal(
      {
      required this.image,
      required this.title,
      required this.price,
      required this.star,
      required this.isSaved,
      required this.colors,
      required this.descTitle,
      required this.descDetail
      });
}