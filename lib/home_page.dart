import 'package:flutter/material.dart';
import 'package:kuis_1/app_store.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App Store'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final AppStore appOne = appList[index];
            return Card(
              child: InkWell(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.network(appOne.imageLogo,
                          width: 100, height: 100),
                    ),
                    Container(
                      margin: EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(appOne.name, style: TextStyle(fontSize: 18)),
                          SizedBox(height: 10),
                          Text(
                            appOne.genre,
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          Text(
                            appOne.rating,
                            style: TextStyle(fontSize: 10),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  print("Tapped on container");
                },
              ),
            );
          },
          itemCount: appList.length,
        ),
      ),
    );
  }
}
