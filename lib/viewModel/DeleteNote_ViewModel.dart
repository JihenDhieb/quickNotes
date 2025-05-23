import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quicknotes/Config/config.dart';
import 'package:http/http.dart' as http;

class DeletenoteViewmodel extends ChangeNotifier {
  Future<void> DeleteNote(String id) async {
    final api = Uri.http(Config.apiUrl, '/api/notes/$id');
    try {
      final response = await http.delete(api);
      if (response.statusCode == 200) {
        notifyListeners();
      } else {
        print("Erreur suppression: ${response.statusCode}");
      }
    } catch (e) {
      print("Erreur: $e");
    }
  }
}
