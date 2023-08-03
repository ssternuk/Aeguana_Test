import 'package:aeguana/core/blocs/meal_bloc.dart';
import 'package:aeguana/services/data_service.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  final getItInstance = GetIt.instance;

  Future<void> registerSingletons() async {
    getItInstance.registerLazySingleton(() => MealBloc());
    getItInstance.registerLazySingleton(() => DataService());
  }
}
