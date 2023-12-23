import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen.dart';

class Product {
  final String name;
  final String subtitle;

  final double price;
  final String image;

  Product(
      {required this.name,
      required this.subtitle,
      required this.price,
      required this.image});
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> items = [
    "Chicken Crunch Burger",
    'Mighty Chicken Patty Burger',
    'Donut Header Chicken',
  ];
  List<String> filteredItems = [];
  @override
  void initState() {
    super.initState();
    filteredItems = items;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(searchTerm))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50.0, right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenPage()),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hoverColor: Color.fromARGB(105, 82, 82, 80),
                        hintText: "Search",
                        suffixIcon: Icon(
                          Icons.mic,
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins",
                            color: Color.fromARGB(105, 82, 82, 80),
                            fontWeight: FontWeight.w600)),
                  ),
                )
              ],
            ),
          ),
          const Text("Search Recommendations"),
          const SizedBox(
            height: 10,
          ),
          _searchController.text.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                _products[index].image,
                                fit: BoxFit.fill,
                                height: 120,
                                width: 120,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  filteredItems[index],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 150,
                                  child: Text(
                                    _products[index].subtitle,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\₹${_products[index].price.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                width: 1,
                                                color: const Color.fromARGB(
                                                    255, 207, 206, 206))),
                                        height: 30,
                                        width: 30,
                                        child: const Icon(
                                          Icons.remove,
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("0"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                width: 1,
                                                color: const Color.fromARGB(
                                                    255, 207, 206, 206))),
                                        height: 30,
                                        width: 30,
                                        child: const Icon(
                                          Icons.add,
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ));
                  },
                ))
              : Wrap(
                  children: [
                    textsearch("Burgers"),
                    textsearch("Chicken"),
                    textsearch("fries"),
                    textsearch("Beverages"),
                    textsearch("Sides"),
                    textsearch("Desserts")
                  ],
                )
        ],
      ),
    ));
  }

  Widget textsearch(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 70,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.green, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        height: 25,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 184, 238, 187),
        ),
      ),
    );
  }
}

final List<Product> _products = [
  Product(
    name: 'Chicken Crunch Burger',
    subtitle: 'It is a long established fact that a reader will be distracted.',
    price: 209,
    image: "assets/images/burger.jpg",
  ),
  Product(
    name: 'Mighty Chicken Patty Burger',
    subtitle: 'It is a long established fact that a reader will be distracted.',
    price: 259,
    image: 'assets/images/burger.jpg',
  ),
  Product(
    name: 'Donut Header Chicken',
    subtitle: "It is a long established fact that a reader will be distracted.",
    price: 199,
    image: 'assets/images/burger.jpg',
  ),
];
