import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:school_system/src/core/styles/styles_menu_card.dart';

class   MenuCardDasboard {

  String titulo;
  String descricao;
  bool  estado =  true;
  IconData iconData;
  Color  color;
  int quantidade;
  List<String> lista_de_acessos = [];

  MenuCardDasboard({
     required this.titulo
    ,required this.descricao
    ,required this.iconData
    ,required this.quantidade
    ,required this.color
  });

}

List<MenuCardDasboard> listaMenuCardDashBoard = [
      MenuCardDasboard(
           titulo: "Funcionarios"
          ,descricao: "Quantidade de Funcionarios Cadastrados"
          ,iconData:Icons.person
          ,quantidade: 120
          ,color:itemThemeCardPrimary
      ) ,
     MenuCardDasboard(
       titulo: "Vendas"
      ,descricao: "Quantidade  de Vendas por produtos"
      ,iconData:Icons.sell
      ,quantidade: 120
      ,color:itemThemeCardSecond
    ),

  MenuCardDasboard(
      titulo: "Produtos"
      ,descricao: "Quantidade  de produtos cadastrados"
      ,iconData: Icons.shopping_bag_rounded
      ,quantidade: 120
      ,color:itemThemeCardThird
  ),
  MenuCardDasboard(
      titulo: "Stocks"
      ,descricao: "Quantidade  de produtos cadastrados nos stocks"
      ,iconData: Icons.add_shopping_cart_outlined
      ,quantidade: 120
      ,color:itemThemeCardForth
  ),

];


