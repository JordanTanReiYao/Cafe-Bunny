import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_in_flutter/detailspage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//void main() => runApp(MyMaps());

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

/*
void main() => MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Home(),
    );
*/
class Home extends StatefulWidget {
  @override
  /*State createState() {
    // TODO: implement createState
    return MyMapsState();
  }*/

  MyMapsState createState() => MyMapsState();
}

/*
class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Click button to back to Main Page'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.redAccent,
              child: Text('Back to Main Page'),
              onPressed: () {
                backToMainPage(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void backToMainPage(BuildContext context) {
    Navigator.pop(context);
  }
}
*/
class MyMapsState extends State<Home> {
  final GlobalKey scaffoldKey = GlobalKey();

  Completer _controller = Completer();
  Map<MarkerId, Marker> markers = {};
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(1.3473582957696049, 103.67988893615487),
    zoom: 15,
  );
  List listMarkerIds = List();
  //final MarkerId markerId = MarkerId("current");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future navigateToSubPage(context, Id) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => new DetailsPage(id: Id)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              leading: Icon(Icons.map),
              backgroundColor: Colors.blueAccent,
              title: Text('Cafe Bunny'),
            ),
            body: Container(
              child: GoogleMap(
                initialCameraPosition: _kGooglePlex,
                onTap: (_) {},
                mapType: MapType.normal,
                markers: Set.of(markers.values),
                onMapCreated: (GoogleMapController controler) {
                  _controller.complete(controler);

                  MarkerId markerId1 = MarkerId("1");
                  MarkerId markerId2 = MarkerId("2");
                  MarkerId markerId3 = MarkerId("3");
                  MarkerId markerId4 = MarkerId("4");
                  MarkerId markerId5 = MarkerId("5");
                  MarkerId markerId6 = MarkerId("6");

                  infoWindow:
                  InfoWindow(
                    title: "Name",
                    snippet: "Address",
                  );

                  listMarkerIds.add(markerId1);
                  listMarkerIds.add(markerId2);
                  listMarkerIds.add(markerId3);
                  listMarkerIds.add(markerId4);
                  listMarkerIds.add(markerId5);
                  listMarkerIds.add(markerId6);

                  Marker marker1 = Marker(
                      markerId: markerId1,
                      position: LatLng(1.347247490555711, 103.68013955493038),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                      infoWindow: InfoWindow(
                          title: "Starbucks Coffee",
                          onTap: () {
                            navigateToSubPage(
                                context, int.parse(markerId1.value));
                          },
                          snippet: "Starbucks Coffee"));

                  Marker marker2 = Marker(
                      markerId: markerId2,
                      position: LatLng(1.343443850028537, 103.68260441264627),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                      infoWindow: InfoWindow(
                          title: "Co-op Cafe",
                          onTap: () {
                            navigateToSubPage(
                                context, int.parse(markerId2.value));
                          },
                          snippet: "Co-op Cafe"));

                  Marker marker3 = Marker(
                      markerId: markerId3,
                      position: LatLng(1.3485753685807358, 103.68154414483487),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                      infoWindow: InfoWindow(
                          title: "Connect71 Cafe",
                          onTap: () {
                            navigateToSubPage(
                                context, int.parse(markerId3.value));
                          },
                          snippet: "Connect71 Cafe"));
                  Marker marker4 = Marker(
                      markerId: markerId4,
                      position: LatLng(1.3444128504702417, 103.68061865229984),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                      infoWindow: InfoWindow(
                          title: "The Coffee Bean and Tea Leaf",
                          onTap: () {
                            navigateToSubPage(
                                context, int.parse(markerId4.value));
                          },
                          snippet: "The Coffee Bean and Tea Leaf"));
                  Marker marker5 = Marker(
                      markerId: markerId5,
                      position: LatLng(1.3425510437581258, 103.68032730419245),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                      infoWindow: InfoWindow(
                          title: "Sukho Thai Cafe",
                          onTap: () {
                            //print("VALUE IS " + markerId5.value);
                            navigateToSubPage(
                                context, int.parse(markerId5.value));

                            /*
                            var bottomSheetController =
                                Scaffold.of(scaffoldKey.currentContext)
                                    .showBottomSheet((context) => Container(
                                          child: getBottomSheet(
                                              "1.3425510437581258, 103.68032730419245"),
                                          height: 250,
                                          color: Colors.transparent,
                                        ));*/
                          },
                          snippet: "Sukho Thai Cafe"));
                  Marker marker6 = Marker(
                      markerId: markerId6,
                      position: LatLng(1.3507829936786189, 103.68792908117011),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                      infoWindow: InfoWindow(
                          title: "Cosmo Dining",
                          onTap: () {
                            navigateToSubPage(
                                context, int.parse(markerId6.value));
                          },
                          snippet: "Cosmo Dining"));
                  setState(() {
                    markers[markerId1] = marker1;
                    markers[markerId2] = marker2;
                    markers[markerId3] = marker3;
                    markers[markerId4] = marker4;
                    markers[markerId5] = marker5;
                    markers[markerId6] = marker6;
                  });
                },
              ),
            )));
  }

  Widget getBottomSheet(String s) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 32),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hytech City Public School \n CBSC",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text("4.5",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("970 Folowers",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Memorial Park",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.map,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("$s")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.call,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("040-123456")
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton(
                child: Icon(Icons.navigation), onPressed: () {}),
          ),
        )
      ],
    ));
  }
}
/*
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(1.3521, 103.8198);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
*/

/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyApp extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
