import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:one_context/one_context.dart';
import 'package:school_system/src/core/enums/type_yes_no.dart';
import 'package:school_system/src/core/service/dialog_service.dart';
import 'package:school_system/src/home/pages/admin/home_admin_page/home_admin_page.dart';
import 'package:school_system/src/injection/injection.dart';
import 'package:school_system/src/produtos/repositories/producto_repositories.dart';
import '../../../../core/navigation/navigation_page.dart';

class AutenticacaoWidgetForm extends StatefulWidget {
  const AutenticacaoWidgetForm({Key? key}) : super(key: key);

  @override
  State<AutenticacaoWidgetForm> createState() => _AutenticacaoWidgetFormState();
}

class _AutenticacaoWidgetFormState extends State<AutenticacaoWidgetForm> {

  TextEditingController _usuario =  new TextEditingController();
  TextEditingController _senha   =  new TextEditingController();
  bool _exibirSenha = true;
  GlobalKey<FormState>  _formularioAutenticacao = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Container(
         width: 520,
         child:Container(
            child: Form(
              key: _formularioAutenticacao,
              child: Column(
                children: [
                  Logo(),
                  const SizedBox(height:30,),
                  TextFormField(
                    controller: _usuario,
                    decoration: InputDecoration(
                        hintText: "Usuario",
                        suffixIcon: Icon(LineIcons.user , color:Colors.grey.withOpacity(0.4),),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                                color: Colors.white12
                            )
                        ),
                       focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                            color: Colors.green
                        )
                    )
                    ),
                  ) ,
                  const SizedBox(height: 60,),
                  TextFormField(
                    controller: _senha,
                    obscureText: _exibirSenha,
                    decoration: InputDecoration(
                      hintText: "Senha",
                      suffixIcon: IconButton(
                            onPressed: (){
                               setState(() {
                                    _exibirSenha = !_exibirSenha;
                               });
                            },
                            icon: Icon(LineIcons.eyeSlash,
                            color:Colors.grey.withOpacity(0.4),)
                       ),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                                color: Colors.white12
                            )
                        ),
                        focusedBorder:const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                                color: Colors.green
                            )
                        )
                    ),
                  ),
                  const SizedBox(height: 60,),
                  MaterialButton(
                    onPressed: ()=> _autenticacao(),
                    minWidth: 400,
                    child:Text("Entrar" , style: TextStyle(
                        color: Colors.white
                    ),),
                    height: 60,
                    color: Colors.green,
                  )
                ],
              ),
            ),
         ),
      ),
    );
  }

  Widget Logo() {
    return Center(
        child: Column(
           children: const [
             Text(
               "Farmácia",
                style:TextStyle(
                   color: Colors.black ,
                   fontWeight: FontWeight.bold ,
                   fontSize: 40
                ) ,) ,
             Text(
               "Sistema de gestão Farmaceutica",
               style: TextStyle(
                   color: Colors.black ,
                   fontSize: 13
               ),
             )
           ],
        ),
    );
  }

  Future<void> _autenticacao() async {
   NavigationNextPageWithBack(context , Pagina: HomeAdminPage());
  }

}
