import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        toolbarHeight: 20,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            settingsAndNotifications(),
            balanceAndAddMoney(),
            Expanded(child: cardMenu(itemHeight, itemWidth)),
            virtualCard(),
            earnRewards(),
          ],
        ),
      ),
    );
  }

  Widget settingsAndNotifications() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: SvgPicture.asset('assets/settings.svg')),
          SvgPicture.asset('assets/line.svg'),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SvgPicture.asset('assets/notify.svg'),
          )
        ],
      ),
    );
  }

  Widget balanceAndAddMoney() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 35, 0, 0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/naira.svg'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text("0",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/hide.svg'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text("Hide Balance",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(92, 92, 92, 1))),
                    ),
                  ],
                ),
              ],
            )),
            Container(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Container(
                  height: 30,
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(22, 124, 128, 0.14)),
                  child: Text(
                    "Add Money",
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Color.fromRGBO(22, 124, 128, 1)),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget cardMenu(double height, double width) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: CustomScrollView(
        slivers: [
          SliverGrid.count(
            mainAxisSpacing: 4,
            crossAxisCount: 2,
            childAspectRatio: (width/height)*2.2,
            children: [
              gridItem("Request Money", 'assets/barterIcon.svg',
                  Color.fromRGBO(255, 231, 236, 1)),
              gridItem("Send Money", 'assets/barterIcon.svg',
                  Color.fromRGBO(255,242,221,1)),
              gridItem("Buy Airtime", 'assets/airtime.svg',
                  Color.fromRGBO(223, 233, 234, 1)),
              gridItem("Pay Bills", 'assets/bills.svg',
                  Color.fromRGBO(228, 234, 255, 1))
            ],
          )
        ],
      ),
    );
  }

  Widget gridItem(String title, String icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.fromLTRB(7.5, 0, 7.5, 14),
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
            child: SvgPicture.asset(icon),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(51, 51, 51, 1))),
          ),
        ],
      ),
    );
  }

  Widget virtualCard() {
    return Container();
  }

  Widget earnRewards() {
    return Container();
  }
}
