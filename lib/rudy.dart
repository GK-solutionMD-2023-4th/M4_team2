import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
      title: const Text(''), // 빈 텍스트로 title 비활성화
  leading: Padding(
  padding: const EdgeInsets.only(left: 16.0),
  child: Row(
  children: [
  Icon(
  Icons.arrow_back, // 왼쪽을 가리키는 화살표 아이콘
  color: Colors.black, // 아이콘 색상을 검은색으로 지정
  ),
  const SizedBox(width: 6), // 아이콘과 텍스트 사이의 간격 조절
  Text(
  '메뉴',
  style: TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.black, // 텍스트 색상을 검은색으로 지정
  ),
  ),
  ],
  ),
  ),
  backgroundColor: Colors.transparent, // 투명한 배경 적용
  elevation: 0, // 그림자 효과 비활성화
  ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundedImage(
            이미지 URUg
            width: 40.0 * 4.0, // 가로 크기를 1로 늘림
            height: 3.0 * 140, // 세로 크기를 1로 늘림
            ),
            SizedBox(height: 5),
            RoundedImage(
            이미지 URUg',
            width: 40.0 * 4.0,
            height: 3.0 * 140,
            ),
            SizedBox(height: 5),
            RoundedImage(
            이미지 URUg
            width: 40.0 * 4.0,
            height: 3.0 * 140,
            ),
          ],
        ),
      ),
    ),
  );
}
}
class RoundedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const RoundedImage
      (this.imageUrl, {Key? key, required this.width, required this.height}) :
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0), // Adjust the radius as needed
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover, // Adjust the BoxFit property as needed
        width: width, // 가로 크기 설정
        height: height, // 세로 크기 설정
      ),
    );
  }
}

