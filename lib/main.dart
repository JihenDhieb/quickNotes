import 'package:flutter/material.dart';
import 'package:quicknotes/View/AddNote_View.dart';
import 'package:quicknotes/View/EditNote_View.dart';
import 'package:quicknotes/View/HomeView.dart';
import 'package:quicknotes/View/WelcomePage_View.dart';
import 'package:quicknotes/viewModel/AddNote_ViewModel.dart';
import 'package:quicknotes/viewModel/DeleteNote_ViewModel.dart';
import 'package:quicknotes/viewModel/EditNote_ViewMoel.dart';
import 'package:quicknotes/viewModel/Home_ViewModel.dart';
import 'package:quicknotes/viewModel/WelcomePage_ViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WelcomepageViewmodel()),
          ChangeNotifierProvider(create: (_) => HomeViewmodel()),
          ChangeNotifierProvider(create: (_) => AddnoteViewmodel()),
          ChangeNotifierProvider(create: (_) => EditnoteViewmoel()),
          ChangeNotifierProvider(create: (_) => DeletenoteViewmodel()),
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const WelcomepageView(),
            '/home': (context) => const HomeView(),
            '/AddNotes': (context) => const AddNoteView(),
            '/EditNote': (context) => const EditnoteView(),
          },
        ));
  }
}
