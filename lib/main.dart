
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> _navkey = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
    return  CupertinoApp(
      // navigatorKey: ,
      home: MyHomePage(title:'my_app'),
      routes: 
        {
          '/second': (context) => SecondPage(),
        },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }
  // Future<void> toScecondPage() async {
  //   Navigator.of(context).pushNamed('/second');
  // }

  @override
  Widget build(BuildContext context) {


    return  CupertinoPageScaffold(
      navigationBar:  const CupertinoNavigationBar(
        middle: Text('home'),
        ),
      child: SafeArea(
        child: Center(
          child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Conte1(),
               ElevatedButton(
                onPressed: (() => AppNav.toSecondPage(context)), 
                child: const Text("SecondPage"),
              )
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         const Text(
    //           'You have pushed the button this many times:',
    //         ),
    //         Text(
    //           '$_counter',
    //           style: Theme.of(context).textTheme.headline4,
    //         ),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}

class Conte1 extends StatelessWidget {
  const Conte1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.grey,
      child: Text('aaaaa'),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:  const CupertinoNavigationBar(
        middle: Text('second'),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Conte1(),
                Text("secondpage")
              ],
            )
          )
        ),
    );
  }
}


class AppNav {

  static Future<void> toSecondPage(BuildContext context){
    return Navigator.of(context).pushNamed('/second');
  }
}