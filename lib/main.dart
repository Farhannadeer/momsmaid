import 'package:flutter/material.dart';
import 'package:momsmaid/services/route_generator.dart';
import 'package:provider/provider.dart';

class Data with ChangeNotifier{

  bool item1=false;
  bool item2=false;
  bool item3=false;
  var item1Count=0;
  var item2Count=0;
  var item3Count=0;


}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>Data(),
      child: MaterialApp(

        initialRoute: '/',
        //THE STARTING PAGE WILL BE THE SPLASH SCREEN ROUTE SET IN services-route_generator.dart
        // AND SPLASH SCREEN DESIGNED AND CODED IN screens-register.dart
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
