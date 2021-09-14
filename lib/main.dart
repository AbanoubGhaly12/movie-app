import 'package:flutter/material.dart';
import 'package:movie_app/constants/app_bar.dart';
import 'package:movie_app/widgets/tab_bar_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: MainAppBar(),
          body: TabBarControllerWidget(),
        ),
      ),
    );
  }
}
