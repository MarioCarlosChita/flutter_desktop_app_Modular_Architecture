import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomeFormPage extends StatefulWidget {
  const HomeFormPage({Key? key}) : super(key: key);

  @override
  State<HomeFormPage> createState() => _HomeFormPageState();
}

class _HomeFormPageState extends State<HomeFormPage> {
  final GlobalKey<FormState> _formulario  =  new GlobalKey<FormState>();

  final TextEditingController _nome        = TextEditingController();
  final TextEditingController _fabricante  = TextEditingController();
  final TextEditingController _preco       = TextEditingController();
  final TextEditingController _validade    = TextEditingController();
  final TextEditingController _quantidade  = TextEditingController();
  final TextEditingController _codigoBarra = TextEditingController();
  final TextEditingController _descricao   = TextEditingController();
  late  String imagePath;
  int   stepperAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
       width: (MediaQuery.of(context).size.width /2)-100,
       height: 600,
       child: Theme(
           key: GlobalKey(),
           data:ThemeData(
               colorScheme: const ColorScheme.light(
                   primary: Colors.green
               )
           ),
           child: _buildStepper()
       ),
    );
  }

  Widget _buildStepper() {
    return CupertinoStepper(
        type: StepperType.horizontal,
        currentStep: stepperAtual,
        key: GlobalKey(),
        onStepTapped: (step) => setState(() => stepperAtual = step),
        onStepCancel:  stepperAtual > 0 ? () => setState(() => --stepperAtual) : null,
        onStepContinue: stepperAtual <1 ? () => setState(() => ++stepperAtual) : null,

        steps: [
            _formFirstStapperPage(titulo: "Dados do Produto", Subtitulo: "Dados") ,
            _formSeconStapperPage(titulo: "Finalizando", Subtitulo:"Dados gravados para o sistema")
        ],
        controlsBuilder: (BuildContext context, ControlsDetails details){


          return Row(
            children: <Widget>[
               MaterialButton(
                 minWidth: 100,
                 elevation: 0,
                 shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                 ),
                 height:40,
                 color: Colors.green,
                 onPressed:stepperAtual  > 0 ? details.onStepCancel : details.onStepContinue,
                 child: Text(stepperAtual  > 0  ? 'Voltar':'Proximo' ,style: TextStyle(color: Colors.white),),
               )
            ],
          );
        },
    );
  }

  Step _formFirstStapperPage({
     required String titulo
    ,required String Subtitulo
    ,StepState state = StepState.indexed
    ,bool isActive   = false
    }) {
    return Step(
         title: Text(titulo),
         subtitle: Text(Subtitulo),
         state: state,
         isActive: isActive,
         content: LimitedBox(
           maxWidth: 300,
           maxHeight: 300,
           child: Container(
               color: Colors.white,
               child: _formDetail(),
           ),
         ),
    );
  }

  Step _formSeconStapperPage({
    required String titulo
    ,required String Subtitulo
    ,StepState state = StepState.indexed
    ,bool isActive   = false
  }) {
    return Step(
      title: Text(titulo),
      subtitle: Text(Subtitulo),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: 300,
        maxHeight: 300,
        child: Container(
           color: Colors.white
          ,child:_finalizadoDetail(),
        ),
      ),
    );
  }

  Widget _finalizadoDetail() {
    return Container(
      height: 600,
       child:Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width:120,
                  height:120,
                  color: Colors.grey,
                  padding: EdgeInsets.all(1),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child:Icon(Icons.add,color:Colors.black),
                      ),
                      SizedBox(height:2,),
                      Text("Seleciona uma imagem"
                        ,style: TextStyle(
                            color: Colors.black
                            ,fontSize: 9  // child:Icon(Icons. , color: Colors.black,),
                            ,fontWeight:FontWeight.bold
                        ),)
                    ],
                  ),
                ) ,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width:400,
                          child:  TextFormField(
                            controller: _codigoBarra,
                            decoration: InputDecoration(
                                hintText: "Codigo de Barra",
                                suffixIcon: Icon(Icons.sell , color:Colors.grey.withOpacity(0.4),),
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
                        ),
                        const  SizedBox(width:5,),
                        MaterialButton(
                          onPressed:(){}
                          ,minWidth:60
                          ,height:60
                          ,color: Colors.green
                          ,child: Icon(Icons.update ,color: Colors.white,),
                        )

                      ],
                    ),
                    const  SizedBox(height:20,),
                    SizedBox(
                      width:456,
                      height:120,
                      child:  TextFormField(
                        controller: _descricao,
                        minLines: 1,
                        maxLength: 30,
                        maxLines: 30,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            hintText: "Descrição do Produto",
                            suffixIcon: Icon(Icons.text_fields , color:Colors.grey.withOpacity(0.4),),
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
                    ),
                  ],
                )
              ],
            ),
            MaterialButton(
                onPressed: (){}
               ,minWidth: 300
               ,height:60
               ,color: Colors.green
               ,child: const Text("Cadastrar",style: TextStyle(
                  color:Colors.black
            ),),
            )
          ],
       )
    );
  }

  Widget _formDetail() {
     return Form(
         key: _formulario,
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:  MainAxisAlignment.start,
            children: [
              Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 SizedBox(
                   width:300,
                   child:  TextFormField(
                     controller: _nome,
                     decoration: InputDecoration(
                         hintText: "Nome Produto",
                         suffixIcon: Icon(Icons.sell , color:Colors.grey.withOpacity(0.4),),
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
                 ),
                 SizedBox(
                    width: 300,
                   child:   TextFormField(
                     controller: _fabricante,
                     decoration: InputDecoration(
                         hintText: "Fabricante",
                         suffixIcon: Icon(Icons.person , color:Colors.grey.withOpacity(0.4),),
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
                 )
               ],
              ) ,
              SizedBox(height:30,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width:300,
                    child:  TextFormField(
                      controller:_preco,
                      decoration: InputDecoration(
                          hintText: "Preço ",
                          suffixIcon: Icon(Icons.money , color:Colors.grey.withOpacity(0.4),),
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
                  ),
                  SizedBox(
                    width: 300,
                    child:   TextFormField(
                      controller: _validade,
                      decoration: InputDecoration(
                          hintText: "Data de Validade",
                          suffixIcon: Icon(Icons.date_range , color:Colors.grey.withOpacity(0.4),),
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
                  )
                ],
              ),
              SizedBox(height:30,),
              TextFormField(
                controller: _quantidade,
                decoration: InputDecoration(
                    hintText: "Quantidade por unidade",
                    suffixIcon: Icon(Icons.add_chart , color:Colors.grey.withOpacity(0.4),),
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
              )
            ],
         ));
  }
}
