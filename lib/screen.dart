import 'package:flutter/material.dart';
import 'package:flutter_application_1/search.dart';

class Product {
  final String name;
  final String subtitle;

  final double price;
  int quantity;
  String image;

  Product(
      {required this.name,
      required this.subtitle,
      required this.price,
      required this.image,
      this.quantity = 1});
}

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  var num = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: <Widget>[
              Align(
                child: Image.network(
                  fit: BoxFit.fill,
                  "https://images.pexels.com/photos/10692547/pexels-photo-10692547.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Positioned(
                  top: 60,
                  left: 30,
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      height: 30,
                      width: 30,
                      child: Center(
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: 60,
                  right: 100,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      height: 30,
                      width: 30,
                      child: Center(
                        child: const Icon(
                          Icons.search,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: 60,
                  right: 30,
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      height: 30,
                      width: 30,
                      child: Center(
                        child: const Icon(
                          Icons.share,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ))
            ]),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10, bottom: 0, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Amerika Foods",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Futura Std",
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 207, 206, 206))),
                    height: 30,
                    width: 30,
                    child: const Icon(
                      Icons.favorite_border,
                      size: 15,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "American, Fast Food, Burgers",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Futura Std",
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 15),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customText("4.5"),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    height: 20,
                    child: VerticalDivider(color: Colors.grey, thickness: 0.5),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.sms_outlined,
                    size: 15,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customText("1K+ reviews"),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    height: 20,
                    child: VerticalDivider(color: Colors.grey, thickness: 0.5),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.schedule,
                    size: 15,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customText("15 mins"),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 219, 218, 218),
              ),
            ),
            Container(
              height: 40,
              child: const TabBar(
                isScrollable: true,
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontFamily: "Futura Std",
                    fontWeight: FontWeight.w600),
                tabs: [
                  Text("Recommended"),
                  Text("Combos"),
                  Text("Regular Burgers"),
                  Text("Special Burgers"),
                  Text("Mutton Burgers")
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        var product = _products[index];
                        return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    _products[index].image,
                                    fit: BoxFit.fill,
                                    height: 120,
                                    width: 120,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _products[index].name,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        _products[index].subtitle,
                                        maxLines: 2,
                                        style: TextStyle(
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
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              num = 0;
                                            });
                                          },
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
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(num.toString()),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              num = 1;
                                            });

                                            num == 1
                                                ? showModalBottomSheet<void>(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return SizedBox(
                                                          height: 80,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "1 iteam",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          30,
                                                                      child: VerticalDivider(
                                                                          color: Colors
                                                                              .grey,
                                                                          thickness:
                                                                              1),
                                                                    ),
                                                                    Text(
                                                                      "\₹${_products[index].price.toStringAsFixed(2)}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ],
                                                                ),
                                                                InkWell(
                                                                  child: Container(
                                                                      alignment: Alignment.centerRight,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .green,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      height: 30,
                                                                      width: 100,
                                                                      child: Center(
                                                                        child:
                                                                            Text(
                                                                          "View Cart",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      )),
                                                                )
                                                              ],
                                                            ),
                                                          ));
                                                    })
                                                : Navigator.of(context).pop();
                                          },
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
                      }),
                  Center(
                    child: Text("Combos"),
                  ),
                  Center(
                    child: Text("Regular Burgers"),
                  ),
                  Center(
                    child: Text("Special Burgers"),
                  ),
                  Center(
                    child: Text("Mutton Burgers"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customText(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 12,
          fontFamily: "Futura Std",
          color: Colors.black,
          fontWeight: FontWeight.w600),
    );
  }
}

final List<Product> _products = [
  Product(
    name: 'Chicken Crunch Burger',
    subtitle: 'It is a long established fact that a reader will be distracted.',
    price: 209,
    image:
        "https://www.shutterstock.com/image-photo/classic-hamburger-stock-photo-isolated-600nw-2282033179.jpg",
  ),
  Product(
      name: 'Mighty Chicken Patty Burger',
      subtitle:
          'It is a long established fact that a reader will be distracted.',
      price: 259,
      image:
          "https://images.unsplash.com/photo-1571091718767-18b5b1457add?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGJ1cmdlcnxlbnwwfHwwfHx8MA%3D%3D"),
  Product(
      name: 'Donut Header Chicken',
      subtitle:
          "It is a long established fact that a reader will be distracted.",
      price: 199,
      image:
          "https://www.shutterstock.com/image-photo/classic-hamburger-stock-photo-isolated-600nw-2282033179.jpg"),
];
