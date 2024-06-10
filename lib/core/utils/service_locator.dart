import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meals_app/data/api_service.dart';
import 'package:meals_app/data/meals_repo_imbl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // we created a singelton for homeRepoImpl , ApiService to avoid make many instances
  //like that in main.lib :
  //  providers: [
  //     BlocProvider(
  //       create: (context) => FeaturedBooksCubit(
  //         HomeRepoImpl(
  //           ApiService(
  //             Dio(),
  //           ),
  //         ),
  //       ),
  //     ),
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<MealsRepositoryImbl>(
    MealsRepositoryImbl(apiService: getIt.get<ApiService>()),
  );
}
