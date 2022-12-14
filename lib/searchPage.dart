import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:tptest/searchResultPage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchMovie = TextEditingController();
  List<dynamic> Data = [];
  void searchForMovie() async {
    String rech = searchMovie.text;
    String url = 'https://www.omdbapi.com/?s='+ rech +'&apikey=f974ee1e';
    var responce = await http.get(Uri.parse(Uri.encodeFull(url)));
    var tojson = json.decode(responce.body);

    setState(() {
      Data = tojson['Search'];
      searchMovie.clear();
    });
    //print(Data);
  }

  void initState() {
    super.initState();
    searchForMovie();
  }

  List<dynamic> selectedRecords = [];
  void findRecords() {
    selectedRecords =
        Data.where((element) => element['Title'].contains(searchMovie.text))
            .toList();
    //print(selectedRecords);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) =>
                SearchResultPage(records: selectedRecords))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 125, 202),
        title: Text('Filmographia'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Rechercher un film :',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: searchMovie,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  ))),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    searchForMovie();
                    findRecords();
                  },
                  child: Text(
                    'Rechercher',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(),
                ),
              ],
            ),
            Text(
            '(Si rien n apparait rechercher puis ensuite laisser la case vide)',
            style: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,))
          ],
        ),
      ),
    );
  }
}
