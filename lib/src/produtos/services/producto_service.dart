import 'package:school_system/src/produtos/blocs/producto_state.dart';
import 'package:school_system/src/produtos/repositories/producto_repositories.dart';
import '../../core/exception/database_exception.dart';
import '../models/producto.dart';

abstract class IProductoService {
  Future<ProductoState> listar();
}


class ProductoService  implements IProductoService {

  final ProductoRepositories  productoRepositories;
  ProductoService({required this.productoRepositories});

  @override
  Future<ProductoState> listar() async {
    final  response = await  this.productoRepositories.listar();
    return  response.fold(
            (l){

              if (l is  DatabaseQueryException) {
                   DatabaseQueryException  _query  = DatabaseQueryException(message: l.message);
                   ProductoState  _productoState = ProductoStateDataBaseException(databaseException: _query, message: l.message);
                   return _productoState;
              }

              if (l is DatabaseTableException) {
                  DatabaseTableException  _query  = DatabaseTableException(message: l.message);
                  ProductoStateDataBaseException  _productoState = ProductoStateDataBaseException(databaseException: _query, message: l.message);
                  return _productoState;
              }

              if (l is DatabaseColumnException) {
                  DatabaseColumnException  _query  = DatabaseColumnException(message: l.message);
                  ProductoStateDataBaseException  _productoState = ProductoStateDataBaseException(databaseException: _query, message: l.message);
                  return _productoState;
              }

              DatabaseErrorException  _query  = DatabaseErrorException(message: l.message);
              ProductoStateDataBaseException  _productoState = ProductoStateDataBaseException(databaseException: _query, message: l.message);
              return _productoState;
            },
            (r)=> ProductoStateSucessList(message: "sucesso", lista: List.from(r.map((e) => Producto.fromJson(e))))
       );

  }
}