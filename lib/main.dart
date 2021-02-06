import 'package:flutter/material.dart';
import 'package:momsmaid/services/route_generator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/',
      //THE STARTING PAGE WILL BE THE SPLASH SCREEN ROUTE SET IN services-route_generator.dart
      // AND SPLASH SCREEN DESIGNED AND CODED IN screens-register.dart
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}
