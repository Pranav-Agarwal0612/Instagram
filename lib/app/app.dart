import 'package:clone_app/screens/wrapper.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      initialRoute: '/',
      routes: {
        '/' : (context) => Wrapper(),
      },
    );
  }
}
