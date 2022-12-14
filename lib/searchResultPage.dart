import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'movieDetails.dart';

class SearchResultPage extends StatefulWidget {
  List<dynamic> records = [];
  SearchResultPage({required this.records});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 30, 125, 202),
          title: Text('Filmographia'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: widget.records.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              MovieDetails(record: widget.records[index]))));
                },
                child: Container(
                  height: 55.h,
                  width: double.infinity,
                  color: Color.fromARGB(255, 30, 125, 202),
                  margin: EdgeInsets.only(bottom: 6),
                  child: Center(
                    child: Text(
                      widget.records[index]['Title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            })));
  }
}
