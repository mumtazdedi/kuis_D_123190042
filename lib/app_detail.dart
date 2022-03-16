import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kuis_1/app_store.dart';

class AppDetail extends StatefulWidget {
  final AppStore detail;
  AppDetail({
    Key? key,
    required this.detail,
  }) : super(key: key);

  @override
  State<AppDetail> createState() => _AppDetailState();
}

class _AppDetailState extends State<AppDetail> {
  String _currentIndex = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.detail.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(widget.detail.imageLogo,
                      width: 100, height: 100),
                  Container(
                    margin: EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.detail.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.detail.genre,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.detail.rating,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  aspectRatio: 2.0,
                ),
                items: widget.detail.imageUrls.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: 100,
                      width: 200,
                      child: Card(
                        color: Colors.blueAccent,
                        child: Image.network(card),
                      ),
                    );
                  });
                }).toList(),
              ),
              SizedBox(height: 10),
              Text(widget.detail.description, textAlign: TextAlign.justify),
            ],
          ),
        ));
  }
}
