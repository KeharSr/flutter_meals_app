import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meals_model.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterStateNotifier extends StateNotifier<Map<Filter, bool>>{
  FilterStateNotifier():super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });

  void filter(Filter filter, bool isFilter){
    state={
      ...state, filter:isFilter
    };

  }


void setFilters(Map<Filter, bool> activeFilters) {
  state = activeFilters;
}
}

final filtersProvider=StateNotifierProvider<FilterStateNotifier, Map<Filter, bool>>(( Ref ref){
  return FilterStateNotifier();
});



final filterMealsProvider=Provider((ref){

  final meals=ref.watch(mealsProvider);
  final activeFilters=ref.watch(filtersProvider);


  return meals.where((MealModel meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }

    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }

    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }

    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});