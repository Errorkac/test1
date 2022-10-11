import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class MySearchDelegate extends SearchDelegate {
  String selectedResult;
  final Function callback;

  MySearchDelegate(this.callback);

  Future<Map<String, dynamic>> loadJsonData() async {
    var response = await rootBundle.loadString('assets/city.json');
    var r = jsonDecode(response);
    log (response);
    return r;  // сделан json со списком городов дляболее удобного поиска
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),// настройка кнопки поиска
    ];
  }  // иконки

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);// создания стрелочки назад и реализация ее
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),// кнопка выбора результата
      ),
    );
  }  //

  @override
  void showResults(BuildContext context) {
    selectedResult = query;
    callback(query);
    close(context, query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchResults = [
      "Helsinki",
      "Moscow",
      "Berlin",
      "New York",
      "Saint Petersburg",
      query
    ].where((element) => element.contains(query)).toList();


    return FutureBuilder<Map<String, dynamic>>(
        future: loadJsonData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> sortList = snapshot.data["city"];
            sortList.sort(((a, b) => a["name"].compareTo(b["name"])));
            return ListView.builder(
              itemCount: sortList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(sortList[index] ['name']),
                  onTap: () {
                    selectedResult = sortList[index] ['name'];
                    callback(selectedResult);
                    Navigator.pop(context);// создаем выбор из котого мы можем либо выбирать город либо вводить его для удобного поиска
                  },
                );
              },
            );
          }
          else {
            return Center(
                child: Image(
                height: 60, image: AssetImage('images/loading.gif'))); // добавляем значек загрузки если не можем найти
          }
        });
  }
}

