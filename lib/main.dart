import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newapp/ui/CardsPage.dart';
import 'package:newapp/ui/HomePage.dart';
import 'package:newapp/ui/MorePage.dart';
import 'package:newapp/ui/TransactionsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  AppContent createState() => AppContent();
}

class AppContent extends State<MyApp> {
  int currentIndex = 0;
  List<Widget> pageList = [
    HomePage(),
    CardsPage(),
    TransactionsPage(),
    MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.black),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black45,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/home.svg'), label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/cards.svg'), label: "Cards"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/transactions.svg'),
                label: "Transactions"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/more.svg'), label: "More")
          ],
          onTap: (index) => onTapped(index, pageController),
        ),
        body: PageView(
          controller: pageController,
          children: pageList,
        ),
      ),
    );
  }

  void onTapped(int index, PageController pageController) {
    setState(() {
      currentIndex = index;
      pageController.jumpToPage(currentIndex);
    });
  }
}
