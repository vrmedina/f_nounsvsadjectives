import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  String _theState = "0";
  int _actualWordType = 0;
  late int _score;
  late Color _colorn;
  late Color _colora;
  late Color _colorword;
  final _random = Random();

  int next(int min, int max) => min + _random.nextInt(max - min);

  @override
  void initState() {
    super.initState();
    _score = 0;
    _colora = Colors.purple;
    _colorn = Colors.purple;
    _colorword = Colors.purple;
    setRandomWord();
  }

  void setRandomWord() {
    var option = next(0, 2);
    var randomItem = "";
    if (option == 0) {
      print("change to noun");
      _actualWordType = 1;
      randomItem = (nouns.toList()..shuffle()).first;
    } else {
      print("change to adjective");
      _actualWordType = 2;
      randomItem = (adjectives.toList()..shuffle()).first;
    }
    setState(() {
      _theState = randomItem;
    });
  }

  void _onPressed(int nora) {
    if (_actualWordType == 1) {
      // It's a noun
      if (nora == 1) {
        //Good answer
        setState(() {
          _score++;
          _colorword = Colors.green;
          _colorn = Colors.green;
          _colora = Colors.red;
          Timer(const Duration(seconds: 1), () {
            setState(() {
              _colorn = Colors.purple;
              _colora = Colors.purple;
              _colorword = Colors.purple;
            });
          });
        });
      } else {
        //Wrong answer
        setState(() {
          _colorword = Colors.red;
          _colorn = Colors.green;
          _colora = Colors.red;
          Timer(const Duration(seconds: 1), () {
            setState(() {
              _colorn = Colors.purple;
              _colora = Colors.purple;
              _colorword = Colors.purple;
            });
          });
        });
      }
    } else {
      // It's an adjective
      if (_actualWordType == 2) {
        if (nora == 2) {
          //Good answer
          setState(() {
            _score++;
            _colorword = Colors.green;
            _colora = Colors.green;
            _colorn = Colors.red;
            Timer(const Duration(seconds: 1), () {
              setState(() {
                _colorn = Colors.purple;
                _colora = Colors.purple;
                _colorword = Colors.purple;
              });
            });
          });
        } else {
          //Wrong answer
          setState(() {
            _colorword = Colors.red;
            _colorn = Colors.red;
            _colora = Colors.green;
            Timer(const Duration(seconds: 1), () {
              setState(() {
                _colorn = Colors.purple;
                _colora = Colors.purple;
                _colorword = Colors.purple;
              });
            });
          });
        }
      }
    }
    Timer(const Duration(seconds: 1), () {
      setRandomWord();
    });
  }

  void _onReset() {
    setState(() {
      _score = 0;
    });
    setRandomWord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Words"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  "Score: $_score",
                  style: const TextStyle(fontSize: 30, color: Colors.purple),
                ),
              )),
          Text(
            _theState,
            style: TextStyle(fontSize: 30, color: _colorword),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: ElevatedButton(
                        onPressed: () => _onPressed(1),
                        style: ElevatedButton.styleFrom(primary: _colorn),
                        child: const Text(
                          "Noun",
                          style: TextStyle(fontSize: 30),
                        )),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: ElevatedButton(
                        onPressed: () => _onPressed(2),
                        style: ElevatedButton.styleFrom(primary: _colora),
                        child: const Text(
                          "Adjective",
                          style: TextStyle(fontSize: 30),
                        )),
                  ),
                ),
              )
            ],
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ElevatedButton(
                    onPressed: () => _onReset(),
                    child: const Text(
                      "Reset",
                      style: TextStyle(fontSize: 30),
                    )),
              )),
        ],
      ),
    );
  }
}
