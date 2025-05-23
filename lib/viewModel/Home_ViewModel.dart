import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:quicknotes/Config/config.dart';
import 'package:quicknotes/Model/Note.dart';

class HomeViewmodel extends ChangeNotifier {
  void goToAddNotes(BuildContext context) async {
    Navigator.pushNamed(context, '/AddNotes');
  }

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  Future<void> fetchNotesFromServer() async {
    final url = Uri.http(Config.apiUrl, '/api/notes');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _notes = data.map((noteJson) => Note.fromJson(noteJson)).toList();
        notifyListeners();
      } else {
        print('Erreur serveur: ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors du fetch: $e');
    }
  }
}
