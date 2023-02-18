import 'package:ecommerce_app/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class CustomButton extends StatelessWidget {

  Function onTap;
  String text;


  CustomButton({required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 65, child:

      ElevatedButton(style: ElevatedButton.styleFrom(
          primary: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: 14.allBR)
      ),
          onPressed: ()=> onTap(),
          child: Text(
            text,style: TextStyle(
              color: Constant.white,
              fontWeight: FontWeight.bold,fontSize: 25),
          ) ),
    );
  }
}
