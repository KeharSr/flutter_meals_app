import 'package:flutter_riverpod/flutter_riverpod.dart';

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