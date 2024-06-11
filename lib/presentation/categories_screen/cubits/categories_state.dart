import 'package:equatable/equatable.dart';
import 'package:meals_app/domain/model/category_response/category_data.dart';

abstract class CategoriesScreenState extends Equatable {
  const CategoriesScreenState();

  @override
  List<Object> get props => [];
}

class CategoriesScreenInitial extends CategoriesScreenState {}

class CategoriesScreenLoading extends CategoriesScreenState {}

class CategoriesScreenError extends CategoriesScreenState {
  final String errMsg;

  const CategoriesScreenError(this.errMsg);
}

class CategoriesScreenSuccess extends CategoriesScreenState {
  final List<CategoryData> categories;

  const CategoriesScreenSuccess(this.categories);
}
