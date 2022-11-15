
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class HomeRoutes{
    static final homeRoutes = <String,WidgetBuilder>{
    "/" : (context) => HomeScreen(),
    "/home/second" : (context) => NewPost(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigatorState => navigatorKey.currentState!;

}
class SearchRoutes{
    static final searchRoutes = <String,WidgetBuilder>{
    "/" : (context) => SearchScreen(),
    "/search/second" : (context) => NewPost(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigatorState => navigatorKey.currentState!;

}
class NotificationRoutes{
    static final notificationRoutes = <String,WidgetBuilder>{
    "/" : (context) => NotificationScreen(),
    "/notification/second" : (context) => NewPost(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigatorState => navigatorKey.currentState!;
}
class ReactionRoutes{
    static final reactionRoutes = <String,WidgetBuilder>{
    "/" : (context) => ReactionScreen(),
    "/reaction/second" : (context) => NewPost(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigatorState => navigatorKey.currentState!;
}
class AccountRoutes{
    static final accountRoutes = <String,WidgetBuilder>{
    "/" : (context) => AccountScreen(),
    "/account/second" : (context) => NewPost(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigatorState => navigatorKey.currentState!;
}



class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> _rootNavigationKey = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainPage(),
      routes: {
        "/addNewPost" : (_) => NewPost(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();

  }

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;
  int _previousIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;


      if(_previousIndex == _selectedIndex){
        switch (_selectedIndex) {
          case 0:
            HomeRoutes.navigatorKey.currentState!.popUntil(ModalRoute.withName('/'));
            break;
          case 1:
            SearchRoutes.navigatorKey.currentState!.popUntil(ModalRoute.withName('/'));
            break;
          case 2:
            NotificationRoutes.navigatorKey.currentState!.popUntil(ModalRoute.withName('/'));
            break;
          case 3:
            ReactionRoutes.navigatorKey.currentState!.popUntil(ModalRoute.withName('/'));
            break;
          case 4:
            AccountRoutes.navigatorKey.currentState!.popUntil(ModalRoute.withName('/'));
            break;
          default:
        }
      }
      _previousIndex = _selectedIndex;

    });
  }

  // int _previousIndex = 0;

  Future<void> _showNewPostOrverlay()async{
    AppNav.toNewPostOrverlay(context);
  }

  @override
  Widget build(BuildContext context) {

  // Widget _nav =  Stack(
  //     fit: StackFit.expand,
  //     children: [
  //       Offstage(
  //         offstage: _selectedIndex != 0,
  //         child: Navigator(
  //           key: HomeRoutes.navigatorKey,
  //           onGenerateRoute: (settings) {
  //             var builder = HomeRoutes.homeRoutes[settings.name]!;
  //             return MaterialPageRoute(builder: builder,settings: settings);
  //             // if(settings.name == "/"){
  //             //   return MaterialPageRoute(builder: (context) => HomeScreen(),settings: settings);
  //             // }
  //           },
  //         ) ,
  //       ),
  //       Offstage(
  //         offstage: _selectedIndex != 1,
  //         child: Navigator(
  //           key: SearchRoutes.navigatorKey,
  //           onGenerateRoute: (settings) {
  //             var builder = SearchRoutes.searchRoutes[settings.name]!;
  //             return MaterialPageRoute(builder: builder,settings: settings);
  //           },
  //         ) ,
  //       ),
  //       Offstage(
  //         offstage: _selectedIndex != 2,
  //         child: Navigator(
  //           key: NotificationRoutes.navigatorKey,
  //           onGenerateRoute: (settings) {
  //             var builder = NotificationRoutes.notificationRoutes[settings.name]!;
  //             return MaterialPageRoute(builder: builder,settings: settings);
  //           },
  //         ) ,
  //       ),
  //       Offstage(
  //         offstage: _selectedIndex != 3,
  //         child: Navigator(
  //           key: ReactionRoutes.navigatorKey,
  //           onGenerateRoute: (settings) {
  //             var builder = ReactionRoutes.reactionRoutes[settings.name]!;
  //             return MaterialPageRoute(builder: builder,settings: settings);
  //           },
  //         ) ,
  //       ),
  //       Offstage(
  //         offstage: _selectedIndex != 4,
  //         child: Navigator(
  //           key: AccountRoutes.navigatorKey,
  //           onGenerateRoute: (settings) {
  //             var builder = AccountRoutes.accountRoutes[settings.name]!;
  //             return MaterialPageRoute(builder: builder,settings: settings);
  //           },
  //         ) ,
  //       ),
  //     ]
  //   );

  //   _previousIndex = _selectedIndex;

    return Scaffold(
      body: BottomNavigation(index: _selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '探す'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'お知らせ'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_people), label: '反響'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'マイページ'),
        ],
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNewPostOrverlay,
        tooltip: "Create New Post",
        child: Icon(Icons.add_comment),
        ),
    );
  }
}


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, required this.index});

  final int index;  
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Offstage(
          offstage: widget.index != 0,
          child: Navigator(
            key: HomeRoutes.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = HomeRoutes.homeRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
              // if(settings.name == "/"){
              //   return MaterialPageRoute(builder: (context) => HomeScreen(),settings: settings);
              // }
            },
          ) ,
        ),
        Offstage(
          offstage: widget.index != 1,
          child: Navigator(
            key: SearchRoutes.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = SearchRoutes.searchRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ) ,
        ),
        Offstage(
          offstage: widget.index != 2,
          child: Navigator(
            key: NotificationRoutes.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = NotificationRoutes.notificationRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ) ,
        ),
        Offstage(
          offstage: widget.index != 3,
          child: Navigator(
            key: ReactionRoutes.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = ReactionRoutes.reactionRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ) ,
        ),
        Offstage(
          offstage: widget.index != 4,
          child: Navigator(
            key: AccountRoutes.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = AccountRoutes.accountRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ) ,
        ),
      ]
    );
  }
}




class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('アカウント画面', style: TextStyle(fontSize: 32.0))),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> toSearchSecond()async{
      AppNav.toSearchSecondPage(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('探す'),
      ),
      body: SafeArea(
        child: Center(
           child: Column(
            children: [
              Text('探す画面', style: TextStyle(fontSize: 32.0)),
              ElevatedButton(
                onPressed: toSearchSecond, 
                child: Text("次へ"))
            ],
           )
        ),
      ),
    );
  }
}

class ReactionScreen extends StatelessWidget {
  const ReactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('反響'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('反響画面', style: TextStyle(fontSize: 32.0))),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> toHomeSecond()async{
      AppNav.toHomeSecondPage(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: SafeArea(
        child: Center(
           child: Column(
            children: [
              Text('ホーム画面', style: TextStyle(fontSize: 32.0)),
              ElevatedButton(
                onPressed: toHomeSecond, 
                child: Text("次へ"))
            ],
           )
        ),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お知らせ'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('お知らせ画面', style: TextStyle(fontSize: 32.0)),
        ),
      ),
    );
  }
}

class NewPost extends StatelessWidget {
  const NewPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('newpost'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('newpost', style: TextStyle(fontSize: 32.0)),
        ),
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

  static Future<void> toNewPostOrverlay(BuildContext context){
    return Navigator.of(context).pushNamed('/addNewPost');
  }


  
}