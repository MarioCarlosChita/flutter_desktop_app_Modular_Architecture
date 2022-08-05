import 'package:dartz/dartz.dart';
import 'package:mysql1/mysql1.dart';

import '../../core/exception/database_exception.dart';
import '../../core/helper/query_template_helper.dart';

abstract class Database{
   final String host = "127.0.0.1";
   final int port = 3306;
   final String user = "root";
   final String password = " ";
   final String dbname = "farmacia";
}


class MySqlConnectionDatabase  extends   Database {

   Future<Either<DatabaseException,Results>>   list({ required List<String> tables,List<String> columns = const [], List<String> whereColums = const []}) async {
      try{
         final QueryTemplateHelper  queryTemplateHelper = QueryTemplateHelper(columns: columns ,tables: tables ,whereColumns: whereColums);
         String queryTemplate =  queryTemplateHelper.queryTemplates();

         print("Query template");
         print(queryTemplate);


         final connection =  await _getConnection();
         Results  results =  await connection.query(queryTemplate);

         // close database
         _closeConnection(connection: connection);
         return   right(results);

      }  catch (message) {
         final  databaseErrorException = _errorSqlExecutation(message.toString());
         throw left(databaseErrorException);
      }
   }


   ConnectionSettings  _connectionSetting() {
      var settings = ConnectionSettings(
          host: host,
          port: port,
          user: user,
          db: dbname
      );
      return  settings;
   }

   Future<MySqlConnection>   _getConnection() async  {
      final  connection = await   MySqlConnection.connect(_connectionSetting());
      return connection;
   }

   Future<void>   _closeConnection({required   MySqlConnection  connection}) async {
      await connection.close();
      return;
   }


   DatabaseException  _errorSqlExecutation(String message) {
       if (message.contains("1146")) {
          return  DatabaseTableException(message: "a tabela não existe");
       }

       if(message.contains("1054")) {
           return DatabaseColumnException(message: "a columa nao existe");
       }

       if(message.contains("1064")) {
          return  DatabaseQueryException(message: "error de sintaxe da queries");
       }

       return DatabaseErrorException(message: "error de conexao com  banco de dados");
   }



}