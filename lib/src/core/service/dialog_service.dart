
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:one_context/one_context.dart';
import 'package:school_system/src/core/enums/type_yes_no.dart';
import 'package:school_system/src/injection/injection.dart';

class DialogService{
  final OneContext  oneContext;
  TypeYesNO typeYesNo = TypeYesNO.No;
  DialogService({required this.oneContext});

  Future<void> closeShowDialogCircularProgress() async{
      locator.get<OneContext>().hideProgressIndicator();
      return ;
  }

  Future<void> showDialogCircularProgress()  async {
    locator.get<OneContext>().showProgressIndicator();
    return ;
  }
  
  Future<TypeYesNO> showComfirmButton({String message =""}) async {

      final showDialog = oneContext.showDialog(builder: (context){
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:  MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  message.trim().isEmpty ?"Alerta":message
                  ,style: const TextStyle(
                fontSize: 18,
              )),
              const Icon(
                  Icons.info_outline
                  ,color: Colors.orange
                  ,size: 120) ,

              const SizedBox(height:20),

              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        onPressed: (){
                            Navigator.pop(context , TypeYesNO.Yes);
                        }
                        ,minWidth:80
                        ,height:40
                        ,shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    )
                        ,color: Colors.greenAccent
                        ,child:const Text("Sim", style: TextStyle(
                        color:Colors.black,
                        fontSize:18
                    ),)) ,

                    MaterialButton(
                        onPressed: (){
                          Navigator.pop(context , TypeYesNO.No);
                        }
                        ,minWidth:80
                        ,height:40
                        ,shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    )
                        ,color: Colors.red
                        ,child:const Text("Não", style: TextStyle(
                        color:Colors.black,
                        fontSize:18
                    ),))

                  ],
                ),
              )
            ],
          ),
        );
      });

      typeYesNo = await showDialog.then((value) => value);
      return typeYesNo;
  }

  Future<void>  showSucessMessage() async {
      final showDialog = oneContext.showDialog(builder: (context)=>AlertDialog(
          title: const  Center(child: Text("Sucesso"),),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                     LineIcons.checkCircle
                    ,color: Colors.green
                    ,size: 120
                ),
                const SizedBox(height:30,),
                MaterialButton(
                    onPressed: ()=> Navigator.of(context).pop()
                   ,minWidth: 300
                   ,height:60
                   ,color: Colors.greenAccent
                   ,child:const Text("Ok", style: TextStyle(
                     color:Colors.black,
                     fontSize:18
                ),))
              ],
          ),
      ));

      return ;
  }


  Future<void>  showWarningMessage({String  message =""}) async {
    final  dialogService = oneContext.showDialog(builder: (context) =>AlertDialog(
        title: Center(child :Text(message)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
               Text(
                  message.trim().isEmpty ?"Alerta":message
                 ,style: const TextStyle(
                    fontSize: 18,
                 )),
               const Icon(
                  Icons.warning_amber_outlined
                 ,color: Colors.orange
                 ,size: 120) ,

               const SizedBox(height:20),
               MaterialButton(
                    onPressed: ()=> Navigator.of(context).pop()
                   ,minWidth: 300
                   ,height:60
                   ,color:Colors.orangeAccent.withOpacity(0.7)
                   ,child:const Text("Ok", style: TextStyle(
                     color:Colors.black,
                   fontSize:18
                ),))
          ],
        ),
    ));
    return ;
  }
}