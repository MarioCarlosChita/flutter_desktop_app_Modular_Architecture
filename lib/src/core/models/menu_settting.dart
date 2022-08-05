

import '../enums/type_page.dart';

class MenuSetting{
  String titulo;
  String descricao;
  bool   estado =  true;
  TypePage typePage;
  List<String> lista_de_acessos = [];
  MenuSetting({
    required this.titulo,
    required this.descricao ,
    required this.typePage
  });
}


// configuracoes dos menus
List<MenuSetting>  listaMenusSettings = [
  MenuSetting(titulo: "HOME", descricao: "dashboard do sistema",typePage: TypePage.HOME),
  MenuSetting(titulo: "FUNCIONARIOS", descricao: "gestão dos funcionarios",typePage: TypePage.FUNC),
  MenuSetting(titulo: "VENDAS", descricao: "gestão dos  vendas",typePage: TypePage.VEND),
  MenuSetting(titulo: "PRODUCTOS", descricao:"gestão de produtos",typePage: TypePage.PROD),
  MenuSetting(titulo: "STOCKS", descricao: "gestão de estoques" ,typePage:  TypePage.STOC),
  MenuSetting(titulo: "RELATORIOS", descricao: "gestão de relatórios",typePage: TypePage.RELA),
  MenuSetting(titulo: "SAIR", descricao: "fazer logout do sistema",typePage: TypePage.SAIR),
];