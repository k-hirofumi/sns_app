
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
      // routes: 
      //   {
      //     '/second': (context) => SecondPage(),
      //   },
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

      return SafeArea(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search_circle_fill),
                label: 'Explore',
              ),
            ],
          ),
          tabBuilder:  (BuildContext context, int index) { 
            switch(index){
              case 0:
                return             
                  CupertinoTabView(
                  routes: 
                    {
                      '/home/second': (context) => SecondPage(),
                    },
                  builder: (BuildContext context) {
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
                                onPressed: (() => AppNav.toHomeSecondPage(context)), 
                                child: const Text("home_SecondPage"),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              case 1:
                return             
                  CupertinoTabView(
                  routes: 
                    {
                      '/search/second': (context) => SecondPage(),
                    },
                  builder: (BuildContext context) {
                    return  CupertinoPageScaffold(
                      navigationBar:  const CupertinoNavigationBar(
                        middle: Text('search'),
                        ),
                      child: SafeArea(
                        child: Center(
                          child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Conte1(),
                               ElevatedButton(
                                onPressed: (() => AppNav.toSearchSecondPage(context)), 
                                child: const Text("search_SecondPage"),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
            }
            throw "Invalid tab";
          },
        ),
      );
    // return  CupertinoPageScaffold(
    //   navigationBar:  const CupertinoNavigationBar(
    //     middle: Text('home'),
    //     ),
    //   child: SafeArea(
    //     child: Center(
    //       child: Column(
    //       // mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //            Conte1(),
    //            ElevatedButton(
    //             onPressed: (() => AppNav.toSecondPage(context)), 
    //             child: const Text("SecondPage"),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
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

  static Future<void> toHomeSecondPage(BuildContext context){
    return Navigator.of(context).pushNamed('/home/second');
  }

  static Future<void> toSearchSecondPage(BuildContext context){
    return Navigator.of(context).pushNamed('/search/second');
  }

  
}