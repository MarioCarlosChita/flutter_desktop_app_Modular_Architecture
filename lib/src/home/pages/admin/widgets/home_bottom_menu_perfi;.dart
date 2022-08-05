import 'package:flutter/material.dart';


class HomeBottomMenuPerfil extends StatelessWidget {
  const HomeBottomMenuPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Center(
           child: Column(
             children: [
               IconButton(
                   onPressed: (){},
                   icon: Icon(Icons.notification_important_outlined ,size: 20,) ,
                   color: Colors.black,
               ) ,
               const SizedBox(height:20,),
               IconButton(
                   onPressed: (){},
                   icon: Icon(Icons.settings , size: 20,) ,
                   color: Colors.black,
               ),
               const SizedBox(height:20,),
               SizedBox(
                 width:30,
                 height:30,
                 child: ClipOval(
                   child:  Image.asset("assets/images/img2.jpg"),
                 ),
               )
             ],
           ),
        ),
    );
  }
}
