import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kuis_1/app_store.dart';
import 'package:url_launcher/url_launcher.dart';

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
  _launchURL() async {
    if (await canLaunch(widget.detail.appLink)) {
      await launch(widget.detail.appLink);
    } else {
      throw 'Could not launch $widget.detail.appLink';
    }
  }

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
                  aspectRatio: 2.0,
                  scrollDirection: Axis.horizontal,
                ),
                items: widget.detail.imageUrls.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
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
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _launchURL,
                child: Text('Download'),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    textStyle: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ));
  }
}
