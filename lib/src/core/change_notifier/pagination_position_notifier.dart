import 'package:flutter/material.dart';

import '../models/pagination_position_menu.dart';

class PaginationPositionNotifier extends ChangeNotifier{

     PaginationPositionMenu pagePosistionMenu = PaginationPositionMenuHome();
     PaginationPositionNotifier._privateConstructor();

     static final PaginationPositionNotifier instance = PaginationPositionNotifier._privateConstructor();

     void setPaginationPositionMenu(PaginationPositionMenu item) {
          pagePosistionMenu  = item;
          notifyListeners();
     }
}