import 'package:flutter/material.dart';
import 'package:shopping_app/details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0, //avoiding shadow
          backgroundColor: Colors.grey[200],
          leading: Image.asset("lib/assets/images/hamburger.png"),
          actions: [
            Container(
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                margin: EdgeInsets.all(10),
                child: Image.asset("lib/assets/images/SEARCH.png"))
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 20)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildBottomNav(Icons.home, isSelected: true),
                buildBottomNav(Icons.card_travel),
                buildBottomNav(Icons.shop_sharp),
                buildBottomNav(Icons.account_balance),
                buildBottomNav(Icons.person),
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Shop ",
                  style: TextStyle(fontSize: 26),
                ),
                Text(
                  "Application",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      letterSpacing: 1),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildElevatedButton("Home Decor", isSelected: true),
                BuildElevatedButton("Bath & Body", isSelected: false),
                BuildElevatedButton("Beauty", isSelected: false),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        boxShadow: [
                          const BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 20)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buldItemColumn("Candles", isSelected: true),
                            buldItemColumn("Decor"),
                            buldItemColumn("Floral"),
                            buldItemColumn("Tables"),
                            buldItemColumn("Stuff"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                         CardWidget(),

                        SizedBox(
                          height: 10,
                        ),
                        LineBar(),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Holiday Special",
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                "View All",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              bottomCardDetails(),
                              bottomCardDetails(),
                              bottomCardDetails(),
                              bottomCardDetails(),
                            ],
                          ),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  Container buildBottomNav(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.pink[100] : Colors.white,
        shape: BoxShape.circle,
      ),
      height: 50,
      width: 50,
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }

  Container bottomCardDetails() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 150,
      width: 250,
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("lib/assets/images/candel3.jpg")),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Coconut Milk Bath"),
              Row(
                children: [Icon(Icons.shopping_bag), Text("12")],
              ),
              Text("\$ 30"),
            ],
          ),
        )
      ]),
    );
  }

  Column buldItemColumn(String text, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(color: isSelected ? Colors.black : Colors.grey),
        ),
        SizedBox(
          height: 5,
        ),
        isSelected
            ? Container(
                height: 5,
                width: 5,
                decoration:
                    BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              )
            : SizedBox()
      ],
    );
  }

  ElevatedButton BuildElevatedButton(String text, {bool isSelected = false}) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18, color: isSelected ? Colors.white : Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        primary: isSelected ? Colors.pink[100] : Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}

class LineBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        height: 5,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildColumnForCard("1", "Elemntal Tin Candel", "29.0", context),
          buildColumnForCard("2", "Winter Candle", "30.0", context),
          buildColumnForCard("3", "Summer Candle", "25.0", context),
          buildColumnForCard("4", "Seasonable Candle", "35.0", context),
        ],
      ),
    );
  }
}

GestureDetector buildColumnForCard(
    String img, String title, String price, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return DetailsPage(image: img,title: title,price: price,context: context,);
      }));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              height: 220,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "lib/assets/images/candel$img.jpg",
                  fit: BoxFit.cover,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Text(title),
          SizedBox(
            height: 10,
          ),
          Text(
            "\$ $price",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    ),
  );
}
