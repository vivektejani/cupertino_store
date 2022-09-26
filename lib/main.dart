import 'package:flutter/cupertino.dart';
import 'Search_page.dart';
import 'package:cupertino_store/Product_page.dart';
import 'package:cupertino_store/cart_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List tabs = [
    const ProductsPage(),
    const SearchPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "Products"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart), label: "Cart"),
            ],
          ),
          tabBuilder: (context, i) {
            return tabs[i];
          },
        ),
      ),
    );
  }
}
