import 'package:ecommerce_app/riverpod/home_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRiverpod = ChangeNotifierProvider((_) => HomeRiverpod());