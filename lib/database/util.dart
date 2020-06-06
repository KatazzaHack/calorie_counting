import 'database_helper.dart';
import 'norms_helper.dart';
import '../gen/calorie_counting.pb.dart';



Future<NutritionState> getStateForDay(DateTime dateTime) async {
  if (dateTime.day == DateTime.now().day) {
    return Future.value(NutritionState(10, 20, 30.76, 100.004, 1000.3));
  } else {
    return Future.value(NutritionState(10.012, 20, 30, 100, 1300.345));
  }
}

Future<List<NutritionState>> getStateForDaySpan(DateTime dateTime, int amount) async {
  return Future.value(new List<NutritionState>());
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