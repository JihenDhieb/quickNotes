import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknotes/viewModel/WelcomePage_ViewModel.dart';

class WelcomepageView extends StatelessWidget {
  const WelcomepageView({super.key});
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<WelcomepageViewmodel>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 217, 187),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bienvenue sur QuickNote 📝",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 243, 47, 33)),
                  minimumSize: MaterialStateProperty.all(
                      Size(200, 50)), // 🔹 largeur, hauteur
                ),
                onPressed: () => viewmodel.goToHome(context),
                child: Text(
                  "Commencer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
