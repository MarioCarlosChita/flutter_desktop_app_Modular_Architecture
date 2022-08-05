import 'package:flutter/material.dart';
import 'package:school_system/src/home/pages/admin/widgets/home_right_menu.dart';
import '../widgets/home_drawer_menu.dart';
import '../widgets/home_left_menu.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({Key? key}) : super(key: key);
  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  GlobalKey<ScaffoldState> _drawerUserMenu = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       key: _drawerUserMenu,
       backgroundColor: Colors.white,
       drawer: HomeDrawerMenu(drawerUserMenu: _drawerUserMenu),
       body: Center(
           child:Row(
               children: [
                 HomeLeftMenu(drawerUserMenu: _drawerUserMenu,),
                 HomeRightMenu()
               ],
           ),
       ),
    );
  }
}

