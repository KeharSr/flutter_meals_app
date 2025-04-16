import 'package:flutter/material.dart';
import 'package:meals_app/model/meals_model.dart';
import 'package:meals_app/widgets/meals_item.dart';
import 'package:transparent_image/transparent_image.dart';

class IndividualMealDetails extends StatelessWidget {
  const IndividualMealDetails({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: FadeInImage(
        placeholder: MemoryImage(kTransparentImage),
        image: NetworkImage(meal.imageUrl),
      ),
    );
  }
}
