import 'package:flutter/material.dart';

class CreateMemoScreen extends StatefulWidget {
  const CreateMemoScreen({super.key});

  static const routeName = '/createMemoScreen';

  @override
  State<StatefulWidget> createState() {
    return CreateMemoState();
  }
}

class CreateMemoState extends State<CreateMemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New PhotoMemo'),
      ),
      body: const Text('Create new'),
    );
  }
}
