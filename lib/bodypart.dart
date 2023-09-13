import 'dart:convert' show jsonDecode;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List Titles = [];
List Urls = [];
List Bodyy = [];

Future getData() async {
  final uri = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=2148a7f1f80c413bb9f78a16cab3ebfe");
  final response = await http.get(uri);
  var jsonData = jsonDecode(response.body);

  for (var eachDataset in jsonData['articles']) {
     Titles.add(eachDataset['title']);
      Urls.add(eachDataset['urlToImage']);
      Bodyy.add(eachDataset['content']);
  };

  print(Urls[0]);
}

class Dataset {
  final String headline;
  final String img;
  final String newsBody;

  Dataset({
    required this.headline,
    required this.img,
    required this.newsBody,
  });
}
