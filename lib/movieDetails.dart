import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetails extends StatefulWidget {
  Map record = {};
  MovieDetails({required this.record});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 46, 46),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 125, 202),
        title: Text('Movie Details'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.record['Title'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.record['Year'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 400.h,
                width: 300.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.record['Poster']))),
              ),
              Text(
              widget.record['imdbID'], //['Plot']
    style: TextStyle(
    color: Colors.white,))
            ],
          ),
        ),
      ),
    );
  }
}
