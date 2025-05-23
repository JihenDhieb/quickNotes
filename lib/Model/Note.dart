import 'package:flutter/material.dart';

class Note {
  String? id;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;
  Note({this.id, this.title, this.content, this.createdAt, this.updatedAt});
  // server to object
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
        id: json['id'] as String?,
        title: json['title'] as String?,
        content: json['content'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?);
  }

//object el server
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
