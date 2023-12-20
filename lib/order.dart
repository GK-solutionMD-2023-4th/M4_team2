import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderPage(),
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var menu = "선택한 메뉴가 없습니다.";
  var price = 0;
  var size = "선택한 사이즈가 없습니다.";
  var sizePrice = 0;
  var taste = "선택한 테이스트가 없습니다.";
  var tastePrice = 0;

  List<bool> isSelected = List.generate(6, (index) => false);
  List<bool> isSelectedSize = List.generate(3, (index) => false);
  List<bool> isSelectedTaste = List.generate(3, (index) => false);

  final List<String> menuItems = [
    'Cake 1',
    'Cake 2',
    'Cake 3',
    'Cake 4',
    'Cake 5',
    'Cake 6',
  ];

  final List<int> menuPrices = [10, 20, 30, 40, 50, 1000];

  final List<String> sizeItems = [
    '1호',
    '3호',
    '5호',
  ];

  final List<int> menuSize = [10, 20, 30];

  final List<String> tasteItems = [
    '초코 필링',
    '망고 필링',
    '스트로베리 필링',
  ];

  final List<int> tasteSize = [10, 20, 30];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/cake_store.png'),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 327,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.0),
                        Colors.white.withOpacity(1.0),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 270),
                  child: Row(
                    children: [
                      Text(
                        "Cake Store",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 23, top: 340),
                  child: Row(
                    children: [
                      Text(
                        "Menu: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 115, 157, 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "$menu",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List<Widget>.generate(menuItems.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = List.generate(6, (i) => i == index);
                      menu = menuItems[index];
                      price = menuPrices[index];
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 222, 222, 222),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: isSelected[index]
                              ? [
                                  BoxShadow(
                                    color: Color.fromRGBO(255, 115, 157, 1),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  )
                                ]
                              : [],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(menuItems[index]),
                      ),
                      Text("\$${menuPrices[index]}"),
                    ],
                  ),
                );
              }),
            ),

            Padding(
              padding: EdgeInsets.only(left: 23, top: 20),
              child: Row(
                children: [
                  Text(
                    "Size: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 115, 157, 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "$size",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List<Widget>.generate(sizeItems.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedSize = List.generate(3, (i) => i == index);
                      size = sizeItems[index];
                      sizePrice = menuSize[index];
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 222, 222, 222),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: isSelectedSize[index]
                              ? [
                                  BoxShadow(
                                    color: Color.fromRGBO(255, 115, 157, 1),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  )
                                ]
                              : [],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(sizeItems[index]),
                      ),
                      Text("\$${menuSize[index]}"),
                    ],
                  ),
                );
              }),
            ),

            Padding(
              padding: EdgeInsets.only(left: 23, top: 20),
              child: Row(
                children: [
                  Text(
                    "Taste: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 115, 157, 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "$taste",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List<Widget>.generate(tasteItems.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedTaste = List.generate(3, (i) => i == index);
                      taste = tasteItems[index];
                      tastePrice = tasteSize[index];
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 222, 222, 222),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: isSelectedTaste[index]
                              ? [
                                  BoxShadow(
                                    color: Color.fromRGBO(255, 115, 157, 1),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  )
                                ]
                              : [],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(tasteItems[index]),
                      ),
                      Text("\$${tasteSize[index]}"),
                    ],
                  ),
                );
              }),
            ),

            SizedBox(height: 40),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 115, 157, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "$menu",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "\$${price}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 115, 157, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "$size",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "\$${sizePrice}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 115, 157, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "$taste",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "\$${tastePrice}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 40),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "TOTAL",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "\$${(price + sizePrice + tastePrice).toStringAsFixed(2).replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  // 버튼 클릭 시 동작 추가
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 115, 157, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      '결제 하기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
