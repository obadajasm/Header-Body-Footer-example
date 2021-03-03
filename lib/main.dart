import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class QRoute extends ChangeNotifier with WidgetsBindingObserver {
  String currentRoute = "";

  @override
  Future<bool> didPushRouteInformation(
      RouteInformation routeInformation) async {
    _handel(routeInformation.location);
    return true;
  }

  @override
  Future<bool> didPushRoute(String route) async {
    _handel(route);
    return true;
  }

  @override
  Future<bool> didPopRoute() async {
    print('didPopRoute');
    return true;
  }

  void _handel(String route) {
    if (currentRoute == route) {
      return;
    }
    currentRoute = route;
    notifyListeners();
  }

  void updateRoute() {
    print('Update route to $currentRoute');
    SystemNavigator.routeInformationUpdated(
      location: currentRoute,
      state: null,
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final route = QRoute();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(route);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TestProvider(route));
  }
}

class TestProvider extends StatefulWidget {
  final QRoute route;
  TestProvider(this.route);
  @override
  _TestProviderState createState() => _TestProviderState();
}

class _TestProviderState extends State<TestProvider> {
  String route = "";
  var index = 0;
  @override
  void initState() {
    super.initState();
    widget.route.addListener(() {
      setState(() {
        route = widget.route.currentRoute;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          TextButton(
              onPressed: () {
                route = '/${index++}';
                widget.route.currentRoute = route;
                widget.route.updateRoute();
                setState(() {});
              },
              child: Text('Update')),
          Text(route)
        ],
      )),
    );
  }
}
