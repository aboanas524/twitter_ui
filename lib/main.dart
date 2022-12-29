import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_ui/Providers/TweetProvider.dart';
import 'package:twitter_ui/UI/Screens/Welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<TweetProvider>(create: (_) => TweetProvider()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:WelcomeScreen(),
    );
  }
}
