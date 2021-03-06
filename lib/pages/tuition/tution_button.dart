import 'package:edapt/pages/tuition/tution_detail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutionButton extends StatelessWidget {
  const TutionButton(
      {Key key,
      this.startColor,
      this.endColor,
      this.title,
      this.icon,
      this.correction,
      this.routePage})
      : super(key: key);

  final int startColor;
  final int endColor;
  final double correction;
  final String title;
  final IconData icon;
  final String routePage;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 172,
        width: 172,
        padding: EdgeInsets.all(6.0),
        child: Stack(children: <Widget>[
          new Positioned.fill(
            bottom: 0.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(startColor), Color(endColor)],
                  tileMode: TileMode.repeated,
                ),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 10.0,
                    offset: new Offset(0.0, 2.0),
                  ),
                ],
              ),
              child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Icon(
                                icon,
                                size: 64,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: correction,
                              )
                            ]),
                      ),
                      new Text(
                        title,
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 16.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),
            ),
          ),
          new Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10.0),
                onTap: () {
                  SharedPreferencesHelper.getUserDetails().then((onValue) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TuitionDetail(
                              startColor: startColor,
                              endColor: endColor,
                              subject: title,
                              standard: onValue['standard']+'th',
                              syllabus: onValue['syllabus'].toLowerCase(),
                            ),
                      ),
                    );
                  });
                },
              ),
            ),
          ),
        ]));
  }
}

class SharedPreferencesHelper {
  static final Map _userDetails = {
    'name': '',
    'phone': '',
    'standard': '',
    'syllabus': '',
  };

  static Future<Map> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _userDetails['name'] = prefs.getString('username') ?? 'Error?';
    _userDetails['phone'] = prefs.getString('phone') ?? 'Error?';
    _userDetails['standard'] = prefs.getString('standard') ?? 'Error?';
    _userDetails['syllabus'] = prefs.getString('syllabus') ?? 'Error?';

    return _userDetails;
  }
}
