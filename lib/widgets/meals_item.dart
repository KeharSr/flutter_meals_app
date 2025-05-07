import 'package:flutter/material.dart';
import 'package:meals_app/model/meals_model.dart';
import 'package:meals_app/screens/meals_detail_screen.dart';
import 'package:meals_app/widgets/text_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meal});

  final MealModel meal;
 

  String get newAffordability =>
      meal.affordability.name[0].toUpperCase() +
      meal.affordability.name.substring(1);

  String get newComplexity =>
      meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);

  void onSelectMealItem(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (BuildContext ctx) =>
                MealsDetailScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () {
          onSelectMealItem(context);
        },
        child: Stack(
          children: <Widget>[
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              bottom: 0,

              right: 0,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                color: Colors.black54,
                child: Column(
                  children: <Widget>[
                    Text(
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      meal.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        TextWidget(
                          icon: Icons.schedule_rounded,
                          label: '${meal.duration.toString()} Minutes',
                        ),
                        const SizedBox(width: 15),
                        TextWidget(icon: Icons.wallet, label: newAffordability),
                        const SizedBox(width: 15),
                        TextWidget(icon: Icons.cabin, label: newComplexity),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
