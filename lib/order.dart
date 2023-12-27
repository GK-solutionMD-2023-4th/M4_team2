import 'package:flutter/material.dart';

class Cake extends StatelessWidget {
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

  final List<int> menuPrices = [4500, 5000, 5300, 6100, 6200, 7400];

  final List<String> sizeItems = [
    '1호',
    '3호',
    '5호',
  ];

  final List<int> menuSize = [3000, 5000, 7000];

  final List<String> tasteItems = [
    '초코 필링',
    '망고 필링',
    '스트로베리 필링',
  ];

  final List<int> tasteSize = [2000, 3500, 5500];

  String formatCurrency(int value) {
    return '${value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => "${m[1]},",
    )}₩';
  }

  double UI_optimization(BuildContext context) {
    const iPhoneSE3 = {"Width": 375, "Height": 667};
    const iPhone15Pro = {"Width": 393, "Height": 852};
    const iPhone15ProMax = {"Width": 430, "Height": 932};

    if (MediaQuery.of(context).size.width <= (iPhoneSE3["Width"] ?? 0) && MediaQuery.of(context).size.height <= (iPhoneSE3["Height"] ?? 0)) {
      // iPhone SE 3rd Generation
      return 312.0;

    } else if (MediaQuery.of(context).size.width <= (iPhone15Pro["Width"] ?? 0) && MediaQuery.of(context).size.height <= (iPhone15Pro["Height"] ?? 0)) {
      // iPhone 15 Pro
      return 341.0;

    } else if (MediaQuery.of(context).size.width >= (iPhone15ProMax["Width"] ?? 0) && MediaQuery.of(context).size.height >= (iPhone15ProMax["Height"] ?? 0)) {
      // iPhone 15 Pro Max
      return 357.0;
    }
    return 0.0;
  }

  Widget buildMenuSelector() {
    return Wrap(
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
          child: buildMenuItem(index),
        );
      }),
    );
  }

  Widget buildMenuItem(int index) {
    return Column(
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 222, 222),
            borderRadius: BorderRadius.circular(15),
            boxShadow: isSelected[index]
                ? [
                    const BoxShadow(
                      color: Color.fromRGBO(255, 115, 157, 1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    )
                  ]
                : [],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(menuItems[index]),
        ),
        Text(
          "+${formatCurrency(menuPrices[index])}",
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 147, 147, 147),
          ),
        ),
      ],
    );
  }

  Widget buildSizeSelector() {
    return Wrap(
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
          child: buildSizeItem(index),
        );
      }),
    );
  }

  Widget buildSizeItem(int index) {
    return Column(
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 222, 222, 222),
            borderRadius: BorderRadius.circular(15),
            boxShadow: isSelectedSize[index]
                ? [
                    const BoxShadow(
                      color: Color.fromRGBO(255, 115, 157, 1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    )
                  ]
                : [],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(sizeItems[index]),
        ),
        Text(
          "+${formatCurrency(menuSize[index])}",
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 147, 147, 147),
          ),
        ),
      ],
    );
  }

  Widget buildTasteSelector() {
    return Wrap(
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
          child: buildTasteItem(index),
        );
      }),
    );
  }

  Widget buildTasteItem(int index) {
    return Column(
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 222, 222),
            borderRadius: BorderRadius.circular(15),
            boxShadow: isSelectedTaste[index]
                ? [
                    const BoxShadow(
                      color: Color.fromRGBO(255, 115, 157, 1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    )
                  ]
                : [],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(tasteItems[index]),
        ),
        Text(
          "+${formatCurrency(tasteSize[index])}",
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 147, 147, 147),
          ),
        ),
      ],
    );
  }

  Widget buildSelectedInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, top: 20),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 115, 157, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              "$value",
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTotalInfo(String label, int value) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 115, 157, 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "$label",
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "+${formatCurrency(value)}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 109, 109, 109),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                  height: UI_optimization(context),
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
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Padding(
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
              ],
            ),
            buildSelectedInfo("Menu", menu),

            const SizedBox(height: 20),

            buildMenuSelector(),

            buildSelectedInfo("Size", size),

            const SizedBox(height: 20),

            buildSizeSelector(),

            buildSelectedInfo("Taste", taste),

            const SizedBox(height: 20),

            buildTasteSelector(),

            const SizedBox(height: 40),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            const SizedBox(height: 20),

            buildTotalInfo("Menu", price),

            const SizedBox(height: 25),

            buildTotalInfo("Size", sizePrice),

            const SizedBox(height: 25),

            buildTotalInfo("Taste", tastePrice),

            const SizedBox(height: 40),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),

            const SizedBox(height: 20),
            Row(
              children: [
            const SizedBox(width: 25),
              const Text(
                      "TOTAL",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
            const SizedBox(width: 233),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                formatCurrency(price + sizePrice + tastePrice),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
              ],
            ),
            const SizedBox(height: 20),
            buildPaymentButton(() {
              
            }),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentButton(VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(255, 115, 157, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Container(
          height: 50,
          child: const Center(
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
    );
  }
}
