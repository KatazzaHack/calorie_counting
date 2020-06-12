import 'database_helper.dart';
import 'norms_helper.dart';
import '../gen/calorie_counting.pb.dart';



Future<NutritionState> getStateForDay(DateTime dateTime) async {
  if (dateTime.day == DateTime.now().day) {
    NutritionState dayState = NutritionState();
    dayState.name = "defaultUser";
    dayState.carbonates = 10;
    dayState.fats = 20;
    dayState.proteins = 30.76;
    dayState.calories = 1000.3;
    dayState.water = 100.004;
    return Future.value(dayState);
  } else {
    NutritionState dayState = NutritionState();
    dayState.name = "defaultUser";
    dayState.carbonates = 10.012;
    dayState.fats = 20;
    dayState.proteins = 30;
    dayState.calories = 1300.345;
    dayState.water = 100;
    return Future.value(dayState);
  }
}

Future<List<NutritionState>> getStateForDaySpan (
    DateTime dateTime, int amount) async {
  List<NutritionState> result = new List<NutritionState>();
  for (int i = 0; i < amount; ++i) {
    DateTime current = dateTime.add(Duration(days:i));
    result.add(await getStateForDay(current));
  }
  return Future.value(result);
}

Future<NutritionState> getNormsForDay(DateTime dateTime) async {
  NormsHelper normsHelper = NormsHelper();
  NutritionState norms =  await normsHelper.getNorm("defaultUser");
  return Future.value(norms);
}
