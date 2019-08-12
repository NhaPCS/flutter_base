import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class SizeUtil {
  static const EdgeInsets defaultMargin = EdgeInsets.all(20);
  static const EdgeInsets bigMargin = EdgeInsets.all(40);
  static const EdgeInsets defaultPadding = EdgeInsets.all(15);
  static const EdgeInsets smallPadding = EdgeInsets.all(8);
  static const EdgeInsets normalPadding = EdgeInsets.all(12);
  static const EdgeInsets tinyPadding = EdgeInsets.all(5);

  static const double avatarSize = 90;
  static const double avatarSizeBig = 150;
  static const double avatarSizeSmall = 40;
  static const double iconSize = 32;
  static const double iconSizeTiny = 13;
  static const double iconSizeMini = 10;
  static const double iconSizeNormal = 20;
  static const double iconSizeBig = 40;

  static const double textSizeDefault = 17;
  static const double textSizeSmall = 12;
  static const double textSizeTiny = 9;
  static const double textSizeBig = 35;
  static const double textSizeBigger = 25;
  static const double textSizeHuge = 50;
  static const double textSizeSuperHuge = 90;

  static const double elevationDefault = 3;
  static const double elevationBig = 6;

  static const double spaceDefault = 10;
  static const double spaceNormal = 15;
  static const double defaultRadius = 20;
  static const double bigRadius = 30;
  static const double smallRadius = 10;
  static const double tinyRadius = 5;
  static const double spaceBig = 20;
  static const double spaceHuge = 35;
  static const double spaceSmall = 5;

  static const double lineSize = 1;
}

class Constant {
}

class WidgetUtil {
  static final List<String> randomImages = [
    'icons/vodien_1.png',
    'icons/vodien_2.jpg'
  ];

  static Icon getIcon(BuildContext context, IconData icon) {
    return Icon(
      icon,
      color: Theme.of(context).primaryColor,
    );
  }

  static Widget getCircleImage(double size, String url) {
    if (url == null || url.isEmpty || !url.startsWith("http")) {
      return new Container(
          width: size,
          height: size,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("icons/vodien_1.png"))));
      ;
    } else
      return new Container(
          width: size,
          height: size,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new CachedNetworkImageProvider(url))));
  }

  static Widget getCircleImageWithMargin(double size, String url, double marg) {
    return new Container(
        margin: EdgeInsets.all(marg),
        width: size,
        height: size,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill, image: new CachedNetworkImageProvider(url))));
  }

  static Widget getCircleImageRandom(String avatar, double size, int index) {
    return Card(
      shape: CircleBorder(),
      elevation: 5,
      child: Container(
          width: size,
          height: size,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: avatar == null
                      ? new AssetImage(randomImages[index % 2])
                      : CachedNetworkImageProvider(avatar)))),
    );
  }

  static Widget getCircleImageFile(File avatar, double size) {
    return Card(
      shape: CircleBorder(),
      elevation: 5,
      child: Container(
          width: size,
          height: size,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover, image: FileImage(avatar)))),
    );
  }

  static Widget getRoundedButton(
      BuildContext context, String text, VoidCallback callback) {
    return RaisedButton(
      onPressed: callback,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Theme.of(context).primaryColor,
    );
  }

  static Widget getRoundedButtonWithColor(
      BuildContext context, String text, Color color, VoidCallback callback) {
    return RaisedButton(
      onPressed: callback,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: color,
    );
  }

  static Widget getSmallRoundedButton(
      BuildContext context, String text, VoidCallback callback) {
    return RaisedButton(
      onPressed: callback,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Theme.of(context).primaryColor,
    );
  }

  static Widget getRoundedButtonWhite(
      BuildContext context, String text, VoidCallback callback) {
    return RaisedButton(
      onPressed: callback,
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.white,
    );
  }

  static List<Shadow> getTextShadow() {
    List<Shadow> rs = List();
    rs.add(Shadow(
      offset: Offset(4.0, 4.0),
      blurRadius: 5.0,
      color: Color.fromARGB(100, 0, 0, 0),
    ));
    return rs;
  }

  static Widget getPrimaryIcon(BuildContext context, IconData icon) {
    return Icon(
      icon,
      color: Theme.of(context).primaryColor,
      size: SizeUtil.iconSize,
    );
  }

  static Widget getPrimaryIconWithColor(
      BuildContext context, IconData icon, Color color) {
    return Icon(
      icon,
      color: color,
      size: SizeUtil.iconSize,
    );
  }

  static showMessageDialog(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
  }

  static showErrorDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Chú ý",
              style:
                  TextStyle(color: ColorUtil.red, fontWeight: FontWeight.bold),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(
                        color: ColorUtil.red, fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
  }

  static showLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  static showAlertDialog(BuildContext context, String title, String message,
      String positive, VoidCallback positiveClick) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: positiveClick,
                  child: Text(
                    positive,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
  }

  static showLoadingDialog(BuildContext context, VoidCallback positiveClick) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  static showConfirmDialog(
      BuildContext context,
      String title,
      String message,
      String positive,
      VoidCallback positiveClick,
      String negative,
      VoidCallback negativeClick) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: negativeClick,
                  child: Text(
                    negative,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  )),
              FlatButton(
                  onPressed: positiveClick,
                  child: Text(
                    positive,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
  }

  static Future<bool> showConfirmExitDialog(
      BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Xác nhận",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "Không",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "Có",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
  }

}

class ColorUtil {
  static const Color background = Color(0xFFF4F4F4);
  static const Color lineColor = Color(0xFFE2E2E2);
  static const Color hintColor = Color(0xFFDBDBDB);
  static const Color red = Color(0xFFa71022);
  static const Color textGray = Color(0xFF949494);
  static const Color textColor = Color(0xFF383838);
}
