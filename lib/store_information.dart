import 'package:cake/order.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
    return 200.0;
  }

  Widget buildContainer() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 195, 195, 195),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget buildOption(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Image.asset('assets/images/chevron-right.png'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildContainer(),
                        const SizedBox(width: 5),
                        buildContainer(),
                        const SizedBox(width: 5),
                        buildContainer(),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildContainer(),
                        const SizedBox(width: 5),
                        buildContainer(),
                        const SizedBox(width: 5),
                        buildContainer(),
                      ],
                    ),
                  ],
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
    return MaterialApp(
      title: 'Cake',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 270),
                      child: Row(
                        children: [
                          const Text(
                            "Cake Store",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.asset('assets/images/Star.png'),
                          ),
                          const Text(
                            "4.75",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 325),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            child: const Text(
                              "설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명",
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Material(
                  color: Colors.white,
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Color.fromARGB(255, 189, 189, 189),
                    tabs: [
                      Tab(text: '홈'),
                      Tab(text: '피드'),
                      Tab(text: '리뷰'),
                      Tab(text: '가게 정보'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      buildOption("메뉴", context),
                      const SizedBox(height: 5),
                      buildOption("Size", context),
                      const SizedBox(height: 5),
                      buildOption("Taste", context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              child: Builder(
                builder: (context) => FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderPage()),
                    );
                  },
                  label: const FittedBox(
                    child: Text(
                      '이 가게 주문하기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  backgroundColor: const Color.fromRGBO(255, 115, 157, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5.0,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
