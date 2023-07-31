import 'package:c_pm/Screens/HomePage.dart';
import 'package:c_pm/Screens/WelcomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

List<Widget> pages = [const WelcomePage(), const HomePage()];

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Stack(
          children: [
            pages[1],
            Dismissible(
              direction: DismissDirection.up,
              key: UniqueKey(),
              onDismissed: (_) {
                pages[0] = Container();
              },
              child: pages[0],
            )
          ],
        ));
  }
}
