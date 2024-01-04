import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CakeInformation {
  final List<String> menuItems;
  final List<int> menuPrices;
  final List<String> sizeItems;
  final List<int> sizePrices;
  final List<String> tasteItems;
  final List<int> tastePrices;

  CakeInformation({
    required this.menuItems,
    required this.menuPrices,
    required this.sizeItems,
    required this.sizePrices,
    required this.tasteItems,
    required this.tastePrices,
  });

  factory CakeInformation.fromJson(Map<String, dynamic> jsonData) {
    return CakeInformation(
      menuItems: List<String>.from(jsonData['Cake_Menu']),
      menuPrices: List<int>.from(jsonData['Cake_Menu_Price']),
      sizeItems: List<String>.from(jsonData['Cake_Size']),
      sizePrices: List<int>.from(jsonData['Cake_Size_Price']),
      tasteItems: List<String>.from(jsonData['Taste']),
      tastePrices: List<int>.from(jsonData['Taste_Price']),
    );
  }

  static Future<CakeInformation> loadFromJsonFile(String path) async {
    String jsonString = await rootBundle.loadString(path);
    Map<String, dynamic> jsonData = json.decode(jsonString);
    return CakeInformation.fromJson(jsonData);
  }
}

void main() {
  runApp(MaterialApp(
    home: OrderPage(),
  ));
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late CakeInformation cakeInformation;
  var menu = "선택한 메뉴가 없습니다.";
  var price = 0;
  var size = "선택한 사이즈가 없습니다.";
  var sizePrice = 0;
  var taste = "선택한 테이스트가 없습니다.";
  var tastePrice = 0;

  List<int> selectedMenuIndices = [];
  List<int> selectedSizeIndices = [];
  List<int> selectedTasteIndices = [];

  late Future<CakeInformation> futureData;

  @override
  void initState() {
    super.initState();
    futureData = CakeInformation.loadFromJsonFile('assets/cake_information.json');
    loadCakeInformation();
  }

  double UI_optimization(BuildContext context) {
    const iPhoneSE3 = {"Width": 375, "Height": 667};
    const iPhone15Pro = {"Width": 393, "Height": 852};
    const iPhone15ProMax = {"Width": 430, "Height": 932};

    if (MediaQuery.of(context).size.width <= (iPhoneSE3["Width"] ?? 0) &&
        MediaQuery.of(context).size.height <= (iPhoneSE3["Height"] ?? 0)) {
      return 312.0;
    } else if (MediaQuery.of(context).size.width <= (iPhone15Pro["Width"] ?? 0) &&
        MediaQuery.of(context).size.height <= (iPhone15Pro["Height"] ?? 0)) {
      return 341.0;
    } else if (MediaQuery.of(context).size.width >= (iPhone15ProMax["Width"] ?? 0) &&
        MediaQuery.of(context).size.height >= (iPhone15ProMax["Height"] ?? 0)) {
      return 357.0;
    }
    return 0.0;
  }

  Future<void> loadCakeInformation() async {
    try {
      cakeInformation = await futureData;
      setState(() {
        menu = cakeInformation.menuItems[selectedMenuIndices.first];
        price = cakeInformation.menuPrices[selectedMenuIndices.first];
        size = cakeInformation.sizeItems[selectedSizeIndices.first];
        sizePrice = cakeInformation.sizePrices[selectedSizeIndices.first];
        taste = cakeInformation.tasteItems[selectedTasteIndices.first];
        tastePrice = cakeInformation.tastePrices[selectedTasteIndices.first];
      });
    } catch (e) {
      print("Error loading JSON file: $e");
      // 에러 처리 로직 추가
    }
  }

  String formatCurrency(int value) {
    return '${value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => "${m[1]},",
    )}₩';
  }

  Widget buildSelector(
      List<int> selectedIndices, List<String> items, List<int> prices, ValueChanged<int> onChanged) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List<Widget>.generate(items.length, (index) {
        return GestureDetector(
          onTap: () {
            onChanged(index);
          },
          child: Column(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 222, 222, 222),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: selectedIndices.contains(index)
                      ? [
                          const BoxShadow(
                            color:  Color.fromRGBO(255, 115, 157, 1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          )
                        ]
                      : [],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(items[index]),
              ),
              Text(
                "+${formatCurrency(prices[index])}",
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 147, 147, 147),
                ),
              ),
            ],
          ),
        );
      }),
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
              color: const Color.fromRGBO(255, 115, 157, 10),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CakeInformation>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SingleChildScrollView(
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
                  buildSelector(selectedMenuIndices, cakeInformation.menuItems, cakeInformation.menuPrices, (index) {
                    setState(() {
                      selectedMenuIndices = [index];
                      menu = cakeInformation.menuItems[index];
                      price = cakeInformation.menuPrices[index];
                    });
                  }),
                  buildSelectedInfo("Size", size),
                  const SizedBox(height: 20),
                  buildSelector(selectedSizeIndices, cakeInformation.sizeItems, cakeInformation.sizePrices, (index) {
                    setState(() {
                      selectedSizeIndices = [index];
                      size = cakeInformation.sizeItems[index];
                      sizePrice = cakeInformation.sizePrices[index];
                    });
                  }),
                  buildSelectedInfo("Taste", taste),
                  const SizedBox(height: 20),
                  buildSelector(selectedTasteIndices, cakeInformation.tasteItems, cakeInformation.tastePrices, (index) {
                    setState(() {
                      selectedTasteIndices = [index];
                      taste = cakeInformation.tasteItems[index];
                      tastePrice = cakeInformation.tastePrices[index];
                    });
                  }),
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            formatCurrency(price + sizePrice + tastePrice),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  buildPaymentButton(() {
                    Navigator.pushNamed(context, '/payment');
                  }),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
