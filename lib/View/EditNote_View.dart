import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknotes/viewModel/EditNote_ViewMoel.dart';

class EditnoteView extends StatefulWidget {
  const EditnoteView({Key? key}) : super(key: key);
  @override
  _EditnoteViewState createState() => _EditnoteViewState();
}

class _EditnoteViewState extends State<EditnoteView> {
  final _formKey = GlobalKey<FormState>();
  late String _id;
  late String _title;
  late String _content;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _id = args['id'];
    _title = args['title'];
    _content = args['content'];
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<EditnoteViewmoel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier la Note"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: _title,
                    decoration: InputDecoration(labelText: "Titre"),
                    onSaved: (value) {
                      _title = value ?? '';
                    },
                  ),
                  TextFormField(
                    initialValue: _content,
                    decoration: InputDecoration(labelText: "Contenu"),
                    onSaved: (value) {
                      _content = value ?? '';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _formKey.currentState!.save();
                      await viewmodel.EditNote(_id, _title, _content);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Enregistrer",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 243, 47, 33)),
                      minimumSize: MaterialStateProperty.all(
                          Size(200, 50)), // 🔹 largeur, hauteur
                    ),
                  )
                ],
              ))),
    );
  }
}
