import 'package:flutter/material.dart';
import './presentation/blood_donation_icons.dart';
import './donormodel.dart';
import './Widgets/LoginPage.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class MyHome extends StatelessWidget {
  void _onTileClicked() {
    print("tapped on container");
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Blood Donation';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
        ),
        backgroundColor: Colors.white,
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onTap: () {
                debugPrint('onTap clicked');

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              }, // handle your image tap here
              child: Image.asset(
                'images/searchblooddonor@2x.png',
                fit: BoxFit.cover, // this is the solution for border
                width: 110.0,
                height: 110.0,
              ),
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onTap: () {}, // handle your image tap here
              child: Image.asset(
                'images/myrequest.png',
                fit: BoxFit.cover, // this is the solution for border
                width: 110.0,
                height: 110.0,
              ),
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onTap: () {}, // handle your image tap here
              child: Image.asset(
                'images/thalassemia@2x.png',
                fit: BoxFit.cover, // this is the solution for border
                width: 110.0,
                height: 110.0,
              ),
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onTap: () {}, // handle your image tap here
              child: Image.asset(
                'images/bloodrequest.png',
                fit: BoxFit.cover, // this is the solution for border
                width: 110.0,
                height: 110.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _gridView() {
  return GridView.count(
    primary: false,
    padding: const EdgeInsets.all(20),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    crossAxisCount: 2,
    children: <Widget>[
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text("He'd have you all unravel at the"),
        color: Colors.teal[100],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Heed not the rabble'),
        color: Colors.teal[200],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Sound of screams but the'),
        color: Colors.teal[300],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Who scream'),
        color: Colors.teal[400],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Revolution is coming...'),
        color: Colors.teal[500],
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Revolution, they...'),
        color: Colors.teal[600],
      ),
    ],
  );
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blood Donors")),
      body: ListView.builder(
        itemCount: DonorModel.dummyData.length,
        itemBuilder: (context, index) {
          DonorModel _model = DonorModel.dummyData[index];
          return Column(
            children: <Widget>[
              Divider(
                height: 12.0,
              ),
              ListTile(
                  leading: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(_model.avatarUrl),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(_model.name),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        _model.datetime,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text(_model.message),
                  trailing: Icon(
                    Icons.play_arrow,
                  )),
            ],
          );
        },
      ),
    );
  }
}
