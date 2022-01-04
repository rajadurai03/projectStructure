
import 'package:flutter/material.dart';
import '/utils/colors_utils.dart';
import '/utils/constant_utils.dart';
import '/utils/pref_manager.dart';
import 'package:get/get.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
   String? title;
   final IconData? leftsideIcon, rightsideIcon;
  late VoidCallback?  leftsideBtnPress,rightsideBtnPress;
   int?  rightsideBtnAvil;
  final AppBar? appBar;
  Color? rightIconColor;

  Toolbar(
      {this.title,
      this.leftsideIcon,
      this.rightsideIcon,
      this.leftsideBtnPress,
      this.rightsideBtnPress,
      this.rightsideBtnAvil,this.rightIconColor,this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
      iconTheme: IconThemeData(color: PreferenceUtils.getString(prefThemeMode) == ThemeMode.dark
          ? textColor
          : Colors.white,),
      title: Text(
        title!,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6,
      ),
      leading: IconButton(
        onPressed: leftsideBtnPress,
        icon: Icon(
          leftsideIcon,
        ),
      ),
      actions: <Widget>[

        rightsideBtnAvil == 1 ?   GestureDetector(
          onTap: rightsideBtnPress,
          child: Container(
              margin: EdgeInsets.only(top: 1, right: 15),
              child: Icon(
                rightsideIcon,
                size: 30,
                color: rightIconColor
              )),
        ) :Container(),

      ],
    );
  }


  @override
  Size get preferredSize => new Size.fromHeight(56);

}

