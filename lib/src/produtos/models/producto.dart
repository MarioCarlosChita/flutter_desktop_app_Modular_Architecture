import 'package:mysql1/mysql1.dart';
import 'package:school_system/src/core/models/api_column_table.dart';

class Producto{
   final String nome;
   final String fabricante;
   final double preco ;
   final String estado;
   final DateTime validade;
   final String codigoBarra;
   final String pathImage;
   final DateTime created_at;
   final DateTime updated_at;

   Producto({
      required this.nome
     ,required this.fabricante
     ,required this.preco
     ,required this.codigoBarra
     ,required this.estado
     ,required this.pathImage
     ,required this.validade
     ,required this.created_at
     ,required this.updated_at
   });

   factory Producto.fromJson(ResultRow maps){
      return Producto(
          nome: maps['NOME'],
          fabricante:maps['FABRICANTE'],
          preco: maps['PRECO'],
          codigoBarra: maps['CODIGO_BARRA'],
          estado: maps['ESTADO'],
          pathImage: "",
          validade: maps['VALIDADE'],
          created_at: maps['CREATED_AT'],
          updated_at: DateTime.now()
      );
   }

   Map<String, dynamic> toMap() =>{
       'NOME':nome,
       'FABRICANTE':fabricante,
       'PRECO':preco,
       'CODIGO_BARRA':codigoBarra,
       'ESTADO':estado,
       'PATH_IMAGE':pathImage,
       'VALIDADE':validade
   };


   ApiColumnTable toList(Map<String , dynamic> maps){
     ApiColumnTable  apiColumnTable =  ApiColumnTable(columns: [], values: []);
     maps.forEach((key, value) {
       if (key.isNotEmpty){
           apiColumnTable.columns.add(key);
           apiColumnTable.values.add(value);
       }
     });
     return apiColumnTable;
   }

}