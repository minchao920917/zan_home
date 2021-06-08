import 'package:flutter/material.dart';
import '../pages/Home/home.dart';
import '../pages/Login/login.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "爱赞家",
      debugShowCheckedModeBanner: false,
      home: new PageLogin(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return new MyCustomRoute(
              builder: (_) => new PageLogin(),
              settings: settings,
            );

          case '/home':
            return new MyCustomRoute(
              builder: (_) => new MyHomePage(),
              settings: settings,
            );
        }
      },
    ));
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // if (settings.arguments) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}