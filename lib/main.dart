import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view_models/todo_viewModel.dart';
import 'package:todo_app/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TodoViewmodel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-do App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
