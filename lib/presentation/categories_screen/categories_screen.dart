import 'package:flutter/material.dart';
import 'package:meals_app/core/utils/styles.dart';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals_app/presentation/categories_screen/categories_screen_body.dart';
import 'package:meals_app/presentation/categories_screen/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CategoriesBody());
  }
}
