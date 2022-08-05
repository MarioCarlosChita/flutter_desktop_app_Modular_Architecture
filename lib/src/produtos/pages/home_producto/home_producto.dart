import 'package:flutter/material.dart';

import '../widgets/home_form_page.dart';
import '../widgets/home_list_page.dart';

class HomeProductoPage extends StatefulWidget {
  const HomeProductoPage({Key? key}) : super(key: key);

  @override
  State<HomeProductoPage> createState() => _HomeProductoPageState();
}

class _HomeProductoPageState extends State<HomeProductoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        top:5
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child:Text(
              "Dashboard : Productos" ,
              style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold , fontSize: 20),
            ),
          ),
          SizedBox(height:5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               HomeFormPage(),
               HomeListPage()
            ],
          )
        ],
      ),
    );
  }
}
