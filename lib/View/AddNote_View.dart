import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quicknotes/viewModel/AddNote_ViewModel.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({Key? key}) : super(key: key);

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _content = '';

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddnoteViewmodel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Ajouter une Note")),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Titre"),
                onSaved: (value) {
                  _title = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un titre';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Contenu"),
                onSaved: (value) {
                  _content = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un contenu';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 243, 47, 33)),
                  minimumSize: MaterialStateProperty.all(
                      Size(200, 50)), // 🔹 largeur, hauteur
                ),
                child: Text("Ajouter", style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    await viewModel.AddNotes(_title, _content);

                    // Retour à la page précédente après ajout
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
