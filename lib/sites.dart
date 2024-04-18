
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class DatabaseList extends StatefulWidget {
  const DatabaseList({super.key});
  @override
  DatabaseListState createState() => DatabaseListState();
}

class DatabaseListState extends State<DatabaseList> {
  List<dynamic> _dataArray = [];
  List<String> newList = [];

  @override
  void initState() {
    super.initState();
    fetchData(); 
  }

  Future<void> fetchData() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendData');
    final results = await callable();
    _dataArray = results.data;  
    newList = _dataArray.cast<String>();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                itemCount: newList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(newList[index].toString()),
                  );
                }
    );
  }
}
