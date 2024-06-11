import 'package:dartz/dartz.dart';
import 'package:meals_app/core/errors/failures.dart';
import 'package:meals_app/domain/model/category_response/category_data.dart';
import 'package:meals_app/domain/model/category_response/category_response.dart';

abstract class MealsRepository {
  Future<Either<Failure, List<CategoryData>>> fetchMealCategories();
}
