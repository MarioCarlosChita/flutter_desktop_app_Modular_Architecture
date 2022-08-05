import 'package:flutter/material.dart';
import 'package:school_system/src/core/models/pagination_position_menu.dart';
import '../../../../core/change_notifier/pagination_position_notifier.dart';
import '../../../../core/enums/type_page.dart';
import '../../../../core/models/menu_settting.dart';

class HomeDrawerMenu extends StatefulWidget {

  GlobalKey<ScaffoldState>  drawerUserMenu;
  HomeDrawerMenu({required this.drawerUserMenu});

  @override
  State<HomeDrawerMenu> createState() => _HomeDrawerMenuState();
}

class _HomeDrawerMenuState extends State<HomeDrawerMenu> {
  final PaginationPositionNotifier  _paginationPositionNotifier  =  PaginationPositionNotifier.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: 250,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
              UserPerfil(),
              SizedBox(height:10,) ,
              Container(
                 height:500,
                 child:  _menusListaDrawer()
              )
          ],
        ),
    );
  }

  Widget UserPerfil() {
      return Container(
          height: 200,
          padding: const EdgeInsets.only(
             top:20
          ),
          color: Colors.white,
          child: Column(
             children: [
                 SizedBox(
                    width:90,
                    height:90,
                    child: ClipOval(
                       child: Image.asset("assets/images/img2.jpg"),
                    ),
                 ) ,
                 SizedBox(height:5,),
                 _UserDetailDrawerMenu(funcao: "Email" , descricao: "mariochita1996@gmail.com"),
                 _UserDetailDrawerMenu(funcao: "Função" , descricao: "Administrador")

             ],
          ),
      );
  }

  Widget _menusListaDrawer(){
    return ListView.builder(
        itemCount: listaMenusSettings.length,
        itemBuilder: (_ , index){
          return  InkWell(
             onTap: (){
                   widget.drawerUserMenu.currentState!.closeDrawer();
                   changePageMenu(listaMenusSettings[index].typePage);
             },
             child: ListTile(
              contentPadding: const EdgeInsets.only(
                  bottom: 8,
                  left: 10
              ),
              title:Text(listaMenusSettings[index].titulo),
              subtitle: Text(listaMenusSettings[index].descricao,
                style: const TextStyle(
                    fontSize: 11
                ),),
            ),
          );
        });
  }

  void changePageMenu(TypePage typePage) {
     switch(typePage) {

       case TypePage.HOME:
         _paginationPositionNotifier.setPaginationPositionMenu(PaginationPositionMenuHome());
       break;

       case  TypePage.FUNC:
         _paginationPositionNotifier.setPaginationPositionMenu(PaginationPositionMenuFuncionario());
       break;

       case TypePage.RELA:
         _paginationPositionNotifier.setPaginationPositionMenu(PaginationPositionsMenuRelatorios());
       break;

       case TypePage.PROD:
         _paginationPositionNotifier.setPaginationPositionMenu(PaginationPositionMenuProductos());
       break;

       case TypePage.STOC:
         _paginationPositionNotifier.setPaginationPositionMenu(PaginationPositionMenuStocks());
       break;

       case TypePage.VEND:
         _paginationPositionNotifier.setPaginationPositionMenu(PaginationPositionMenuVenda());
       break;

       default:
          print("Saindo do app ");
       break;

     }
  }

  Widget _UserDetailDrawerMenu({required String funcao , required String descricao}) {
        return Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text("${funcao} : ",style: TextStyle(
             color:Colors.black,
             fontSize:13,
             fontWeight: FontWeight.bold
         ),) ,
         Text(descricao,style: TextStyle(
             fontSize: 13
         ),) ,
       ],
     );
  }
}
