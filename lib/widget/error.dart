
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class ErrorMessage extends StatelessWidget {

  String? image,title,message;
 ErrorMessage({this.image,this.title,this.message}) ;

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      SizedBox(height: 100,),
      logo(context, image!),
      SizedBox(height: 25,),
      titleData(context,title!),
      SizedBox(height: 25,),
      messageData(context,message!)







    ],);
  }
}

Widget logo(BuildContext context,String image) {
  return Container(
    padding: EdgeInsets.all(40),
    width: double.infinity,
    height: MediaQuery.of(context).size.height / 4,
    child: SvgPicture.asset(image),
  );
}

Widget titleData(BuildContext context, String? title) {
  return Text(
    title!,
    style: Theme.of(context).textTheme.bodyText1!,
  );
}


Widget messageData(BuildContext context, String? title) {
  return Text(
    title!,textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.bodyText2!
  );
}
