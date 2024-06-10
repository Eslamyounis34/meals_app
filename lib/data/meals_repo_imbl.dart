import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meals_app/core/errors/failures.dart';
import 'package:meals_app/data/api_service.dart';
import 'package:meals_app/domain/meals_repository.dart';
import 'package:meals_app/domain/model/category_response/category.dart';
import 'package:meals_app/domain/model/category_response/category_response.dart';

class MealsRepositoryImbl extends MealsRepository {
  final ApiService apiService;

  MealsRepositoryImbl({required this.apiService});

  @override
  Future<Either<Failure, List<Category>>> fetchMealCategories() async {
    try {
      var data = await apiService.getData('categories.php');
      List<Category> categories = [];
      for (var category in data['categories']) {
        categories.add(Category.fromJson(category));
      }

      return right(categories);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
