import 'package:flutter/material.dart';

import '../../utils/routes/routes_name.dart';

class SplashServices {
  Future<void> checkAuthentication(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushNamed(context, RoutesName.home);
  }
}
