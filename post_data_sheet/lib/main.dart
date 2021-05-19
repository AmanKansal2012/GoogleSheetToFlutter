
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:post_data_sheet/model/form_model.dart';

import 'form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Post DATA to Sheet",

        home:FormScreen()
    );
  }
}


