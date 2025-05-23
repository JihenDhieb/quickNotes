import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quicknotes/Model/Note.dart';
import 'package:quicknotes/viewModel/DeleteNote_ViewModel.dart';
import 'package:quicknotes/viewModel/Home_ViewModel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewmodel>(context, listen: false).fetchNotesFromServer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final view = Provider.of<DeletenoteViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("📒 Mes Notes"),
        backgroundColor: Colors.redAccent,
      ),
      body: Consumer<HomeViewmodel>(
        builder: (context, viewmodel, child) {
          final notes = viewmodel.notes;
          if (notes.isEmpty) {
            return const Center(child: Text("Aucune note trouvée."));
          }
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                elevation: 4,
                child: ListTile(
                  title: Text(note.title ?? "Sans titre"),
                  subtitle: Text(note.content ?? ""),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange),
                        onPressed: () async {
                          final result = await Navigator.pushNamed(
                              context, '/EditNote',
                              arguments: {
                                'id': note.id,
                                'title': note.title,
                                'content': note.content,
                              });
                          if (result == true) {
                            Provider.of<HomeViewmodel>(context, listen: false)
                                .fetchNotesFromServer();
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await view.DeleteNote(note.id!);
                          await Provider.of<HomeViewmodel>(context,
                                  listen: false)
                              .fetchNotesFromServer();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<HomeViewmodel>(context, listen: false)
              .goToAddNotes(context);
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
