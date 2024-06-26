import 'package:equatable/equatable.dart';

import 'category_data.dart';

class CategoryResponse extends Equatable {
  final List<CategoryData>? categories;

  const CategoryResponse({this.categories});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'categories': categories?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [categories];
}
