import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meals_app/core/errors/failures.dart';
import 'package:meals_app/data/api_service.dart';
import 'package:meals_app/domain/meals_repository.dart';
import 'package:meals_app/domain/model/category_response/category_data.dart';
import 'package:meals_app/domain/model/category_response/category_response.dart';
import 'package:meals_app/domain/model/meal_details_response/meal_item.dart';
import 'package:meals_app/domain/model/meals_response/meal.dart';

class MealsRepositoryImbl extends MealsRepository {
  final ApiService apiService;

  MealsRepositoryImbl({required this.apiService});

  @override
  Future<Either<Failure, List<CategoryData>>> fetchMealCategories() async {
    try {
      var data =
          await apiService.getData(endPoint: 'categories.php', query: {});
      List<CategoryData> categories = [];
      for (var category in data['categories']) {
        categories.add(CategoryData.fromJson(category));
      }

      return right(categories);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> fetchSelectedCategoryMeals(
      String category) async {
    try {
      var data = await apiService
          .getData(endPoint: 'filter.php', query: {'c': category});
      List<Meal> mealsList = [];
      for (var meal in data['meals']) {
        mealsList.add(Meal.fromJson(meal));
      }
      return right(mealsList);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MealItem>> fetchMealDetails(String mealID) async {
    try {
      var data = await apiService
          .getData(endPoint: 'lookup.php', query: {'i': mealID});
      return right(data['meals']);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
