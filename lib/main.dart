
import 'package:flutter/material.dart';
import 'package:my_app/instance_store.dart';
import 'package:my_app/providers/accountProvider.dart';
import 'package:my_app/providers/homeProvider.dart';
import 'package:my_app/providers/notificationProvider.dart';
import 'package:my_app/providers/reactionProvider.dart';
import 'package:my_app/providers/searchProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navigation/main.dart';
import 'navigation/home.dart';
import 'navigation/search.dart';
import 'navigation/reaction.dart';
import 'navigation/notification.dart';
import 'navigation/account.dart';
import '../pages/post/post.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final store = InstanceStore();
  store.setInstance(await SharedPreferences.getInstance());

  store.setInstance<HomeProvider>(HomeProvider());
  store.setInstance<SearchProvider>(SearchProvider());
  store.setInstance<NotificationProvider>(NotificationProvider());
  store.setInstance<ReactionProvider>(ReactionProvider());
  store.setInstance<AccountProvider>(AccountProvider());
  
  store.getInstance<HomeProvider>().loadCount();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: store.getInstance<HomeProvider>()),
        ChangeNotifierProvider.value(value: store.getInstance<SearchProvider>()),
        ChangeNotifierProvider.value(value: store.getInstance<NotificationProvider>()),
        ChangeNotifierProvider.value(value: store.getInstance<ReactionProvider>()),
        ChangeNotifierProvider.value(value: store.getInstance<AccountProvider>()),
      ],
      child: MyApp(),
      )
    );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MainNav.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: (settings) {
        var builder = SearchNav.searchRoutes[settings.name]!;
        return MaterialPageRoute(builder: builder,settings: settings);
      },
      routes: 
        MainNav.mainRoutes
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
            HomeNav.backToMain();
            break;
          case 1:
            SearchNav.backToMain();
            break;
          case 2:
            NotificationNav.backToMain();
            break;
          case 3:
            ReactionNav.backToMain();
            break;
          case 4:
            AccountNav.backToMain();
            break;
          default:
        }
      }
      _previousIndex = _selectedIndex;
    });
  }

  Future<void> _showNewPostOrverlay()async{
    MainNav.toNewPostOrverlay(context);
  }

  @override
  Widget build(BuildContext context) {

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
            key: HomeNav.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = HomeNav.homeRoutes[settings.name]!;
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
            key: SearchNav.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = SearchNav.searchRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ) ,
        ),
        Offstage(
          offstage: widget.index != 2,
          child: Navigator(
            key: NotificationNav.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = NotificationNav.notificationRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ) ,
        ),
        Offstage(
          offstage: widget.index != 3,
          child: Navigator(
            key: ReactionNav.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = ReactionNav.reactionRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ) ,
        ),
        Offstage(
          offstage: widget.index != 4,
          child: Navigator(
            key: AccountNav.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = AccountNav.accountRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ) ,
        ),
      ]
    );
  }
}
