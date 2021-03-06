import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: (itemWidth / itemHeight),
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          new RoundButton(
            label: 'Tuition',
            icon: FontAwesomeIcons.book,
            startColor: 0xFFF9D184,
            endColor: 0xFFEF4A4B,
            route: '/tuition_page',
          ),
          new RoundButton(
            label: 'Skills for Future',
            icon: FontAwesomeIcons.hourglass,
            route: '/skills_for_future',
            startColor: 0xFFBB51E5,
            endColor: 0xFFEB4B5A,
          ),
          new RoundButton(
            label: 'Career Cart',
            icon: FontAwesomeIcons.briefcase,
            startColor: 0xFF15BCE8,
            endColor: 0xFFA042E5,
            route: '/career_cart',
          ),
          new RoundButton(
            label: 'DIY Store',
            icon: FontAwesomeIcons.tape,
            startColor: 0xFFB32926,
            endColor: 0xFF6D1F1D,
            route: '/diy_store',
          ),
        ],
      
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key key,
      this.startColor,
      this.endColor,
      this.label,
      this.icon,
      this.correction,
      this.route})
      : super(key: key);

  final int startColor;
  final String route;
  final int endColor;
  final double correction;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    padding: const EdgeInsets.all(16),
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
                    label,
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
              Navigator.of(context).pushNamed(route);
            },
          ),
        ),
      ),
    ]));
  }
}
