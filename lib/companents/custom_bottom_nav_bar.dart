import 'package:ecommerce_app/view/base_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constant/constant.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(baseScaffoldRiverpod);
    var read = ref.read(baseScaffoldRiverpod);
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        backgroundColor: Color(0xFF6200EE),
         items: read.items,
          currentIndex: watch.currentIndex,
          onTap: (newPageIndex) => read.setCurrentIndex(newPageIndex),
        selectedItemColor: Colors.orange,
        showUnselectedLabels: true,
        unselectedItemColor: Constant.black,
      ),
    );
  }
}
