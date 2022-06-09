import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
          title: Text('Menu App'),
          centerTitle: true,
          leading: Container(
            padding: EdgeInsets.only(top: 17.0,left: 10.0),
            child: Text(DateFormat.Hm().format(DateTime.now()),
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
          ),
            
          ),
          bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.local_dining_rounded),
                text: "Food",
              ),
              Tab(
                icon: Icon(Icons.local_drink_rounded),
                text: "Drink",)
            ]),
        ),
        body: TabBarView(
          children: [
            FoodTile(),
            DrinkTile()
          ],
        ),
        ),
        
      ),
     
    );
  }
}

class FoodTile extends StatelessWidget {
  FoodTile({
    Key? key,
  }) : super(key: key);

  final List<String> NameList =['Nasi Goreng','Mie Goreng','Seblak','Siomay','Capcay'];
  final List<String> ImageList = ['assets/nasgor.jpg','assets/mie goreng.jpg','assets/seblak.jpg','assets/siomay.jpg','assets/capcay.jpg'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: NameList.length,
      itemBuilder: (BuildContext context, int index){
          return ListTile(
            contentPadding: EdgeInsets.only(top: 10.0,left: 15.0),
            title: Text(NameList[index]),
            leading: Image.asset(ImageList[index],
              cacheHeight: 80,
              cacheWidth: 120,
            ),
            trailing: Favorite(),
          );
      },
       
      
    );
  }
}

class DrinkTile extends StatelessWidget {
  DrinkTile({
    Key? key,
  }) : super(key: key);

  final List<String> NameList =['Es Teh', 'Es Jeruk', 'Es Kopi', 'Es Greentea', 'Es Soda Gembira'];
  final List<String> ImageList = ['assets/es teh.jpg','assets/es jeruk.jpg','assets/es kopi.jpg','assets/es greentea.jpg','assets/soda gembira.jpg'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: NameList.length,
      itemBuilder: (BuildContext context, int index){
          return ListTile(
            contentPadding: EdgeInsets.only(top: 10.0,left: 15.0),
            title: Text(NameList[index]),
            leading: Image.asset(ImageList[index],
              cacheHeight: 80,
              cacheWidth: 120,
            ),
            trailing: Favorite(),
          );
      },
       
      
    );
  }
}

class Favorite extends StatefulWidget {
  const Favorite({ Key? key }) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,),
      onPressed: () {
        setState(() {
          if (isFavorite == false){
            isFavorite = true;
          }
          else {
            isFavorite=false;
          }
        });
      },
    );
  }
}