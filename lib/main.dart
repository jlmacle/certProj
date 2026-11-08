import 'package:expense_manager/models/expense_provider.dart';
import 'package:expense_manager/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider
    (
      create: (_) => ExpenseProvider(),
      child:   
      MaterialApp(
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen(),
      )
    );
  }
}

