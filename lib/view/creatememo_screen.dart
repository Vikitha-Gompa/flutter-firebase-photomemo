import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesson6/controller/auth_controller.dart';
import 'package:lesson6/controller/creatememo_controller.dart';
import 'package:lesson6/model/creatememo_model.dart';
import 'package:lesson6/model/photomemo.dart';

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
                photoPreview(),
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

  Widget photoPreview() {
    return Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: model.photo == null
                ? const FittedBox(child: Icon(Icons.photo_library))
                : (kIsWeb)
                    ? Image.memory(model.photo)
                    : Image.file(model.photo)),
        Positioned(
          right: 0.0,
          bottom: 0.0,
          child: Container(
            color: Colors.blue[100],
            child: PopupMenuButton(
              onSelected: null,
              itemBuilder: (BuildContext context) {
                if (kIsWeb) {
                  return [
                    PopupMenuItem(
                      value: CameraOrGallery,
                      child: Text(
                        CameraOrGallery.gallery.name.toLowerCase(),
                      ),
                    ),
                  ];
                } else {
                  return [
                    for (var source in CameraOrGallery.values)
                      PopupMenuItem(
                        value: source,
                        child: Text(
                          source.name.toUpperCase(),
                        ),
                      ),
                  ];
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
