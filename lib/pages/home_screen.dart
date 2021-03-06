import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24 -32) / 8;
    final double itemWidth = size.width / 2;

    return Container(
      child: Column(
        children: <Widget>[
          
          GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              controller: new ScrollController(keepScrollOffset: true),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(16),
              children: <Widget>[
                new RoundButton(
                  label: 'Information Portal',
                ),
                new RoundButton(
                  label: 'Calender',
                  route: '/calendar',
                ),
                new RoundButton(
                  label: 'Tuition',
                  route: '/tuition_page',
                ),
                new RoundButton(
                  label: 'Competency Skills',
                ),
                new RoundButton(
                  label: 'Skills for Future',
                  route: '/skills_for_future',
                ),
                new RoundButton(
                  label: 'Career Cart',
                  route: '/career_cart',
                ),
                new RoundButton(
                  label: 'DIY Store',
                  route: '/diy_store',
                ),
                new RoundButton(
                  label: 'Doubt Destroyer',
                ),
                new RoundButton(
                  label: 'eResouces',
                ),
                new RoundButton(
                  label: 'Homework Assistance',
                ),
              ]),
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final String route;
  final String label;
  const RoundButton({
    Key key,
    this.route,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      new Positioned.fill(
        bottom: 0.0,
        child: Container(
          decoration: BoxDecoration(
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
          child: new Center(
            child: new Text(
              label,
              style: new TextStyle(color: Color(0xFF2C6DFD), fontSize: 16.1),
            ),
          ),
        ),
      ),
      new Positioned.fill(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: () {
              if (route != null) {
                Navigator.of(context).pushNamed(route);
              }
            },
          ),
        ),
      ),
    ]);
  }
}
