import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('スマートフォンのサイズ比較'),
        ),
        body: SizeComparison(),
      ),
    );
  }
}

class Phone {
  final String name;
  final double width;
  final double height;

  Phone({
    required this.name,
    required this.width,
    required this.height,
  });
}

class SizeComparison extends StatefulWidget {
  @override
  _SizeComparisonState createState() => _SizeComparisonState();
}

class _SizeComparisonState extends State<SizeComparison> {
  final List<Phone> phones = [
    Phone(name: "Xperia Ace III", height: 140, width: 69),
    Phone(name: "Google Pixel 6a", height: 152.2, width: 71.8),
    Phone(name: "AQUOS sense7", height: 152, width: 70),
    Phone(name: "Zenfone 9", height: 146.5, width: 68.1),
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    widthController.dispose();
    heightController.dispose();
    super.dispose();
  }

  void addPhone() {
    final String name = nameController.text;
    final double width = double.tryParse(widthController.text) ?? 0.0;
    final double height = double.tryParse(heightController.text) ?? 0.0;

    if (name.isNotEmpty && width > 0 && height > 0) {
      setState(() {
        phones.add(Phone(name: name, width: width, height: height));
      });
      nameController.clear();
      widthController.clear();
      heightController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var phone in phones)
              Container(
                width: phone.width,
                height: phone.height,
                color: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: Center(
                  child: Text(
                    '${phone.name}\n${phone.width} x ${phone.height}',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text('新しいスマートフォンを追加'),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'スマートフォン名'),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: widthController,
                decoration: InputDecoration(labelText: '幅 (mm)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: heightController,
                decoration: InputDecoration(labelText: '高さ (mm)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: addPhone,
                child: Text('追加'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
