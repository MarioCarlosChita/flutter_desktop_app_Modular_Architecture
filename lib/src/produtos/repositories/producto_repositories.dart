import 'package:dartz/dartz.dart';
import 'package:mysql1/mysql1.dart';

import '../../core/exception/database_exception.dart';
import '../../database/connection/database_connection.dart';

class  ProductoRepositories{
  MySqlConnectionDatabase   database ;
  ProductoRepositories({required this.database});


  Future<Either<DatabaseException , Results>>  listar() async {
    List<String> tables  = ['producto p',];
    List<String> columns = [];
    List<String> whereColumns =["id=1","NOME = 'PARACETAMOL'"];
    return  await database.list( tables:tables,columns: columns , whereColums: whereColumns);
  }

}