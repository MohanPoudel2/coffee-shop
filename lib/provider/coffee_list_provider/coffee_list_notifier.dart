// coffee_notifier.dart

import 'package:coffee_shop/data/model/coffee_list_model.dart';
import 'package:flutter/foundation.dart';

class CoffeeListNotifier with ChangeNotifier {
  late CoffeeListModel _selectedCoffee;
  final List<CoffeeListModel> _coffeeList = [
    CoffeeListModel(
        name: 'Cappuccino', image: 'assets/cappuccino.jpg', price: 10),
    CoffeeListModel(
        name: 'Latte Coffee', image: 'assets/latte_coffee.jpg', price: 12),
    CoffeeListModel(name: 'Espresso', image: 'assets/coffee3.jpg', price: 8),
    CoffeeListModel(name: 'Americano', image: 'assets/cofffee4.jpg', price: 13),
    CoffeeListModel(
        name: 'Café au lait', image: 'assets/coffee5.jpg', price: 13),
    CoffeeListModel(
        name: 'Black Coffee', image: 'assets/coffee7.jpg', price: 10),
    CoffeeListModel(
        name: 'Flat white', image: 'assets/latte_coffee.jpg', price: 10),
    CoffeeListModel(
        name: 'Mocha', image: 'assets/coffee6.jpg', price: 10),
  ];

  List<CoffeeListModel> get coffeeList => _coffeeList;
  CoffeeListModel get selectedCoffee => _selectedCoffee;
  void selectCoffee(CoffeeListModel coffee){
    _selectedCoffee=coffee;
    notifyListeners();

  }

}
