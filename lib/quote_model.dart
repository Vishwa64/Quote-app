import 'dart:convert';

class QuoteModel {
  QuoteModel({
    this.content,
    this.author,
  });

  String? content;
  String? author;

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
    content: json["content"],
    author: json["author"],
  );

}