import 'package:flutter/material.dart';
import 'package:school_system/src/injection/injection.dart';
import 'package:school_system/src/produtos/blocs/producto_bloc.dart';
import 'package:school_system/src/produtos/blocs/producto_event.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({Key? key}) : super(key: key);

  @override
  State<HomeListPage> createState() => _HomeListPageState();
}

class _HomeListPageState extends State<HomeListPage> {
  final productoBloc = locator.get<ProductoBloc>();

  @override
  void initState() {
    initAllBlocs();
    super.initState();
  }

  void initAllBlocs() {
    productoBloc.add(ProductoEventLoadList());
  }
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
