import 'package:burger_shop_app/models/restaurants_model.dart';
import 'package:flutter/material.dart';

class FetchRestaurant{
  final RestaurantsModel? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchRestaurant({required this.data, required this.isLoading, required this.error, required this.refetch});
}