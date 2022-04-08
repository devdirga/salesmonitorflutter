import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/entry_screen.dart';
import 'package:flutter_application_1/screens/list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chicken',
      theme: ThemeData(primaryColor: Colors.black, backgroundColor: Colors.black),
      home: DefaultTabController(
        length: 2, 
        child: Scaffold(          
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              color: Colors.blueGrey[400],
              child: new SafeArea(
                child: Column(
                  children: <Widget>[
                    new Expanded(child: new Container()),
                    new TabBar(
                      labelColor: Colors.white,
                      indicatorColor: Colors.black,
                      tabs: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.add_chart_rounded)
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.list_alt )
                        )
                      ]
                    )
                  ]
                )
              )
            )
          ),
          body:  TabBarView(
            children: <Widget> [
              EntryScreen(),
              ListScreen()
            ]
          )
        )
      )
    );
  }
}
