import 'package:flutter/material.dart';

void NavigationNextPageWithBack(BuildContext context ,{required  Pagina}){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Pagina));
}

void NavigatioNextPageWithOutBack(BuildContext context,{required Pagina}) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => Pagina), (route) => false)  ;
}
