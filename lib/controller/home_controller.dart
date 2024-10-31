import 'package:foody/views/my_controller.dart';

class HomeController extends MyController {
  int selectTime = 1;
  int selectedId = 0;
  String selectedDailyTask = 'Today';

  void onSelect(int index) {
    selectedId = index;
    update();
  }

  void selectRevenue(String time) {
    selectedDailyTask = time;
    update();
  }

  void onSelectRevenue(int select) {
    selectTime = select;

    update();
  }

  List categoryList = [
    {"image": "assets/images/fast_food/baklava.png", "name": "Baklava"},
    {"image": "assets/images/fast_food/barbecue.png", "name": "Barbecue"},
    {"image": "assets/images/fast_food/burger.png", "name": "Burger"},
    {"image": "assets/images/fast_food/cake.png", "name": "Cake"},
    {"image": "assets/images/fast_food/chicken-leg.png", "name": "chicken Leg"},
    {"image": "assets/images/fast_food/coffee.png", "name": "Coffee"},
    {"image": "assets/images/fast_food/cupcake.png", "name": "Cup Cake"},
    {"image": "assets/images/fast_food/doughnut.png", "name": "Doughnut"},
    {"image": "assets/images/fast_food/food.png", "name": "Food"},
    {"image": "assets/images/fast_food/hamburger.png", "name": "Humburger"},
    {"image": "assets/images/fast_food/masala-dosa.png", "name": "Masala Dosa"},
    {"image": "assets/images/fast_food/nachos.png", "name": "Nachos"},
    {"image": "assets/images/fast_food/noodles.png", "name": "Noodles"},
    {"image": "assets/images/fast_food/pizza.png", "name": "Pizza"},
    {"image": "assets/images/fast_food/salad.png", "name": "Salad"},
  ];

  Map restaurant = {
    'List': [
      {
        'image': "assets/images/food/domino's.png",
        'name': 'Domino\'s Pizza',
        'star': 5,
        'charges': 'Buy 2 get 1 Free',
        'title': 'Pizza',
        'range': '2 km',
        'delivery': false
      },
      {
        'image': 'assets/images/food/pizza_hut.png',
        'name': 'Pizza Hut',
        'star': '4.2',
        'charges': 'Free Delivery',
        'title': 'Pizza',
        'range': '3.1 km',
        'delivery': true
      },
      {
        'image': 'assets/images/food/carrows.png',
        'name': 'Carrows Restaurant',
        'star': '1.5',
        'charges': '\$0.99 Delivery',
        'title': 'Fish',
        'range': '1 km',
        'delivery': true
      },
      {
        'image': "assets/images/food/mc_donald's.png",
        'name': 'McDonald\'s',
        'star': '5',
        'charges': '\$1.99 Delivery',
        'title': 'Burger',
        'range': '0.2 km',
        'delivery': true
      },
      {
        'image': 'assets/images/food/kfc.png',
        'name': 'KFC',
        'star': '3.3',
        'charges': 'Buy 3 get 1 Free',
        'title': 'Chicken',
        'range': '20 km',
        'delivery': false
      },
      {
        'image': 'assets/images/food/burger_king.png',
        'name': 'Burger King',
        'star': '3',
        'charges': 'Free Delivery',
        'title': 'Burger',
        'range': '6.1 km',
        'delivery': true
      },
    ]
  };
}
