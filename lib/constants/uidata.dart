// import 'package:intl/intl.dart';

class FoodCategory {
  final int id;
  final String title;
  final String value;
  final String? imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  FoodCategory({
    required this.id,
    required this.title,
    required this.value,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'version': version,
    };
  }
}

class Restaurant {
  final String id;
  final String name;
  final double rating;
  final int ratingCount;
  final String? imageUrl;
  final List<Food> menu;
  final int time;
  final Coords coords;
  final bool isOpen;
  final String openingHours;
  final String closingHours;

  Restaurant({
    required this.id,
    required this.name,
    required this.rating,
    required this.ratingCount,
    this.imageUrl,
    required this.menu,
    required this.time,
    required this.coords,
    required this.isOpen,
    required this.openingHours,
    required this.closingHours,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      'ratingCount': ratingCount,
      'imageUrl': imageUrl,
      'menu': menu.map((food) => food.toMap()).toList(),
      'time': time,
      'coords': coords.toMap(),
      'isOpen': isOpen,
      'openingHours': openingHours,
      'closingHours': closingHours,
    };
  }

  // bool isCurrentlyOpen() {
  //   final now = DateTime.now();
  //   final openingTime = _parseTime(openingHours);
  //   final closingTime = _parseTime(closingHours);

  //   if (closingTime.isAfter(openingTime)) {
  //     return now.isAfter(openingTime) && now.isBefore(closingTime);
  //   } else {
  //     return now.isAfter(openingTime) || now.isBefore(closingTime);
  //   }
  // }

  // DateTime _parseTime(String time) {
  //   try {
  //   final cleanedTime = time.trim(); // Trim any leading/trailing spaces
  //   print('Parsing time: $cleanedTime'); // Debugging
  //   final format = DateFormat.jm(); // Expected format: "hh:mm a"
  //   final parsedTime = format.parse(cleanedTime);
  //   print('Parsed time: $parsedTime'); // Debugging
  //   return parsedTime;
  // } catch (e) {
  //   print('Error parsing time: $time');
  //   print('Error details: $e');
  //   throw FormatException('Invalid time format: $time');
  // }
  // }
}

class Coords {
  final String id;
  final double latitude;
  final double longitude;
  final String address;
  final String title;
  final double latitudeDelta;
  final double longitudeDelta;

  Coords({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.title,
    required this.latitudeDelta,
    required this.longitudeDelta,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'title': title,
      'latitudeDelta': latitudeDelta,
      'longitudeDelta': longitudeDelta,
    };
  }
}

class Food {
  final String id;
  final String title;
  final List<String> foodTags;
  final List<String> foodType;
  final String code;
  final bool isAvailable;
  final Restaurant restaurant;
  final double rating;
  final int ratingCount;
  final String description;
  final double price;
  final List<Additive> additives;
  final String? imageUrl;
  final String time;
  final FoodCategory category;
  final int version;

  Food({
    required this.id,
    required this.title,
    required this.foodTags,
    required this.foodType,
    required this.code,
    required this.isAvailable,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.price,
    required this.additives,
    this.imageUrl,
    required this.time,
    required this.category,
    required this.version,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'foodTags': foodTags,
      'foodType': foodType,
      'code': code,
      'isAvailable': isAvailable,
      'restaurant': restaurant.toMap(), // Ensure Restaurant has a toMap method
      'rating': rating,
      'ratingCount': ratingCount,
      'description': description,
      'price': price,
      'additives':
          additives
              .map((additive) => additive.toMap())
              .toList(), // Ensure Additive has a toMap method
      'imageUrl': imageUrl,
      'time': time,
      'category': category.toMap(), // Ensure FoodCategory has a toMap method
      'version': version,
    };
  }
}

class Additive {
  final int id;
  final String title;
  final double price;

  Additive({required this.id, required this.title, required this.price});
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'price': price};
  }
}

List<FoodCategory> categories = [
  FoodCategory(
    id: 1,
    title: "Dessert",
    value: "dessert",
    imageUrl: "assets/images/dessert.png",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    version: 2,
  ),
  FoodCategory(
    id: 2,
    title: "Grilled",
    value: "main_course",
    imageUrl: "assets/images/grilled.png",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    version: 2,
  ),
  FoodCategory(
    id: 3,
    title: "Salad",
    value: "salad",
    imageUrl: "assets/images/salad.png",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    version: 2,
  ),
  FoodCategory(
    id: 4,
    title: "Drinks",
    value: "drinks",
    imageUrl: "assets/images/drinks.png",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    version: 2,
  ),
  FoodCategory(
    id: 5,
    title: "Appetizer",
    value: "appetizer",
    imageUrl: "assets/images/appetizer.png",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    version: 2,
  ),
  FoodCategory(
    id: 6,
    title: "Fried Chicken",
    value: "Fried Chicken",
    imageUrl: "assets/images/friedchicken.png",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    version: 2,
  ),
  FoodCategory(
    id: 7,
    title: "Pizza",
    value: "Pizza",
    imageUrl: "assets/images/pizza.png",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    version: 2,
  ),
  FoodCategory(
    id: 8,
    title: "Pasta",
    value: "Pasta",
    imageUrl: "assets/images/pasta.png",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    version: 2,
  ),
  FoodCategory(
    id: 9,
    title: "More",
    value: "More",
    imageUrl: "assets/images/shrimp.png",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    version: 2,
  ),
];

