class QueryTemplateHelper{
   List<String> columns;
   List<String> tables;
   List<String> whereColumns;
   bool hasManyTables         = false;
   bool hasManyColumns        = false;
   bool hasWhereColumns       = false;
   String hasManyTablesQuery  = "";
   String hasManyColumsNames  = "";
   String hasManyWhereColumnsQuery = "";

   QueryTemplateHelper({
     this.columns           = const [],
     this.tables            = const [],
     this.whereColumns      = const [],
   });


   String queryTemplates() {
     String  queryTemplate  ="SELECT";

     hasManyTables  = tables.length > 1;
     hasManyColumns = columns.isNotEmpty;
     hasWhereColumns = whereColumns.isNotEmpty;
     hasManyTablesQuery =tables[0];

     // when there are many columns

     if(!hasManyColumns) {
        hasManyColumsNames =" * ";
     } else {
        for (int  i = 0;  i<columns.length ; ++i) {
           if (i == columns.length -1) {
             hasManyColumsNames+=" ${columns[i]}";
           } else {
             hasManyColumsNames+=" ${columns[i]},";
           }
        }
     }

     //  when there are many tables
     if (hasManyTables) {
        for(int i =1 ; i<tables.length ; ++i){
           if(i != tables.length -1){
             hasManyTablesQuery+=tables[i];
           } else {
             hasManyTablesQuery+=",${tables[i]}";
           }
        }
     }

     //  when there are many condictions
     if (hasWhereColumns){
        hasManyWhereColumnsQuery +=" WHERE ";
        for (int i = 0; i< whereColumns.length ;++i){
          if(i == whereColumns.length -1){
            hasManyWhereColumnsQuery +=whereColumns[i];
          } else {
            hasManyWhereColumnsQuery +="${whereColumns[i]} AND ";
          }
        }
     }

     // join all the  queries
     queryTemplate += "$hasManyColumsNames FROM $hasManyTablesQuery $hasManyWhereColumnsQuery";
     return queryTemplate;
   }

   String insertTemplates() {
     String  queryTemplate  ="INSERT INTO ${tables[0]} (";
     for(int i = 0;  i<columns.length  ;++i){
        if(i  == columns.length -1){
           queryTemplate += columns[i] ;
        } else {
          queryTemplate += "${columns[i]},";
        }
     }
     queryTemplate +=") VALUES (";

     for(int i = 0;  i<columns.length  ;++i){
       if(i  == columns.length -1){
         queryTemplate += "?" ;
       } else {
         queryTemplate += "?,";
       }
     }

     queryTemplate += " )";

     return queryTemplate;
   }

//    String updateTemplates() {
//      String  queryTemplate  ="INSERT INTO ${tables[0]} (";
//
//      hasManyColumns  = this.columns.length  > 1 ;
//
//      if(hasManyColumns) {
//         for (int  i = 0;   i<columns.length  ; ++i) {
//             if(i ==  columns.length -1) {
//
//             } else {
//
//             }
//         }
//     }
//
// }
}