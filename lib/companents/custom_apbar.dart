import 'package:ecommerce_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget{

  @override
  final Size preferredSize;
  final String apbarTitle;

  CustomAppbar({Key? key, this.apbarTitle = "iDrip",}) : preferredSize = const Size.fromHeight(56.0), super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
          title: Center(
            child: Text(apbarTitle,
            style: TextStyle(color: Constant.black, fontWeight: FontWeight.bold),),
          ),
      leading: IconButton(onPressed: () {

      },
          icon: Icon(Icons.menu,color: Constant.black)
      ),
      actions: [
        Padding(
          padding: 12.allP,
          child: IconButton(onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.search,color: Constant.black)
          ),
        ),
      ],
      backgroundColor: Constant.darkWhite,
    );

  }
}
