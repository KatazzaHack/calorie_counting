import 'database_helper.dart';
import 'norms_helper.dart';
import '../gen/calorie_counting.pb.dart';



NutritionState getStateForDay(DateTime dateTime) {
  if (dateTime.day == DateTime.now().day) {
    return NutritionState(10, 20, 30.76, 100.004, 1000.3);
  } else {
    return NutritionState(10.012, 20, 30, 100, 1300.345);
  }
}

Future<NutritionState> getNormsForDay(DateTime dateTime) async {
  NormsHelper normsHelper = NormsHelper();
  Norms norms =  await normsHelper.getNorm("defaultUser");
  return Future.value(
      NutritionState(
          norms.proteins,
          norms.fats,
          norms.carbonates,
          norms.water,
          norms.calories));
}


class NutritionState  {
  final double proteins;
  final double fats;
  final double carbonates;
  final double water;
  final double calories;

  NutritionState(
      this.proteins,
      this.fats,
      this.carbonates,
      this.water,
      this.calories);
}