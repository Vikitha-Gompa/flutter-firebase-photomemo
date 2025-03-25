import 'package:flutter/material.dart';
import 'package:lesson6/model/photomemo.dart';

class DetailViewScreen extends StatefulWidget {
  const DetailViewScreen({required this.photoMemo, super.key});

  static const routeName = '/detailViewScreen';
  final PhotoMemo photoMemo;

  @override
  State<StatefulWidget> createState() {
    return DetailViewState();
  }
}

class DetailViewState extends State<DetailViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed View'),
      ),
      body: Text(widget.photoMemo.title),
    );
  }
}
