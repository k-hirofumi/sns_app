import 'package:flutter/material.dart';
import 'package:sns_app/utils/instance_store.dart';
import 'package:sns_app/providers/accountProvider.dart';
import 'package:sns_app/providers/appProvider.dart';
import 'package:sns_app/providers/homeProvider.dart';
import 'package:sns_app/providers/notificationProvider.dart';
import 'package:sns_app/providers/reactionProvider.dart';
import 'package:sns_app/providers/searchProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navigation/main.dart';
import 'navigation/home.dart';
import 'navigation/search.dart';
import 'navigation/reaction.dart';
import 'navigation/notification.dart';
import 'navigation/account.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final store = InstanceStore();
  store.setInstance(await SharedPreferences.getInstance());

  store.setInstance<AppProvider>(AppProvider());
  store.setInstance<HomeProvider>(HomeProvider());
  store.setInstance<SearchProvider>(SearchProvider());
  store.setInstance<NotificationProvider>(NotificationProvider());
  store.setInstance<ReactionProvider>(ReactionProvider());
  store.setInstance<AccountProvider>(AccountProvider());
  
  // store.getInstance<HomeProvider>().loadCount();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: store.getInstance<AppProvider>()),
        ChangeNotifierProvider.value(value: store.getInstance<HomeProvider>()),
        ChangeNotifierProvider.value(value: store.getInstance<SearchProvider>()),
        ChangeNotifierProvider.value(value: store.getInstance<NotificationProvider>()),
        ChangeNotifierProvider.value(value: store.getInstance<ReactionProvider>()),
        ChangeNotifierProvider.value(value: store.getInstance<AccountProvider>()),
      ],
      child: MyApp()
      )
    );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final provider = InstanceStore().getInstance<AppProvider>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MainNav.navigatorKey,
      title: 'SNS',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: (settings) {
        var builder = provider.isLogin ? MainNav.mainRoutes[settings.name]! : MainNav.mainRoutes["/login"]!;

        return MaterialPageRoute(builder: builder,settings: settings);
      },
      // routes: 
      //   MainNav.mainRoutes
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

  final accountProvider = InstanceStore().getInstance<AccountProvider>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await accountProvider.getUserInfo();
    });
  }

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

    const items =  <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: '探す'),
      BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'お知らせ'),
      BottomNavigationBarItem(icon: Icon(Icons.emoji_people), label: '反響'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'マイページ'),
    ];

    return Scaffold(
      body: BottomNavigation(index: _selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: items,
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

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.index});

  final int index;  
  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.expand,
      children: [
        Offstage(
          offstage: index != 0,
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
          offstage: index != 1,
          child: Navigator(
            key: SearchNav.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = SearchNav.searchRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ) ,
        ),
        Offstage(
          offstage: index != 2,
          child: Navigator(
            key: NotificationNav.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = NotificationNav.notificationRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ) ,
        ),
        Offstage(
          offstage: index != 3,
          child: Navigator(
            key: ReactionNav.navigatorKey,
            onGenerateRoute: (settings) {
              var builder = ReactionNav.reactionRoutes[settings.name]!;
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ) ,
        ),
        Offstage(
          offstage: index != 4,
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
