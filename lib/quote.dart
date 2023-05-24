import 'dart:convert';

import 'package:codes/network_handler.dart';
import 'package:codes/quote_components.dart';
import 'package:codes/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class Quote extends StatefulWidget {
  const Quote({Key? key}) : super(key: key);

  @override
  _QuoteState createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {

  @override
  Widget build(BuildContext context) {

    context.read<NetworkHandler>().fetchQuote;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Quote',style: appBarTitle,),
          actions: [
            IconButton(onPressed: (){
              if (context.read<NetworkHandler>().quoteLoading == false) {
                context.read<NetworkHandler>().fetchQuote;
              }
            }, icon: Icon(Icons.refresh_rounded,size: 30,))
          ],
        ),
        body: GestureDetector(
          onVerticalDragUpdate: (details) async {
            if (details.delta.dy < -0) {
              if (context.read<NetworkHandler>().quoteLoading == false) {
                context.read<NetworkHandler>().fetchQuote;
              }
            }
          },

          child: Container(
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Consumer<NetworkHandler>(builder: (context, value, child) {

                return value.quoteLoading
                    ? loading()
                    : value.error
                    ? errorMessage(value.errorMessage)
                    : quoteCenter(value.quote.content, value.quote.author);
              }),
            ),
          ),
        )
    );


  }


}