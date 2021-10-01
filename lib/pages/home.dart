import 'dart:convert';

import 'package:api_example/services/news_repository.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final repository = NewsRepositoryImpl();
  String? response;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews()async{
    final result = await repository.getNews('id');
    setState(() {
      response = jsonEncode(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Example"),),
      body: response==null? Center(child: CircularProgressIndicator()) : Text(response!)
    );
  }
}