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
  final String address;
  final double rating;
  final String? imageUrl;
  final List<Food> menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    this.imageUrl,
    required this.menu,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'rating': rating,
      'imageUrl': imageUrl,
      'menu': menu.map((food) => food.toMap()).toList(),
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
    name: "Abou El Sid",
    address: "Zamalek, Cairo, Egypt",
    rating: 4.5,
    imageUrl: "https://example.com/abou_elsid.jpg",
    menu: [],
  ),
  Restaurant(
    id: "2",
    name: "Kazoku",
    address: "New Cairo, Egypt",
    rating: 4.7,
    imageUrl: "https://example.com/kazoku.jpg",
    menu: [],
  ),
  Restaurant(
    id: "3",
    name: "Lucille's",
    address: "Maadi, Cairo, Egypt",
    rating: 4.6,
    imageUrl: "https://example.com/lucilles.jpg",
    menu: [],
  ),
  Restaurant(
    id: "4",
    name: "Felfela",
    address: "Downtown, Cairo, Egypt",
    rating: 4.3,
    imageUrl: "https://example.com/felfela.jpg",
    menu: [],
  ),

  Restaurant(
    id: "5",
    name: "Sequoia",
    address: "Zamalek, Cairo, Egypt",
    rating: 4.4,
    imageUrl: "https://example.com/sequoia.jpg",
    menu: [],
  ),
  Restaurant(
    id: "6",
    name: "O's Pasta",
    address: "Zamalek, Cairo, Egypt",
    rating: 4.6,
    imageUrl: "https://example.com/ospasta.jpg",
    menu: [],
  ),
  Restaurant(
    id: "7",
    name: "Maison Thomas",
    address: "Zamalek, Cairo, Egypt",
    rating: 4.7,
    imageUrl: "https://example.com/maison_thomas.jpg",
    menu: [],
  ),
  Restaurant(
    id: "8",
    name: "Crave",
    address: "New Cairo, Egypt",
    rating: 4.5,
    imageUrl: "https://example.com/crave.jpg",
    menu: [],
  ),
  Restaurant(
    id: "9",
    name: "Burger King",
    address: "Fifth settlement, cairo",
    rating: 4.1,
    imageUrl: "https://example.com/burger_king.jpg",
    menu: [],
  ),
  Restaurant(
    id: "10",
    name: "The Smokery",
    address: "Giza, Egypt",
    rating: 4.8,
    imageUrl: "https://example.com/the_smokery.jpg",
    menu: [],
  ),
  Restaurant(
    id: "11",
    name: "McDonald's",
    address: "Fifth settlement, cairo",
    rating: 4.2,
    imageUrl: "https://example.com/mcdonalds.jpg",
    menu: [],
  ),
  Restaurant(
    id: "12",
    name: "KFC",
    address: "Alexandria, Egypt",
    rating: 4.1,
    imageUrl: "https://example.com/kfc.jpg",
    menu: [],
  ),
  Restaurant(
    id: "13",
    name: "Pizza Hut",
    address: "Giza, Egypt",
    rating: 4.3,
    imageUrl: "https://example.com/pizza_hut.jpg",
    menu: [],
  ),
  Restaurant(
    id: "15",
    name: "Starbucks",
    address: "New Cairo, Egypt",
    rating: 4.4,
    imageUrl: "https://example.com/starbucks.jpg",
    menu: [],
  ),
  Restaurant(
    id: "16",
    name: "Hardee's",
    address: "Cairo, Egypt",
    rating: 4.2,
    imageUrl: "https://example.com/hardees.jpg",
    menu: [],
  ),
  Restaurant(
    id: "17",
    name: "Domino's Pizza",
    address: "Alexandria, Egypt",
    rating: 4.3,
    imageUrl: "https://example.com/dominos.jpg",
    menu: [],
  ),
  Restaurant(
    id: "18",
    name: "Chili's",
    address: "Cairo, Egypt",
    rating: 4.5,
    imageUrl: "https://example.com/chilis.jpg",
    menu: [],
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
    price: 5.99,
    additives: [Additive(id: 1, title: "Extra Sauce", price: 0.50)],
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
    price: 22.99,
    additives: [Additive(id: 1, title: "Extra Wasabi", price: 1.00)],
    imageUrl:
        "https://kitchen.sayidaty.net/uploads/small/90/90cf15fca56b0e383c071d4a209af016_w750_h750.jpg",
    time: "40 min",
    category: categories[1],
    version: 2,
  ),
  Food(
    id: "3",
    title: "Lucille's Burger",
    foodTags: ["American", "Grilled", "Juicy"],
    foodType: ["Main Course"],
    code: "41007432",
    isAvailable: true,
    restaurant: restaurants[2],
    rating: 4.7,
    ratingCount: 410,
    description:
        "A thick, juicy beef burger with cheddar cheese and caramelized onions.",
    price: 15.99,
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
    price: 6.99,
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
    price: 7.99,
    additives: [Additive(id: 1, title: "Extra Spice", price: 1.00)],
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
    price: 8.99,
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
    price: 15.99,
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
    price: 22.99,
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
    price: 12.99,
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
    price: 8.99,
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
    price: 5.99,
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
    price: 9.99,
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
    price: 4.99,
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
    price: 12.99,
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
    price: 10.99,
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
    price: 14.99,
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
    price: 12.99,
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
    price: 3.99,
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
    price: 9.99,
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
    price: 8.99,
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
    price: 7.99,
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
    price: 8.50,
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
    price: 18.99,
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
    price: 14.99,
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
    price: 5.99,
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
    price: 9.99,
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
