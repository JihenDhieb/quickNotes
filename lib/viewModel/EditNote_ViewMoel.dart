import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quicknotes/Config/config.dart';
import 'package:http/http.dart' as http;

class EditnoteViewmoel extends ChangeNotifier {
  Future<void> EditNote(String id, String title, String content) async {
    final url = Uri.http(Config.apiUrl, '/api/notes/$id');
    Map<String, dynamic> notedata = {
      'id': id,
      'title': title,
      'content': content,
    };

    try {
      final response = await http.put(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(notedata));
      if (response.statusCode == 200) {
        notifyListeners();
      } else {
        print('Erreur serveur: ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de modificaton: $e');
    }
  }
}
