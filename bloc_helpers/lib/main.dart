import 'package:bloc_helpers/registration/form_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Hello",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bloc Register"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormPage(),
            ),
          ),
        ),
      ),
    ));
