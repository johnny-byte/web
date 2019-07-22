import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Color background = Colors.black87;
Color textcolor = Colors.white70;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Builder(),
    );
  }
}

class Builder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, mode) {
        if (mode.maxWidth > 500) return DekstopPage();
        return MobilePage();
      },
    );
  }
}

class MobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: Column(
          children: <Widget>[new Avatar(), new Menu()],
        ),
      ),
    );
  }
}

class DekstopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: Row(
          children: <Widget>[new Avatar(), new Menu()],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: background,
            backgroundImage: ExactAssetImage('assets/images/avatar.jpg'),
            radius: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "Антон Чертовских",
              style: TextStyle(
                color: textcolor,
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextZone extends StatefulWidget {
  int state;
  TextZone(int state) : this.state = state;
  @override
  _TextZoneState createState() => _TextZoneState();
}

class _TextZoneState extends State<TextZone> {
  @override
  Widget build(BuildContext context) {
    switch (widget.state) {
      case 0:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Ничего не умею",
                style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.w300,
                ))
          ],
        );
        break;
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Ничего не сделал",
                style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.w300,
                ))
          ],
        );
        break;
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Нельзя связаться",
                style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.w300,
                ))
          ],
        );
        break;
    }
  }
}

class Menu extends StatefulWidget {
  const Menu({
    Key key,
  }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _state = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text("Обо мне",
                      style: TextStyle(
                        color: textcolor,
                        fontWeight: FontWeight.w300,
                      )),
                  onPressed: () {
                    setState(() {
                      this._state = 0;
                    });
                  },
                ),
                FlatButton(
                    child: Text("Работы",
                        style: TextStyle(
                          color: textcolor,
                          fontWeight: FontWeight.w300,
                        )),
                    onPressed: () {
                      setState(() {
                        this._state = 1;
                      });
                    }),
                FlatButton(
                    child: Text("Связаться",
                        style: TextStyle(
                          color: textcolor,
                          fontWeight: FontWeight.w300,
                        )),
                    onPressed: () {
                      setState(() {
                        this._state = 2;
                      });
                    }),
              ],
            ),
          ),
          Expanded(flex: 7, child: TextZone(this._state)),
        ],
      ),
    );
  }
}
