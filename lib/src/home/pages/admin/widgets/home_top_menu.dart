import 'package:flutter/material.dart';

class HomeTopMenu extends StatefulWidget {
  const HomeTopMenu({Key? key}) : super(key: key);

  @override
  State<HomeTopMenu> createState() => _HomeTopMenuState();
}

class _HomeTopMenuState extends State<HomeTopMenu> {

 final  TextEditingController _searchGeral =  TextEditingController();
 final  GlobalKey<FormState>  _formulario  =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
       return Container(
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Row(
                 children: [
                   _logoApp(),
                   _formSearch()
                 ],
               ) ,
               SizedBox(height: 80,),
               const Padding(
                  padding:EdgeInsets.only(left: 30),
                  child:  Text("Agosto , 2022" , style: TextStyle(color:Colors.black, fontSize: 15 ,fontWeight: FontWeight.bold),),
               )
             ],
          ),
       );
  }

  Widget _logoApp() {
     return  Container(
       padding: EdgeInsets.only(
          top: 20,
          left:30
       ),
       child:  Center(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: const [
             Text(
               "Farmácia",
               style:TextStyle(
                   color: Colors.black ,
                   fontWeight: FontWeight.bold ,
                   fontSize: 22
               ) ,) ,
             Text(
               "Sistema de gestão Farmaceutica",
               style: TextStyle(
                   color: Colors.black ,
                   fontSize: 10
               ),
             )
           ],
         ),
       ),
     );
  }

  Widget _formSearch() {
     return Container(
         width: (MediaQuery.of(context).size.width/2) + 100,
         margin: const EdgeInsets.only(
           top:16,
           left: 120
         ),
         child: Form(
             key: _formulario,
             child:Column(
             children: [
                SizedBox(
                   height: 45,
                   child: TextFormField(
                     controller: _searchGeral,
                     decoration: InputDecoration(
                         hintText: "Faça uma pesquisa",
                         prefixIcon: Icon(Icons.search , color:Colors.grey , size: 25,),
                         suffixIcon: IconButton( onPressed :(){} ,icon: Icon(Icons.arrow_drop_down , size: 25, color:Colors.grey)),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.zero,
                             borderSide: BorderSide(
                                 color: Colors.white12.withOpacity(0.5)
                             )
                         ),
                         focusedBorder:OutlineInputBorder(
                             borderRadius: BorderRadius.zero,
                             borderSide: BorderSide(
                                 color: Colors.black12
                             )
                         )
                     ),
                   ),
                )
             ],
         )) ,
     );
  }


}
