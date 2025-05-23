import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quicknotes/Config/config.dart';
import 'package:http/http.dart' as http;

class AddnoteViewmodel extends ChangeNotifier {
  Future<bool> AddNotes(String title, String content) async {
    final url = Uri.http(Config.apiUrl, '/api/notes');
    Map<String, dynamic> notedata = {
      'title': title,
      'content': content,
    };
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(notedata),
      );
      if (response.statusCode == 200) {
        notifyListeners();
        return true;
      } else {
        print('Erreur serveur: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Erreur lors de l\'ajout: $e');
      return false;
    }
  }
}
