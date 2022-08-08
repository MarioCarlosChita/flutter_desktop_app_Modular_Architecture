import 'package:flutter/material.dart';
import 'package:school_system/src/autenticacao/pages/autenticacao_page/widgets/autenticacao_widget_form.dart';


class AutenticacaoPage extends StatefulWidget {
  const AutenticacaoPage({Key? key}) : super(key: key);
  @override
  State<AutenticacaoPage> createState() => _AutenticacaoPageState();
}

class _AutenticacaoPageState extends State<AutenticacaoPage> {

  @override
  Widget build(BuildContext context) {
      return   Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: const [
                     AutenticacaoWidgetForm(),
                  ],
              ),
          ),
      );
  }
}
