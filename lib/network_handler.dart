import 'dart:convert';

import 'package:codes/quote_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class NetworkHandler with ChangeNotifier{

  QuoteModel _quote = QuoteModel();
  bool _quoteLoading = true;
  bool _error = false;
  String _errorMessage = '';


  QuoteModel get quote => _quote;
  bool get quoteLoading => _quoteLoading;
  bool get error => _error;
  String get errorMessage => _errorMessage;



  Future<void> get fetchQuote async{
    _quoteLoading=true;

    var response = await http.get(Uri.http('api.quotable.io', 'random'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        _quote = QuoteModel.fromJson(jsonDecode(response.body));
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
      }
    }
    else {
      _error = true;
      _errorMessage='Error : Check your internet connection';
    }

    notifyListeners();
    _quoteLoading = false;

  }
}