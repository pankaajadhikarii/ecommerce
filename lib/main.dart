import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/screens/dashboard_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: DashboardScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

