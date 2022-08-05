import 'package:flutter/material.dart';
import 'package:school_system/src/core/models/menu_card_dashboard.dart';

class HomeButtonMenu extends StatefulWidget {
  const HomeButtonMenu({Key? key}) : super(key: key);

  @override
  State<HomeButtonMenu> createState() => _HomeButtonMenuState();
}

class _HomeButtonMenuState extends State<HomeButtonMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
       width:MediaQuery.of(context).size.width-200,
       height:250,
       padding: const EdgeInsets.only(
         left: 32 ,
          top:20
       ),
       child:listarCard() ,
    );
  }

  Widget  listarCard() {
    return ListView.separated(
       separatorBuilder: (_, index)=>SizedBox(width: 20,),
        itemCount: listaMenuCardDashBoard.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_,index){
          return InkWell(
            child:Container(
               width: 300,
               height:300,
               color: listaMenuCardDashBoard[index].color,
               child: CardItem(item:listaMenuCardDashBoard[index]),
            )
          );
        }
    );
  }

  Widget CardItem({required MenuCardDasboard item}) {
     return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Icon(item.iconData),
             const SizedBox(height:10,),
             Text(item.titulo ,style: const TextStyle(
               color: Colors.black,
               fontWeight: FontWeight.bold,
               fontSize:20
             ),),
             Text(item.descricao, style: const TextStyle(
                 color: Colors.black,
                 fontWeight: FontWeight.bold,
                 fontSize: 12
             ),) ,
             const Divider(color: Colors.white12 ,thickness: 2,),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:[
                  const Text("Quantidade",style: TextStyle(
                      color: Colors.grey,
                  ),),
                  Text(item.quantidade.toString(), style: TextStyle(
                      color: Colors.black,
                  ),)
               ],
             )
          ],
        ),
     );
  }
}
