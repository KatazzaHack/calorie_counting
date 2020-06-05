///
//  Generated code. Do not modify.
//  source: calorie_counting.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Product extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Product', package: const $pb.PackageName('com.katazzahack.calorie_counting.protos'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..a<$core.double>(2, 'fat', $pb.PbFieldType.OF)
    ..a<$core.double>(3, 'protein', $pb.PbFieldType.OF)
    ..a<$core.double>(4, 'carb', $pb.PbFieldType.OF)
    ..a<$core.double>(5, 'calorie', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  Product._() : super();
  factory Product() => create();
  factory Product.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Product.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Product clone() => Product()..mergeFromMessage(this);
  Product copyWith(void Function(Product) updates) => super.copyWith((message) => updates(message as Product));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Product create() => Product._();
  Product createEmptyInstance() => create();
  static $pb.PbList<Product> createRepeated() => $pb.PbList<Product>();
  @$core.pragma('dart2js:noInline')
  static Product getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Product>(create);
  static Product _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get fat => $_getN(1);
  @$pb.TagNumber(2)
  set fat($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFat() => $_has(1);
  @$pb.TagNumber(2)
  void clearFat() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get protein => $_getN(2);
  @$pb.TagNumber(3)
  set protein($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProtein() => $_has(2);
  @$pb.TagNumber(3)
  void clearProtein() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get carb => $_getN(3);
  @$pb.TagNumber(4)
  set carb($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCarb() => $_has(3);
  @$pb.TagNumber(4)
  void clearCarb() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get calorie => $_getN(4);
  @$pb.TagNumber(5)
  set calorie($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCalorie() => $_has(4);
  @$pb.TagNumber(5)
  void clearCalorie() => clearField(5);
}

class WeightedProduct extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WeightedProduct', package: const $pb.PackageName('com.katazzahack.calorie_counting.protos'), createEmptyInstance: create)
    ..aOM<Product>(1, 'product', subBuilder: Product.create)
    ..a<$core.double>(2, 'grams', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  WeightedProduct._() : super();
  factory WeightedProduct() => create();
  factory WeightedProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WeightedProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WeightedProduct clone() => WeightedProduct()..mergeFromMessage(this);
  WeightedProduct copyWith(void Function(WeightedProduct) updates) => super.copyWith((message) => updates(message as WeightedProduct));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WeightedProduct create() => WeightedProduct._();
  WeightedProduct createEmptyInstance() => create();
  static $pb.PbList<WeightedProduct> createRepeated() => $pb.PbList<WeightedProduct>();
  @$core.pragma('dart2js:noInline')
  static WeightedProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WeightedProduct>(create);
  static WeightedProduct _defaultInstance;

  @$pb.TagNumber(1)
  Product get product => $_getN(0);
  @$pb.TagNumber(1)
  set product(Product v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearProduct() => clearField(1);
  @$pb.TagNumber(1)
  Product ensureProduct() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get grams => $_getN(1);
  @$pb.TagNumber(2)
  set grams($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGrams() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrams() => clearField(2);
}

class Dish extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Dish', package: const $pb.PackageName('com.katazzahack.calorie_counting.protos'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..pc<WeightedProduct>(2, 'ingredients', $pb.PbFieldType.PM, subBuilder: WeightedProduct.create)
    ..hasRequiredFields = false
  ;

  Dish._() : super();
  factory Dish() => create();
  factory Dish.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Dish.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Dish clone() => Dish()..mergeFromMessage(this);
  Dish copyWith(void Function(Dish) updates) => super.copyWith((message) => updates(message as Dish));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Dish create() => Dish._();
  Dish createEmptyInstance() => create();
  static $pb.PbList<Dish> createRepeated() => $pb.PbList<Dish>();
  @$core.pragma('dart2js:noInline')
  static Dish getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Dish>(create);
  static Dish _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<WeightedProduct> get ingredients => $_getList(1);
}

enum MealEntity_Meal {
  dish, 
  product, 
  notSet
}

class MealEntity extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, MealEntity_Meal> _MealEntity_MealByTag = {
    1 : MealEntity_Meal.dish,
    2 : MealEntity_Meal.product,
    0 : MealEntity_Meal.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MealEntity', package: const $pb.PackageName('com.katazzahack.calorie_counting.protos'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Dish>(1, 'dish', subBuilder: Dish.create)
    ..aOM<WeightedProduct>(2, 'product', subBuilder: WeightedProduct.create)
    ..hasRequiredFields = false
  ;

  MealEntity._() : super();
  factory MealEntity() => create();
  factory MealEntity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MealEntity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MealEntity clone() => MealEntity()..mergeFromMessage(this);
  MealEntity copyWith(void Function(MealEntity) updates) => super.copyWith((message) => updates(message as MealEntity));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MealEntity create() => MealEntity._();
  MealEntity createEmptyInstance() => create();
  static $pb.PbList<MealEntity> createRepeated() => $pb.PbList<MealEntity>();
  @$core.pragma('dart2js:noInline')
  static MealEntity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MealEntity>(create);
  static MealEntity _defaultInstance;

  MealEntity_Meal whichMeal() => _MealEntity_MealByTag[$_whichOneof(0)];
  void clearMeal() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Dish get dish => $_getN(0);
  @$pb.TagNumber(1)
  set dish(Dish v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDish() => $_has(0);
  @$pb.TagNumber(1)
  void clearDish() => clearField(1);
  @$pb.TagNumber(1)
  Dish ensureDish() => $_ensure(0);

  @$pb.TagNumber(2)
  WeightedProduct get product => $_getN(1);
  @$pb.TagNumber(2)
  set product(WeightedProduct v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProduct() => $_has(1);
  @$pb.TagNumber(2)
  void clearProduct() => clearField(2);
  @$pb.TagNumber(2)
  WeightedProduct ensureProduct() => $_ensure(1);
}

class Meal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Meal', package: const $pb.PackageName('com.katazzahack.calorie_counting.protos'), createEmptyInstance: create)
    ..pc<MealEntity>(1, 'meals', $pb.PbFieldType.PM, subBuilder: MealEntity.create)
    ..hasRequiredFields = false
  ;

  Meal._() : super();
  factory Meal() => create();
  factory Meal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Meal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Meal clone() => Meal()..mergeFromMessage(this);
  Meal copyWith(void Function(Meal) updates) => super.copyWith((message) => updates(message as Meal));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Meal create() => Meal._();
  Meal createEmptyInstance() => create();
  static $pb.PbList<Meal> createRepeated() => $pb.PbList<Meal>();
  @$core.pragma('dart2js:noInline')
  static Meal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Meal>(create);
  static Meal _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MealEntity> get meals => $_getList(0);
}

