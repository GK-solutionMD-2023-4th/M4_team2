import 'package:cake/order.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                      height: MediaQuery.of(context).size.height / 2.5,
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
                          Padding(
                            padding: EdgeInsets.only(left: 10),
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
                      padding: EdgeInsets.only(left: 20, top: 325),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            child: Text(
                              "설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명",
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Material(
                  color: Colors.white,
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: const Color.fromARGB(255, 189, 189, 189),
                    tabs: [
                      Tab(text: '홈'),
                      Tab(text: '피드'),
                      Tab(text: '리뷰'),
                      Tab(text: '가게 정보'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
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
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: TextButton(
                              onPressed: () {

                              },
                              child: Row(
                                children: [
                                  Text(
                                    "메뉴",
                                    style: TextStyle(
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
                          padding: EdgeInsets.only(left: 5, top: 10),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
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
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: TextButton(
                              onPressed: () {

                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Size",
                                    style: TextStyle(
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
                          padding: EdgeInsets.only(left: 5, top: 10),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
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
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: TextButton(
                              onPressed: () {

                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Test",
                                    style: TextStyle(
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
                          padding: EdgeInsets.only(left: 5, top: 10),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 195, 195, 195),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
        label: FittedBox(
          child: Text(
            '이 가게 주문하기',
            style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 115, 157, 1),
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
