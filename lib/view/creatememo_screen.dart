import 'package:flutter/material.dart';
import 'package:lesson6/controller/auth_controller.dart';
import 'package:lesson6/controller/creatememo_controller.dart';
import 'package:lesson6/model/creatememo_model.dart';

class CreateMemoScreen extends StatefulWidget {
  const CreateMemoScreen({super.key});

  static const routeName = '/createMemoScreen';

  @override
  State<StatefulWidget> createState() {
    return CreateMemoState();
  }
}

class CreateMemoState extends State<CreateMemoScreen> {
  late CreateMemoModel model;
  late CreateMemoController con;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    model = CreateMemoModel(user: currentUser!);
    con = CreateMemoController(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New PhotoMemo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                  autocorrect: true,
                  validator: null,
                  onSaved: null,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'memo',
                  ),
                  autocorrect: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                  validator: null,
                  onSaved: null,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Shared with (email list seperated by , ; )',
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  validator: null,
                  onSaved: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
