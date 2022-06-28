import 'package:f_template_juego_taller1/random_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RandomWords",
      theme: ThemeData(
        primarySwatch: Colors.purple, scaffoldBackgroundColor: Colors.purple.shade100
      ),
      home: RandomWords()));
}
