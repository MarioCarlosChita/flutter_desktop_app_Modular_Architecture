import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_system/src/produtos/blocs/producto_event.dart';
import 'package:school_system/src/produtos/blocs/producto_state.dart';
import 'package:school_system/src/produtos/services/producto_service.dart';

class ProductoBloc  extends Bloc<ProductoEvent , ProductoState>{
    final ProductoService  productoService;

    ProductoBloc({required this.productoService}):super(ProductoStateLoading(message: "carregando os productos")) {
        on<ProductoEventLoadList>(onProductoLoadList);
    }

    onProductoLoadList(Event ,Emitter emitter) async{
      return await productoService.listar();
    }
}