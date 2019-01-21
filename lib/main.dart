import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Grid view',
      home: Home(),
            ),);
      
      class Home extends StatefulWidget{
        @override
        _HomeState createSate() => new _HomeState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home>{

  List<Container> drafterAlbum = List();

  var album = [
    {"title":"Festivus", "image":"test1.jpg"},
    {"title":"Awful Swim", "image":"test2.jpg"},
    {"title":"Supremeky", "image":"test3.jpg"},
    {"title":"Feminin Energy", "image":"test4.jpg"},
    {"title":"Hive Mind", "image":"test5.jpg"},
    // {"title":"Festivus", "image":"test1.jpg"},
    // {"title":"Awful Swim", "image":"test2.jpg"},
    // {"title":"Supremeky", "image":"test3.jpg"},
    // {"title":"Feminin Energy", "image":"test4.jpg"},
    // {"title":"Hive Mind", "image":"test5.jpg"},
    // {"title":"Festivus", "image":"test1.jpg"},
    // {"title":"Awful Swim", "image":"test2.jpg"},
    // {"title":"Supremeky", "image":"test3.jpg"},
    // {"title":"Feminin Energy", "image":"test4.jpg"},
    // {"title":"Hive Mind", "image":"test5.jpg"},
    // {"title":"Festivus", "image":"test1.jpg"},
    // {"title":"Awful Swim", "image":"test2.jpg"},
    // {"title":"Supremeky", "image":"test3.jpg"},
    // {"title":"Feminin Energy", "image":"test4.jpg"},
    // {"title":"Hive Mind", "image":"test5.jpg"},
    // {"title":"Festivus", "image":"test1.jpg"},
    // {"title":"Awful Swim", "image":"test2.jpg"},
    // {"title":"Supremeky", "image":"test3.jpg"},
    // {"title":"Feminin Energy", "image":"test4.jpg"},
    // {"title":"Hive Mind", "image":"test5.jpg"},
  ];

  _buatlist()async{
    for(var i = 0; i < album.length; i++){

      final albums = album[i];
      final String image = albums["image"];

      drafterAlbum.add(
        Container(
          child: Padding(

            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Container(
                child: OverflowBox(
                  maxHeight: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                    child: Column(
                      children: <Widget>[
                        Stack(children: <Widget>[
                        Hero(
                          tag: albums["title"],
                          child: Material(
                            child: InkWell(
                              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context)=> Detail(title: albums['title'], image: image,),
                              )),
                              child: Image.asset("img/$image", fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Text(albums["title"], style: TextStyle(fontSize: 18.0,color: Colors.white),),
                        ],)
                      ],
                    ),),
                            ),
                ),
              ),
          ),
        )
          );
    }
  }

  @override
  void initState(){
    _buatlist();
    super.initState();
  }

        @override
        Widget build(BuildContext context){
          return Scaffold(
            appBar: AppBar(
              title: Text("Albums", style: TextStyle(color: Colors.white, fontSize: 12.0)),
            ),
            body: GridView.count(
              crossAxisCount: 3,
              children: drafterAlbum,
            ),
          );
        }
}
class Detail extends StatelessWidget {
  Detail({this.title, this.image});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: ListView(
      children: <Widget>[
        Container(
          height: 240.0,
          child: Hero(
            tag: title,
            child: Material(
              child: InkWell(
                child: Image.asset("img/$image", fit: BoxFit.cover),
              ),
            ) ,
            ),
        ),
        AlbumTitle(title)
      ],
    ),);
  }
}