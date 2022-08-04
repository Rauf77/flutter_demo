

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  home: MyAp(),
  debugShowCheckedModeBanner: false,
));
Future<void> _refresh() async {}

class MyAp extends StatefulWidget {
  const MyAp({Key? key}) : super(key: key);

  @override
  State<MyAp> createState() => _MyApState();
}

class _MyApState extends State<MyAp> {
  List land=[
    {
      'image':'https://images.pexels.com/photos/2310651/pexels-photo-2310651.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load',
      'name':'CLOUDS'
    },
    {
      'image':'https://images.pexels.com/photos/3012413/pexels-photo-3012413.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'name':'RIVER'
    },
    {
      'image':'https://images.pexels.com/photos/777211/winter-sunset-purple-sky-777211.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load',
      'name':'SKY'
    },
    {
      'image':'https://images.pexels.com/photos/1482296/pexels-photo-1482296.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load',
      'name':'MOUNTAIN'
    },
    {
      'image':'https://images.pexels.com/photos/2301975/pexels-photo-2301975.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load',
      'name':'SEA'
    },
    {
      'image':'https://images.pexels.com/photos/1544376/pexels-photo-1544376.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load',
      'name':'ISLAND'
    },
    {
      'image':'https://images.pexels.com/photos/1487763/pexels-photo-1487763.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load',
      'name':'LAND'
    },
  ];
  @override

  final drawerItems = ListView(
    children: <Widget>[
      UserAccountsDrawerHeader(

        accountName: Text("GT 77"),
        accountEmail: Text('gt77@gmail.com'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider('https://dragonball.guru/wp-content/uploads/2021/01/goku-dragon-ball-guru.jpg'),
        ),
        otherAccountsPictures: <Widget>[
          CircleAvatar(
            child: Text('A'),
            backgroundColor: Colors.yellow,
          ),
          CircleAvatar(
            child: Text('B'),
            backgroundColor: Colors.red,
          )
        ],
      ),

      ListTile(
        title: Row(
          children: [
            Icon(Icons.favorite_border,color: Colors.black,),
            SizedBox(width: 10,),
            Text('Favourite',style: TextStyle(color: Colors.black),),
          ],
        ),

      ),
      ListTile(
        title: Row(
          children: [
            Icon(Icons.settings,color: Colors.black,),
            SizedBox(width: 10,),
            Text('Settings',style: TextStyle(color: Colors.black),),
          ],
        ),
        //onTap: () => Navigator.of(context).push(_NewPage(2)),
      ),
      ListTile(
        title: Text('other drawer item'),
        // onTap: () {},
      ),
    ],
  );

  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: drawerItems,
          backgroundColor: Colors.white,
        ),

        body: Container(

          child: RefreshIndicator(
            onRefresh: _refresh,
            color: Colors.black,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('EARTH',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 7,
                  ),
                  ),
                  elevation: 0,
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  expandedHeight: h/4,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                   background: Image(image: CachedNetworkImageProvider(
                       'https://images.pexels.com/photos/2775196/pexels-photo-2775196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
                   ),
                   fit: BoxFit.cover,
                   ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider('https://dragonball.guru/wp-content/uploads/2021/01/goku-dragon-ball-guru.jpg'),
                      ),
                    ),

                  ],

                ),
                buildImage(),



              ],
            ),
          ),
        ),




      ),
    );
  }

 Widget buildImage() {
    var hi=MediaQuery.of(context).size.height;
    var wi=MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: GridView.builder(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
          primary: false,
          shrinkWrap: true,
          itemCount: land.length,
          itemBuilder: (context,index){
            final list =land;
            return Container(
              padding: EdgeInsets.only(top: 10),
              height: hi/5,
              width: wi/2,
              decoration: BoxDecoration(
                image: DecorationImage(image: CachedNetworkImageProvider(land[index]['image']),
                fit: BoxFit.cover,

                )
              ),
              child: Center(
                  child: Text(
                      land[index]['name'],
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 3
                  ),
                  )),
            );

          }),
    );
 }





}
