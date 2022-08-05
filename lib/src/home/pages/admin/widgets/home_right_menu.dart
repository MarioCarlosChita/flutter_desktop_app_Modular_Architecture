import 'package:flutter/material.dart';
import 'package:school_system/src/home/pages/admin/widgets/home_top_menu.dart';
import 'package:school_system/src/produtos/pages/home_producto/home_producto.dart';
import '../../../../core/change_notifier/pagination_position_notifier.dart';
import '../../../../core/models/pagination_position_menu.dart';
import 'home_button_menu.dart';


class HomeRightMenu extends StatefulWidget {
  const HomeRightMenu({Key? key}) : super(key: key);
  @override
  State<HomeRightMenu> createState() => _HomeRightMenuState();
}

class _HomeRightMenuState extends State<HomeRightMenu> {
  final PaginationPositionNotifier  _paginationPositionNotifier  =  PaginationPositionNotifier.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
         child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                HomeTopMenu(),
                AnimatedBuilder(
                    animation: _paginationPositionNotifier,
                    builder: (_ , child) {
                        return PaginationDashBoardItem(_paginationPositionNotifier.pagePosistionMenu);
                    }
                )
            ],
         ),
    );
  }

  Widget PaginationDashBoardItem(PaginationPositionMenu item) {
      if  (item  is PaginationPositionMenuHome) {
        return HomeButtonMenu();
      }
      if(item  is PaginationPositionMenuProductos) {
        return HomeProductoPage();
      } else{
        return Container();
      }
  }
}
