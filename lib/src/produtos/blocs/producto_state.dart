import 'package:school_system/src/core/exception/database_exception.dart';
import '../models/producto.dart';

abstract class ProductoState {}

class  ProductoStateLoading extends  ProductoState {
    final String message;
    ProductoStateLoading({required this.message});
}

class ProductoStateDataBaseException extends  ProductoState {
  final String message;
  final DatabaseException databaseException;

  ProductoStateDataBaseException({
      required this.databaseException,
      required this.message
  });


}

class ProductoStateSucessList  extends ProductoState {
  final String  message;
  final List<Producto> lista;
  ProductoStateSucessList({
    required this.message,
    required this.lista
  });
}