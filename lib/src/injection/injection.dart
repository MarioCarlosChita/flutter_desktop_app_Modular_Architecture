import 'package:get_it/get_it.dart';
import 'package:one_context/one_context.dart';
import 'package:school_system/src/produtos/blocs/producto_bloc.dart';
import 'package:school_system/src/produtos/services/producto_service.dart';
import '../core/service/dialog_service.dart';
import '../database/connection/database_connection.dart';
import '../produtos/repositories/producto_repositories.dart';


final locator = GetIt.instance;

void configureDependencies() {

    // classes  and services
    locator.registerLazySingleton<MySqlConnectionDatabase>(() => MySqlConnectionDatabase());
    locator.registerLazySingleton<ProductoRepositories>(()    => ProductoRepositories(database:locator.get<MySqlConnectionDatabase>()));
    locator.registerLazySingleton<DialogService>(()           => DialogService(oneContext: locator.get<OneContext>()));
    locator.registerLazySingleton<ProductoService>(()         => ProductoService(productoRepositories: locator.get<ProductoRepositories>()));
    locator.registerLazySingleton<ProductoBloc>(()            => ProductoBloc(productoService: locator.get<ProductoService>()));

    // futter libraries
    locator.registerLazySingleton<OneContext>(()              =>  OneContext());

}