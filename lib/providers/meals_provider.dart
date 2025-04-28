import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/model/meals_model.dart';

final Provider<List<MealModel>> mealsProvider = Provider((Ref<Object?> ref) {
  return dummyMeals;
});
