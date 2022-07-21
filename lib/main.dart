import 'package:drinking_water/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dringking today'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  List<bool> drink = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  get mainPage {
    return GridView.builder(
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
          mainAxisSpacing: 40,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              drink[index] = true;
              setState(() {});
            },
            child: Lottie.asset(
              animate: drink[index],
              repeat: false,
              width: 100,
              height: 150,
              'assets/lottie/glass_water.json',
            ),
          );
        });
  }

  get myPage {
    return SafeArea(
      child: Column(
        children: [
          ListTile(
            title: Icon(
              Icons.local_drink,
              color: Colors.blue[500],
            ),
            leading: const Text(
              '2022-07-21',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
            Container(
              margin: EdgeInsets.all(30),
              child: mainPage,
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: myPage,
            ),
          ]),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
