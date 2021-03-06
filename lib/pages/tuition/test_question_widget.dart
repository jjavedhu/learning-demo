import 'package:flutter/material.dart';

class ObjectiveTestQuestion extends StatefulWidget {
  final List questions;

  const ObjectiveTestQuestion({Key key, this.questions}) : super(key: key);
  _ObjectiveTestQuestionState createState() => _ObjectiveTestQuestionState();
}

class _ObjectiveTestQuestionState extends State<ObjectiveTestQuestion> {
  double _bodyHeight = 0.0;
  int _radioValue = -1;
  int correctScore = 0;
  int index = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          if (widget.questions[index]['correct'] == 'a') {}
          break;
        case 1:
          if (widget.questions[index]['correct'] == 'b') {}
          break;
        case 2:
          if (widget.questions[index]['correct'] == 'c') {}
          break;
        case 3:
          if (widget.questions[index]['correct'] == 'd') {}
          break;
      }
    });
  }

  String _returnCorrectAnswer() {
    String correct;
    if (widget.questions[index]['correctAnswer'] ==
        widget.questions[index]['answerA']) {
      correct = widget.questions[index]['answerA'];
    } else if (widget.questions[index]['correctAnswer'] ==
        widget.questions[index]['answerB']) {
      correct = widget.questions[index]['answerB'];
    } else if (widget.questions[index]['correctAnswer'] ==
        widget.questions[index]['answerC']) {
      correct = widget.questions[index]['answerC'];
    } else if (widget.questions[index]['correctAnswer'] ==
        widget.questions[index]['answerD']) {
      correct = widget.questions[index]['answerD'];
    } else {
      correct = 'Error, No answer found :(';
    }
    return correct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 8.0,
        title: Text('Objective Test'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0),
              ),
            ],
          ),
          child: new SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        (index + 1).toString() +
                            '. ' +
                            widget.questions[index]['question'],
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16.1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Column(children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('a.'),
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                      child: Text(widget.questions[index]
                                          ['answerA'])),
                                  Radio(
                                    value: 0,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('b.'),
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                      child: Text(widget.questions[index]
                                          ['answerB'])),
                                  Radio(
                                    value: 1,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('c.'),
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                      child: Text(widget.questions[index]
                                          ['answerC'])),
                                  Radio(
                                    value: 2,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('d.'),
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                      child: Text(widget.questions[index]
                                          ['answerD'])),
                                  Radio(
                                    value: 3,
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                ],
                              ),
                            ])
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                        child: Container(
                          color: Colors.black12,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              setState(() {
                                if (index > 0) {
                                  index--;
                                }
                              });
                            },
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Solution',
                                  style: TextStyle(color: Color(0xFF2C6DFD)),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.expand_more,
                                    color: Color(0xFF2C6DFD),
                                  ),
                                  onPressed: () {
                                    if (this._bodyHeight == 0.0) {
                                      setState(() {
                                        this._bodyHeight = 300;
                                      });
                                    } else {
                                      setState(() {
                                        this._bodyHeight = 0.0;
                                      });
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              setState(() {
                                if (index < widget.questions.length - 1) {
                                  print(widget.questions.length);
                                  index++;
                                }
                              });
                            },
                          )
                        ],
                      ),
                      new AnimatedContainer(
                        child: AnimatedOpacity(
                            opacity: this._bodyHeight == 300.0 ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 500),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          widget.questions[index]['correctAnswer'],
                                          style: TextStyle(
                                              color: Color(0xFF2C6DFD)),
                                        ),
                                        
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 500),
                        height: this._bodyHeight == 300.0 ? null : 0.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
