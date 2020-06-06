import 'database_helper.dart';
import 'norms_helper.dart';
import '../gen/calorie_counting.pb.dart';



NutritionState getStateForDay(DateTime dateTime) {
  if (dateTime.day == DateTime.now().day) {
    return NutritionState(10, 20, 30, 100, 1000);
  } else {
    return NutritionState(10, 20, 30, 100, 1300);
  }
}

Future<NutritionState> getNormsForDay(DateTime dateTime) async {
  NormsHelper normsHelper = NormsHelper();
  Norms x =  await normsHelper.getNorm("defaultUser");
  return Future.value(NutritionState(20, 20, 50, 1000, x.calories.round()));
}


class NutritionState  {
  final int proteins;
  final int fats;
  final int carbonates;
  final int water;
  final int calories;

  NutritionState(
      this.proteins,
      this.fats,
      this.carbonates,
      this.water,
      this.calories);
}