List<Restaurant> restaurants = [
  Restaurant(
    id: "1",
    name: "Buffalo Burger",
    rating: 4.5,
    ratingCount: 500,
    imageUrl: "assets/images/buffaloburger.jpg",
    menu: [],
    time: 20,
    coords: Coords(
      id: "2024",
      latitude: 30.0616,
      longitude: 31.2195,
      address: "26 Nile Street, Zamalek, Cairo, Egypt",
      title: "Buffalo Burger",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "12:00 PM",
    closingHours: "2:00 AM",
  ),
  Restaurant(
    id: "2",
    name: "Kazoku",
    rating: 4.7,
    ratingCount: 500,
    imageUrl: "assets/images/kazoku.png",
    menu: [],
    time: 20,
    coords: Coords(
      id: "2025",
      latitude: 30.0276,
      longitude: 31.4700,
      address: "Mall of Egypt, New Cairo, Egypt",
      title: "Kazoku",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: false,
    openingHours: "10:00 AM",
    closingHours: "10:00 PM",
  ),
  Restaurant(
    id: "3",
    name: "Hagoga",
    rating: 4.6,
    ratingCount: 500,
    imageUrl: "assets/images/hagoga.jpg",
    menu: [],
    time: 20,
    coords: Coords(
      id: "2026",
      latitude: 29.9627,
      longitude: 31.2597,
      address: "Road 9, Maadi, Cairo, Egypt",
      title: "Hagoga",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "11:00 AM",
    closingHours: "11:00 PM",
  ),
  Restaurant(
    id: "4",
    name: "Heart Attack",
    rating: 4.3,
    ratingCount: 1000,
    imageUrl: "assets/images/heartattack.jpg",
    menu: [],
    time: 26,
    coords: Coords(
      id: "2027",
      latitude: 30.0444,
      longitude: 31.2357,
      address: "Talaat Harb Street, Downtown, Cairo, Egypt",
      title: "Heart Attack",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "1:00 PM",
    closingHours: "1:00 AM",
  ),
  Restaurant(
    id: "5",
    name: "Papa John's",
    rating: 4.4,
    ratingCount: 1500,
    imageUrl: "assets/images/papajohn.png",
    menu: [],
    time: 45,
    coords: Coords(
      id: "2028",
      latitude: 30.0616,
      longitude: 31.2195,
      address: "15 Hassan Sabry Street, Zamalek, Cairo, Egypt",
      title: "Papa John's",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "11:00 AM",
    closingHours: "12:00 AM",
  ),
  Restaurant(
    id: "6",
    name: "Primos Pizza",
    rating: 4.6,
    ratingCount: 765,
    imageUrl: "assets/images/primos.jpg",
    menu: [],
    time: 50,
    coords: Coords(
      id: "2029",
      latitude: 30.0616,
      longitude: 31.2195,
      address: "12 Mohamed Mazhar Street, Zamalek, Cairo, Egypt",
      title: "Primos Pizza",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "12:00 PM",
    closingHours: "11:00 PM",
  ),
  Restaurant(
    id: "7",
    name: "Maison Thomas",
    rating: 4.7,
    ratingCount: 356,
    imageUrl: "assets/images/maisonthomas.jpg",
    menu: [],
    time: 55,
    coords: Coords(
      id: "2030",
      latitude: 30.0616,
      longitude: 31.2195,
      address: "157 26th of July Street, Zamalek, Cairo, Egypt",
      title: "Maison Thomas",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "10:00 AM",
    closingHours: "10:00 PM",
  ),
  Restaurant(
    id: "8",
    name: "Kasr elKebabgy",
    rating: 4.5,
    ratingCount: 2210,
    imageUrl: "assets/images/kasrelkababgy.jpg",
    menu: [],
    time: 60,
    coords: Coords(
      id: "2031",
      latitude: 30.0276,
      longitude: 31.4700,
      address: "Cairo Festival City, New Cairo, Egypt",
      title: "Kasr elKebabgy",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "12:00 PM",
    closingHours: "12:00 AM",
  ),
  Restaurant(
    id: "9",
    name: "Burger King",
    rating: 4.1,
    ratingCount: 1215,
    imageUrl: "assets/images/burgerking.jpg",
    menu: [],
    time: 20,
    coords: Coords(
      id: "2032",
      latitude: 30.0199,
      longitude: 31.4358,
      address: "Point 90 Mall, Fifth Settlement, Cairo, Egypt",
      title: "Burger King",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "10:00 AM",
    closingHours: "11:00 PM",
  ),
  Restaurant(
    id: "10",
    name: "Wahmy",
    rating: 4.8,
    ratingCount: 950,
    imageUrl: "assets/images/wahmy.jpg",
    menu: [],
    time: 15,
    coords: Coords(
      id: "2033",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Sphinx Square, Giza, Egypt",
      title: "Wahmy",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "12:00 PM",
    closingHours: "2:00 AM",
  ),
  Restaurant(
    id: "11",
    name: "McDonald's",
    rating: 4.2,
    ratingCount: 600,
    imageUrl: "assets/images/mac.jpg",
    menu: [],
    time: 15,
    coords: Coords(
      id: "2034",
      latitude: 30.0199,
      longitude: 31.4358,
      address: "Downtown Mall, Fifth Settlement, Cairo, Egypt",
      title: "McDonald's",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "9:00 AM",
    closingHours: "12:00 AM",
  ),
  Restaurant(
    id: "12",
    name: "KFC",
    rating: 4.1,
    ratingCount: 4003,
    imageUrl: "assets/images/kfc.jpg",
    menu: [],
    time: 15,
    coords: Coords(
      id: "2035",
      latitude: 30.0199,
      longitude: 31.4358,
      address: "American University in Cairo, Fifth Settlement, Cairo",
      title: "KFC",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "10:00 AM",
    closingHours: "11:00 PM",
  ),
  Restaurant(
    id: "13",
    name: "Pizza Hut",
    rating: 4.3,
    ratingCount: 2320,
    imageUrl: "assets/images/pizzahut.jpg",
    menu: [],
    time: 30,
    coords: Coords(
      id: "2036",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Square, Giza, Egypt",
      title: "Pizza Hut",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "11:00 AM",
    closingHours: "12:00 AM",
  ),
  Restaurant(
    id: "14",
    name: "Starbucks",
    rating: 4.4,
    ratingCount: 1418,
    imageUrl: "assets/images/starbucks.jpg",
    menu: [],
    time: 10,
    coords: Coords(
      id: "2037",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Mall, Giza, Egypt",
      title: "Starbucks",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "7:00 AM",
    closingHours: "11:00 PM",
  ),
  Restaurant(
    id: "15",
    name: "Hardee's",
    rating: 4.2,
    ratingCount: 1152,
    imageUrl: "assets/images/hardees.jpg",
    menu: [],
    time: 40,
    coords: Coords(
      id: "2038",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Corniche, Giza, Egypt",
      title: "Hardee's",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "10:00 AM",
    closingHours: "12:00 AM",
  ),
  Restaurant(
    id: "16",
    name: "Domino's Pizza",
    rating: 4.3,
    ratingCount: 2406,
    imageUrl: "assets/images/dominos.png",
    menu: [],
    time: 45,
    coords: Coords(
      id: "2039",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Plaza, Giza, Egypt",
      title: "Domino's Pizza",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "11:00 AM",
    closingHours: "1:00 AM",
  ),
  Restaurant(
    id: "17",
    name: "Chili's",
    rating: 4.5,
    ratingCount: 340,
    imageUrl: "assets/images/chilis.jpg",
    menu: [],
    time: 35,
    coords: Coords(
      id: "2040",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Mall, Giza, Egypt",
      title: "Chili's",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "12:00 PM",
    closingHours: "11:00 PM",
  ),
  Restaurant(
    id: "18",
    name: "Rib I",
    rating: 4.5,
    ratingCount: 567,
    imageUrl: "assets/images/ribi.jpg",
    menu: [],
    time: 60,
    coords: Coords(
      id: "2041",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Corniche, Giza, Egypt",
      title: "Rib I",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "1:00 PM",
    closingHours: "12:00 AM",
  ),
  Restaurant(
    id: "19",
    name: "Costa Coffee",
    rating: 4.5,
    ratingCount: 2510,
    imageUrl: "assets/images/costa.jpg",
    menu: [],
    time: 8,
    coords: Coords(
      id: "2042",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Plaza, Giza, Egypt",
      title: "Costa Coffee",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "8:00 AM",
    closingHours: "10:00 PM",
  ),
  Restaurant(
    id: "20",
    name: "Belaban",
    rating: 4.5,
    ratingCount: 3312,
    imageUrl: "assets/images/blaban.png",
    menu: [],
    time: 25,
    coords: Coords(
      id: "2043",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Square, Giza, Egypt",
      title: "Belaban",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "12:00 PM",
    closingHours: "1:00 AM",
  ),
  Restaurant(
    id: "21",
    name: "Bazooka",
    rating: 4.5,
    ratingCount: 1815,
    imageUrl: "assets/images/bazooka.jpg",
    menu: [],
    time: 60,
    coords: Coords(
      id: "2044",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Mall, Giza, Egypt",
      title: "Bazooka",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "12:00 PM",
    closingHours: "12:00 AM",
  ),
  Restaurant(
    id: "22",
    name: "Buffalo Burger",
    rating: 4.5,
    ratingCount: 3150,
    imageUrl: "assets/images/buffaloburger.jpg",
    menu: [],
    time: 45,
    coords: Coords(
      id: "2045",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Corniche, Giza, Egypt",
      title: "Buffalo Burger",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "12:00 PM",
    closingHours: "2:00 AM",
  ),
  Restaurant(
    id: "23",
    name: "Pizza Station",
    rating: 4.5,
    ratingCount: 1588,
    imageUrl: "assets/images/pizzastation.jpg",
    menu: [],
    time: 50,
    coords: Coords(
      id: "2046",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Plaza, Giza, Egypt",
      title: "Pizza Station",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "11:00 AM",
    closingHours: "11:00 PM",
  ),
  Restaurant(
    id: "24",
    name: "Willy's",
    rating: 4.5,
    ratingCount: 1479,
    imageUrl: "assets/images/willy's.png",
    menu: [],
    time: 45,
    coords: Coords(
      id: "2047",
      latitude: 29.9870,
      longitude: 31.2118,
      address: "Giza Mall, Giza, Egypt",
      title: "Willy's",
      latitudeDelta: 0.01,
      longitudeDelta: 0.01,
    ),
    isOpen: true,
    openingHours: "12:00 PM",
    closingHours: "12:00 AM",
  ),
];
List<Food> foods = [
  Food(
    id: "1",
    title: "Koshari",
    foodTags: ["Egyptian", "Vegan", "Spicy"],
    foodType: ["Main Course"],
    code: "41007430",
    isAvailable: true,
    restaurant: restaurants[0],
    rating: 4.8,
    ratingCount: 500,
    description:
        "A traditional Egyptian dish made with pasta, rice, lentils, and a spicy tomato sauce.",
    price: 25.99,
    additives: [
      Additive(id: 1, title: "Extra Tomato Sauce", price: 5.00),
      Additive(id: 2, title: "Extra Garlic Sauce", price: 5.50),
      Additive(id: 3, title: "Extra Spice", price: 4.00),
    ],
    imageUrl:
        "https://www.chocolatesandchai.com/wp-content/uploads/2023/02/Egyptian-Koshari-1.jpg",
    time: "25 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "2",
    title: "Sushi Platter",
    foodTags: ["Japanese", "Seafood", "Healthy"],
    foodType: ["Starter", "Main Course"],
    code: "41007431",
    isAvailable: true,
    restaurant: restaurants[1],
    rating: 4.9,
    ratingCount: 320,
    description:
        "A selection of fresh sushi rolls including salmon, tuna, and avocado.",
    price: 282.99,
    additives: [Additive(id: 1, title: "Extra Wasabi", price: 1.00)],
    imageUrl:
        "https://kitchen.sayidaty.net/uploads/small/90/90cf15fca56b0e383c071d4a209af016_w750_h750.jpg",
    time: "40 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "3",
    title: "Big Mac",
    foodTags: ["American", "Grilled", "Juicy"],
    foodType: ["Main Course"],
    code: "41007432",
    isAvailable: true,
    restaurant: restaurants[2],
    rating: 4.7,
    ratingCount: 410,
    description:
        "A thick, juicy beef burger with cheddar cheese and caramelized onions.",
    price: 267.99,
    additives: [Additive(id: 1, title: "Extra Cheese", price: 2.00)],
    imageUrl:
        "https://i0.wp.com/yummyfreebies.com/wp-content/uploads/2020/05/amirali-mirhashemian-sc5sTPMrVfk-unsplash-scaled.jpg",
    time: "30 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "4",
    title: "Molokhia",
    foodTags: ["Egyptian", "Traditional"],
    foodType: ["Main Course"],
    code: "41007433",
    isAvailable: true,
    restaurant: restaurants[4],
    rating: 4.6,
    ratingCount: 280,
    description:
        "A classic Egyptian green soup made from jute leaves, served with rice or bread.",
    price: 91.99,
    additives: [],
    imageUrl:
        "https://i0.wp.com/eyesclosedcooking.com/wp-content/uploads/2023/01/Egyptian_Molokhia_1.jpg?fit=1024%2C682&ssl=1",
    time: "20 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "5",
    title: "Hawawshi",
    foodTags: ["Egyptian", "Spicy", "Grilled"],
    foodType: ["Main Course"],
    code: "41007433",
    isAvailable: true,
    restaurant: restaurants[0],
    rating: 4.7,
    ratingCount: 400,
    description: "A spicy meat-stuffed bread, grilled to perfection.",
    price: 139.99,
    additives: [Additive(id: 1, title: "Extra Spice", price: 5.00)],
    imageUrl:
        "https://kitchen.sayidaty.net/uploads/small/5f/5f6d39861ac1d9ef4bd3a5561f9e42eb_w750_h500.jpg",
    time: "30 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "6",
    title: "Mahshi",
    foodTags: ["Egyptian", "Vegetarian", "Healthy"],
    foodType: ["Main Course"],
    code: "41007434",
    isAvailable: true,
    restaurant: restaurants[0],
    rating: 4.6,
    ratingCount: 300,
    description:
        "Vegetables like zucchini and eggplant stuffed with rice and herbs.",
    price: 79.99,
    additives: [],
    imageUrl:
        "https://www.thaqfny.com/wp-content/uploads/2022/12/%D8%A7%D9%84%D8%B3%D8%B9%D8%B1%D8%A7%D8%AA-%D8%A7%D9%84%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A%D8%A9-%D9%81%D9%8A-%D9%85%D8%AD%D8%B4%D9%8A-%D8%A7%D9%84%D9%83%D8%B1%D9%86%D8%A8-1200x900-1.jpg",
    time: "40 min",
    category: categories[1],
    version: 2,
  ),

  Food(
    id: "7",
    title: "Cheeseburger",
    foodTags: ["American", "Grilled", "Juicy"],
    foodType: ["Main Course"],
    code: "41007435",
    isAvailable: true,
    restaurant: restaurants[10],
    rating: 4.7,
    ratingCount: 410,
    description:
        "A thick, juicy beef burger with cheddar cheese and caramelized onions.",
    price: 185.99,
    additives: [Additive(id: 1, title: "Extra Cheese", price: 2.00)],
    imageUrl:
        "https://www.sargento.com/assets/Uploads/Recipe/Image/burger_0__FillWzExNzAsNTgzXQ.jpg",
    time: "30 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "8",
    title: "BBQ Ribs",
    foodTags: ["American", "Grilled", "Smoky"],
    foodType: ["Main Course"],
    code: "41007436",
    isAvailable: true,
    restaurant: restaurants[10],
    rating: 4.8,
    ratingCount: 450,
    description: "Slow-cooked pork ribs with a smoky BBQ sauce.",
    price: 549.99,
    additives: [Additive(id: 1, title: "Extra Sauce", price: 1.50)],
    imageUrl:
        "https://www.thecookierookie.com/wp-content/uploads/2018/12/crock-pot-ribs-recipe-slow-cooker-bbq-ribs-5-of-7.jpg",
    time: "45 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "9",
    title: "Mac and Cheese",
    foodTags: ["American", "Comfort Food", "Cheesy"],
    foodType: ["Main Course"],
    code: "41007437",
    isAvailable: true,
    restaurant: restaurants[10],
    rating: 4.6,
    ratingCount: 320,
    description: "Creamy macaroni pasta with melted cheddar cheese.",
    price: 190.0,
    additives: [Additive(id: 1, title: "Extra Cheese", price: 1.00)],
    imageUrl:
        "https://www.zupans.com/app/uploads/2020/05/iStock-174990644-4096x2731.jpg",
    time: "20 min",
    category: categories[1],
    version: 2,
  ),

  Food(
    id: "9",
    title: "Shawarma",
    foodTags: ["Arabian", "Grilled", "Spicy"],
    foodType: ["Main Course"],
    code: "41007438",
    isAvailable: true,
    restaurant: restaurants[15],
    rating: 4.9,
    ratingCount: 500,
    description:
        "Grilled chicken or beef wrapped in pita bread with garlic sauce.",
    price: 99.99,
    additives: [Additive(id: 1, title: "Extra Garlic Sauce", price: 0.50)],
    imageUrl:
        "https://1.bp.blogspot.com/-Lmxxa3snXOw/Xul3v_eFFPI/AAAAAAAA0T4/CwazWI4hxPUgaOPnUuElIKFu-uXMIibRgCLcBGAsYHQ/s1600/DSC07980.jpg",
    time: "25 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "10",
    title: "Hummus",
    foodTags: ["Arabian", "Vegan", "Healthy"],
    foodType: ["Appetizer"],
    code: "41007439",
    isAvailable: true,
    restaurant: restaurants[15],
    rating: 4.7,
    ratingCount: 400,
    description:
        "A creamy dip made from blended chickpeas, tahini, and olive oil.",
    price: 15.99,
    additives: [Additive(id: 1, title: "Extra Olive Oil", price: 0.50)],
    imageUrl:
        "https://feelgoodfoodie.net/wp-content/uploads/2022/04/Roasted-Garlic-Hummus-10.jpg",
    time: "15 min",
    category: categories[4],
    version: 2,
  ),
  Food(
    id: "11",
    title: "Fatta",
    foodTags: ["Egyptian", "Traditional", "Festive"],
    foodType: ["Main Course"],
    code: "41007440",
    isAvailable: true,
    restaurant: restaurants[0],
    rating: 4.5,
    ratingCount: 250,
    description:
        "A festive Egyptian dish made with rice, bread, garlic, vinegar, and meat, topped with a garlic tomato sauce.",
    price: 219.99,
    additives: [
      Additive(id: 1, title: "Extra Meat", price: 3.00),
      Additive(id: 2, title: "Extra Garlic Sauce", price: 0.50),
      Additive(id: 3, title: "Extra Rice", price: 1.00),
    ],
    imageUrl:
        "https://www.unileverfoodsolutions.eg/dam/global-ufs/mcos/meps/arabia/calcmenu/recipes/EG-recipes/In-Development/beef-shank-over-egyptian-fatta/main-header.jpg",
    time: "35 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "12",
    title: "Umm Ali",
    foodTags: ["Egyptian", "Dessert", "Sweet"],
    foodType: ["Dessert"],
    code: "41007441",
    isAvailable: true,
    restaurant: restaurants[0],
    rating: 4.8,
    ratingCount: 300,
    description:
        "A traditional Egyptian dessert made with puff pastry, milk, nuts, and raisins, baked to perfection.",
    price: 69.99,
    additives: [
      Additive(id: 1, title: "Extra Nuts", price: 1.00),
      Additive(id: 2, title: "Extra Raisins", price: 0.50),
      Additive(id: 3, title: "Extra Cream", price: 0.75),
    ],
    imageUrl:
        "https://www.carolinescooking.com/wp-content/uploads/2020/02/umm-Ali-featured-pic-sq.jpg",
    time: "20 min",
    category: categories[4],
    version: 2,
  ),
  Food(
    id: "13",
    title: "Pepperoni Pizza",
    foodTags: ["Pizza", "Italian", "Cheesy"],
    foodType: ["Main Course"],
    code: "41007442",
    isAvailable: true,
    restaurant: restaurants[5], // Assuming Papa John's is at index 5
    rating: 4.9,
    ratingCount: 600,
    description:
        "A classic pepperoni pizza with a generous amount of cheese and pepperoni on a crispy crust.",
    price: 290.99,
    additives: [
      Additive(id: 1, title: "Extra Cheese", price: 2.00),
      Additive(id: 2, title: "Extra Pepperoni", price: 3.00),
      Additive(id: 3, title: "Extra Garlic Dip", price: 1.00),
    ],
    imageUrl:
        "https://colorfulrecipes.com/wp-content/uploads/2020/08/best-pepperoni-pizza-recipe-10.jpg",
    time: "25 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "15",
    title: "Margherita Pizza",
    foodTags: ["Pizza", "Italian", "Vegetarian"],
    foodType: ["Main Course"],
    code: "41007443",
    isAvailable: true,
    restaurant: restaurants[5], // Assuming Papa John's is at index 5
    rating: 4.7,
    ratingCount: 450,
    description:
        "A simple yet delicious pizza with fresh mozzarella, tomatoes, and basil on a thin crust.",
    price: 179.99,
    additives: [
      Additive(id: 1, title: "Extra Basil", price: 1.00),
      Additive(id: 2, title: "Extra Cheese", price: 2.00),
      Additive(id: 3, title: "Extra Tomato Sauce", price: 0.50),
    ],
    imageUrl:
        "https://cookieandkate.com/images/2021/07/homemade-margherita-pizza.jpg",
    time: "20 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "16",
    title: "BBQ Chicken Pizza",
    foodTags: ["Pizza", "American", "Grilled"],
    foodType: ["Main Course"],
    code: "41007444",
    isAvailable: true,
    restaurant: restaurants[6], // Assuming Pizza Station is at index 6
    rating: 4.8,
    ratingCount: 500,
    description:
        "A flavorful pizza topped with BBQ chicken, onions, and cilantro on a crispy crust.",
    price: 384.99,
    additives: [
      Additive(id: 1, title: "Extra BBQ Sauce", price: 1.50),
      Additive(id: 2, title: "Extra Chicken", price: 3.00),
      Additive(id: 3, title: "Extra Cilantro", price: 0.50),
    ],
    imageUrl:
        "https://www.handi-foil.com/wp-content/uploads/2019/07/BBQ-Chicken-Pizza-16-of-19-2000x1333.jpg",
    time: "30 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "18",
    title: "Kebab & Kofta",
    foodTags: ["Egyptian", "Grilled", "Meat"],
    foodType: ["Main Course"],
    code: "41007446",
    isAvailable: true,
    restaurant: restaurants[0],
    rating: 4.7,
    ratingCount: 350,
    description:
        "Grilled skewers of seasoned ground meat (kofta) and chunks of marinated meat (kebab), served with rice or bread.",
    price: 749.99,
    additives: [
      Additive(id: 1, title: "Extra Garlic Sauce", price: 0.50),
      Additive(id: 2, title: "Extra Rice", price: 1.00),
      Additive(id: 3, title: "Extra Grilled Vegetables", price: 2.00),
    ],
    imageUrl:
        "https://www.fufuskitchen.com/wp-content/uploads/2020/08/IMG_3384-scaled.webp",
    time: "30 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "19",
    title: "Basbousa",
    foodTags: ["Egyptian", "Dessert", "Sweet"],
    foodType: ["Dessert"],
    code: "41007447",
    isAvailable: true,
    restaurant: restaurants[0],
    rating: 4.6,
    ratingCount: 280,
    description:
        "A sweet semolina cake soaked in syrup, often topped with coconut or nuts.",
    price: 109.99,
    additives: [
      Additive(id: 1, title: "Extra Syrup", price: 0.50),
      Additive(id: 2, title: "Extra Coconut", price: 0.50),
      Additive(id: 3, title: "Extra Nuts", price: 1.00),
    ],
    imageUrl: "https://www.chefspencil.com/wp-content/uploads/Basbousa-1.jpg",
    time: "15 min",
    category: categories[4],
    version: 2,
  ),
  Food(
    id: "20",
    title: "Crepe Dubai",
    foodTags: ["Dessert", "Sweet", "Trendy"],
    foodType: ["Dessert"],
    code: "41007455",
    isAvailable: true,
    restaurant: restaurants[7], // Assuming Blaban is at index 7
    rating: 4.9,
    ratingCount: 650,
    description:
        "A luxurious crepe filled with Nutella, fresh fruits, and topped with whipped cream and chocolate sauce.",
    price: 119.99,
    additives: [
      Additive(id: 1, title: "Extra Nutella", price: 1.50),
      Additive(id: 2, title: "Extra Fruits", price: 1.00),
      Additive(id: 3, title: "Extra Whipped Cream", price: 0.50),
    ],
    imageUrl:
        "https://pbs.twimg.com/media/D3-VShTX4AAnxbE.jpg", // Replace with actual image URL
    time: "15 min",
    category: categories[4],
    version: 2,
  ),
  Food(
    id: "21",
    title: "El Haba Cake",
    foodTags: ["Dessert", "Chocolate", "Trendy"],
    foodType: ["Dessert"],
    code: "41007456",
    isAvailable: true,
    restaurant: restaurants[7], // Assuming Blaban is at index 7
    rating: 4.8,
    ratingCount: 600,
    description:
        "A rich chocolate cake with layers of hazelnut cream, topped with chocolate ganache and crushed hazelnuts.",
    price: 129.99,
    additives: [
      Additive(id: 1, title: "Extra Hazelnut Cream", price: 1.00),
      Additive(id: 2, title: "Extra Chocolate Ganache", price: 0.75),
      Additive(id: 3, title: "Extra Crushed Hazelnuts", price: 0.50),
    ],
    imageUrl:
        "https://www.curlyscooking.co.uk/wp-content/uploads/2020/11/Pistachio-Cake-with-Vanilla-Cream-Cheese-Icing-7.jpg", // Replace with actual image URL
    time: "10 min",
    category: categories[4],
    version: 2,
  ),
  Food(
    id: "22",
    title: "Bamboza",
    foodTags: ["Dessert", "Sweet", "Trendy"],
    foodType: ["Dessert"],
    code: "41007457",
    isAvailable: true,
    restaurant: restaurants[7], // Assuming Blaban is at index 7
    rating: 4.7,
    ratingCount: 550,
    description:
        "A fluffy sponge cake layered with cream, fruits, and drizzled with caramel sauce.",
    price: 59.99,
    additives: [
      Additive(id: 1, title: "Extra Caramel Sauce", price: 0.50),
      Additive(id: 2, title: "Extra Fruits", price: 1.00),
      Additive(id: 3, title: "Extra Cream", price: 0.75),
    ],
    imageUrl:
        "https://www.mexatk.com/wp-content/uploads/2022/09/%D8%A8%D9%84%D8%A8%D9%86-1-1.jpg", // Replace with actual image URL
    time: "12 min",
    category: categories[4],
    version: 2,
  ),
  Food(
    id: "23",
    title: "Qashtota",
    foodTags: ["Dessert", "Sweet", "Trendy"],
    foodType: ["Dessert"],
    code: "41007458",
    isAvailable: true,
    restaurant: restaurants[7], // Assuming Blaban is at index 7
    rating: 4.8,
    ratingCount: 580,
    description:
        "A unique dessert combining layers of cake, cream, and caramel, topped with crunchy nuts.",
    price: 69.50,
    additives: [
      Additive(id: 1, title: "Extra Caramel", price: 0.50),
      Additive(id: 2, title: "Extra Nuts", price: 1.00),
      Additive(id: 3, title: "Extra Cream", price: 0.75),
    ],
    imageUrl:
        "https://images.deliveryhero.io/image/talabat/MenuItems/Qashtotah_super_lux__18638520669946299816.jpg", // Replace with actual image URL
    time: "10 min",
    category: categories[4],
    version: 2,
  ),

  Food(
    id: "24",
    title: "Mixed Grill Platter",
    foodTags: ["Grilled", "Meat", "Traditional"],
    foodType: ["Main Course"],
    code: "41007459",
    isAvailable: true,
    restaurant: restaurants[8], // Assuming Qasr El Kebabgi is at index 8
    rating: 4.9,
    ratingCount: 700,
    description:
        "A platter of grilled kofta, kebab, chicken, and lamb served with rice and grilled vegetables.",
    price: 429.99,
    additives: [
      Additive(id: 1, title: "Extra Garlic Sauce", price: 0.50),
      Additive(id: 2, title: "Extra Grilled Vegetables", price: 2.00),
      Additive(id: 3, title: "Extra Rice", price: 1.00),
    ],
    imageUrl:
        "https://www.australianbeef.com.au/contentassets/a7c605325a5a4e3986c817b7c89abd7a/mixed-grill-s.jpg", // Replace with actual image URL
    time: "30 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "25",
    title: "Shish Tawook",
    foodTags: ["Grilled", "Chicken", "Traditional"],
    foodType: ["Main Course"],
    code: "41007460",
    isAvailable: true,
    restaurant: restaurants[8], // Assuming Qasr El Kebabgi is at index 8
    rating: 4.8,
    ratingCount: 600,
    description:
        "Juicy marinated chicken skewers grilled to perfection, served with garlic sauce and bread.",
    price: 209.99,
    additives: [
      Additive(id: 1, title: "Extra Garlic Sauce", price: 0.50),
      Additive(id: 2, title: "Extra Bread", price: 0.50),
      Additive(id: 3, title: "Extra Grilled Vegetables", price: 2.00),
    ],
    imageUrl:
        "https://amiraspantry.com/wp-content/uploads/2021/03/shish-tawooq-IG.jpg", // Replace with actual image URL
    time: "25 min",
    category: categories[1],
    version: 2,
  ),

  Food(
    id: "26",
    title: "Beef Shawarma Sandwich",
    foodTags: ["Street Food", "Grilled", "Beef"],
    foodType: ["Main Course", "Snack"],
    code: "41007461",
    isAvailable: true,
    restaurant: restaurants[9], // Assuming Karam El Sham is at index 9
    rating: 4.9,
    ratingCount: 800,
    description:
        "Thinly sliced beef shawarma wrapped in pita bread with garlic sauce and pickles.",
    price: 148.99,
    additives: [
      Additive(id: 1, title: "Extra Garlic Sauce", price: 0.50),
      Additive(id: 2, title: "Extra Pickles", price: 0.50),
      Additive(id: 3, title: "Extra Beef", price: 2.00),
    ],
    imageUrl:
        "https://www.corriecooks.com/wp-content/uploads/2023/08/beefshawarma.jpg", // Replace with actual image URL
    time: "15 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "27",
    title: "Chicken Shawarma Plate",
    foodTags: ["Grilled", "Chicken", "Traditional"],
    foodType: ["Main Course"],
    code: "41007462",
    isAvailable: true,
    restaurant: restaurants[9], // Assuming Karam El Sham is at index 9
    rating: 4.8,
    ratingCount: 750,
    description:
        "Grilled chicken shawarma served with rice, garlic sauce, and a side of salad.",
    price: 229.99,
    additives: [
      Additive(id: 1, title: "Extra Garlic Sauce", price: 0.50),
      Additive(id: 2, title: "Extra Rice", price: 1.00),
      Additive(id: 3, title: "Extra Salad", price: 1.00),
    ],
    imageUrl:
        "https://img.freepik.com/premium-photo/arabic-chicken-shawarma-plate-with-fries-served-dish-isolated-table-side-view-middle-east-food_689047-3434.jpg?w=2000", // Replace with actual image URL
    time: "20 min",
    category: categories[1],
    version: 2,
  ),
];
