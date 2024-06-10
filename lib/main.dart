import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/core/utils/app_routing.dart';
import 'package:meals_app/core/utils/constants.dart';
import 'package:meals_app/core/utils/service_locator.dart';
import 'package:meals_app/data/meals_repo_imbl.dart';
import 'package:meals_app/presentation/categories_screen/cubits/categories_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                CategoriesCubit(getIt.get<MealsRepositoryImbl>())
                  ..getCategoriesItems()),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
            appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor)),
        routerConfig: AppRouting.router,
      ),
    );
  }
}
