import 'package:flutter/material.dart';
import 'package:school_system/src/core/models/pagination_position_menu.dart';
import '../../../../core/change_notifier/pagination_position_notifier.dart';
import 'home_bottom_menu_perfi;.dart';


class HomeLeftMenu extends StatefulWidget {
  GlobalKey<ScaffoldState>  drawerUserMenu;

  HomeLeftMenu({required this.drawerUserMenu});
  @override
  State<HomeLeftMenu> createState() => _HomeTopMenuState();
}

class _HomeTopMenuState extends State<HomeLeftMenu> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
       child: Column(
           crossAxisAlignment:CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             LogoFarmacia()
           ],
       ),
    );
  }

  Widget LogoFarmacia() {
      return Container(
           width: 80,
           margin: EdgeInsets.zero,
           height: MediaQuery.of(context).size.height,
           child: Card(
             elevation: 1,
             child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:  [
                   InkWell(
                     onTap: (){
                        widget.drawerUserMenu.currentState!.openDrawer();
                        // Chamando outro Menu
                     },
                     child:  const Padding(
                       padding: EdgeInsets.only(top: 20),
                       child:  Icon(
                         Icons.menu,
                         size: 25,
                         color: Colors.black,
                       ),
                     ),
                   ),
                   HomeBottomMenuPerfil()
                 ],
             ),
           ),
      );
  }

}
