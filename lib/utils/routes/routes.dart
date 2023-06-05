import 'package:flutter/material.dart';

import '../../utils/routes/routes_name.dart';
import '../../view/home_screen.dart';
import '../../view/product_details_page.dart';
import '../../view/splash_view.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RoutesName.productDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductDetailsPage(
                  params: arguments,
                ));
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('NO route defined')),
          );
        });
    }
  }
}
