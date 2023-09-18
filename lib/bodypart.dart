import 'dart:convert' show jsonDecode;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List Titles = [];
List Urls = [];
List Bodyy = [];

//List of Data
List<Dataset> dataset =[];

Future getData() async {
  final uri = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=2148a7f1f80c413bb9f78a16cab3ebfe");
  final response = await http.get(uri);
  var jsonData = jsonDecode(response.body);
  Future.delayed(Duration(seconds: 2));
  for (var eachDataset in jsonData['articles']) {
    Titles.add(eachDataset['title'].toString());
    Urls.add(eachDataset['urlToImage'].toString());
    Bodyy.add(eachDataset['content'].toString());
  };


// int index;
//   dataset[index++].fromJson(Map<String, dynamic> json){
//   headline = ['title'].toString();
//   img = ['urlToImage'].toString();
//   newsBody = ['content'].toString();
//   }

//

//   Map<String, dynamic> toJson()=> {
//   'headline':this.headline;
//   'img':this.img;
//   'newsBody':body;
//   };

  print(Titles[0]);
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
