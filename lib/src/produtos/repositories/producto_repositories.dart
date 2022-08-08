import 'package:dartz/dartz.dart';
import 'package:mysql1/mysql1.dart';
import '../../core/exception/database_exception.dart';
import '../../database/connection/database_connection.dart';

abstract class IProductoRepsitories {
    Future<Either<DatabaseException , Results>> listar();
}

class  ProductoRepositories  implements IProductoRepsitories {
  MySqlConnectionDatabase   database ;
  ProductoRepositories({required this.database});

  Future<Either<DatabaseException , Results>>  listar() async {
    List<String> tables  = ['producto p',];
    return  await database.list( tables:tables);
  }
}