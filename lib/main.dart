import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:online_storage/loginpage.dart';
import 'package:online_storage/loginprovide.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  // we are telling to flutter we binded an external packages in our flutter project please ensure that
  WidgetsFlutterBinding.ensureInitialized();

  // init firebase // from firebase options
  // its a future function so we need to make it async
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(

      // connected app with provider state management
      // when we are using more than one provider we will use multi provider
      MultiProvider(providers: [
    // providers need our all provider with chanage notifier provider
    ChangeNotifierProvider(
      create: (context) {
        // added our provider
        return LoginProvider();
      },
    ),
    // inited root widget so we can access provider function on this  widget tree
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
