import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import 'base_scaffold.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
  @override
  void initState() {

    Future.delayed(const Duration(seconds: 2), (){
      Grock.toRemove(BaseScaffold());
    });
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.darkWhite,
      body: Center(
        child: Image.asset(Assets.imagesImSplash),
      ),
    );
  }
}
