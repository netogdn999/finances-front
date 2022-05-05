<h1 align="center">
 Navigator - Customer Experience
</h1>

> This module holds the navigator logic

<div align="center">
  <a href="https://github.com/facily-tech/cxp-social-commerce-frontend">Customer Experience repo</a>
  ·
  <a href="https://github.com/facily-tech/cxp-social-commerce-frontend/issues/new?assignees=&labels=bug&template=01_BUG_REPORT.md&title=bug%3A+">Report a Bug</a>
  ·
  <a href="https://github.com/facily-tech/cxp-social-commerce-frontend/issues/new?assignees=&labels=enhancement&template=02_FEATURE_REQUEST.md&title=feat%3A+">Request a Feature</a>
  .
  <a href="https://github.com/facily-tech/cxp-social-commerce-frontend/discussions">Ask a Question</a>
</div>



## About

> This module performs the navigation between screens and modules, whether it is a going or going navigation. It is also possible to pass parameters in the navigation.

## Installation

> Add the module to your pubspec.yaml under dependencies like so:
  ```dart
  navigator:
    path: ../navigator
  ```


## Usage
> 
<details>
  <summary>How to use</summary>

First insert a key in the enum, localized in the file `navigator_names.dart` in the module core, that represents the module and/or the page. If it's already there, you don't need to add it again.

```dart
enum NavigatorModule { pageBuilder, sample }

enum NavigatorRoute { home, registration, confirm }
```

For better organization, create an abstract class containing an array type attribute with all the routes of this module. Each route must be of type FacilyRoute, like the example below:

```dart
abstract class SampleAppRoutes {
  static Iterable<FacilyRoute> routes = [homeRoute, registrationRoute];

  static final homeRoute = FacilyRoute(
    route: NavigatorRoute.home,
    module: NavigatorModule.sample,
    child: (NavigatorPageState state) => Sample(),
    visible: (NavigatorPageState routerState) => true,
  );

  static final registrationRoute = FacilyRoute(
    route: NavigatorRoute.registration,
    module: NavigatorModule.sample,
    child: (NavigatorPageState state) => const Registration(),
    visible: (NavigatorPageState routerState) =>
        routerState.route == NavigatorRoute.registration,
  );
}
```

- route: key of the enum that represents the page declared in the step above;
- module: enum key that represents the module declared in the step above;
- child: Widget that will be rendered as a page;
- visible: Boolean value that will indicate whether the page will be displayed or not.

We must create a class that will be our route manager, it must extend the `RouteManager` class

```dart
class SampleRouter extends RouteManager<NavigatorRoute> {
  SampleRouter({Key? key})
      : super(
          initialRoute: NavigatorRoute.home,
          routes: SampleAppRoutes.routes,
          key: key,
        );
}
```

- initialRoutes: initial route to the module;
- routes: list containing the routes declared in the step above
- routeFixed (optional): boolean that indicates whether the module have a fixed route

In the main project, a list of Routers must be defined to be passed to FacilyNavigator. The FacilyNavigator must be called in main project:

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  List<RouteManager<NavigatorRoute>> get listModules => [
    PageBuilderRouter(), 
    SampleRouter(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Shell( 
        child: FacilyNavigator<NavigatorModule, NavigatorRoute>(
          initialModule: NavigatorModule.pageBuilder,
          initialRoute: NavigatorRoute.registration,
          routeManagerList: listModules,
        ),
      ),
    );
  }
}
```
- initialModule: the first module to be displayed
- initialRoute: the first page of the initialModule to be displayed
- routeManagerList: the list of routes declared above

To navigate, we can do it in several ways:
- Navigation to another module, where we pass which module we want to go to, which page (optional) and params (optional):

```dart
//navigating keeping stack of modules
navigatorAction.navigateToModule(module: NavigatorModule.sample);
//navigating cleaning stack of modules
navigatorAction.navigateToModuleReplace(module: NavigatorModule.sample);
```
- Navigation to another page in the same module, where we pass which page we want to go and params (optional)

```dart
//navigating keeping stack of pages
navigatorAction.navigateToPage(NavigatorRoute.home);
//navigating cleaning stack of pages (normally used for module with fixed route)
navigatorAction.navigateToPageReplace(NavigatorRoute.home);
```

- Navigation to previous page
```dart
navigatorAction.navigatorPopPage();
```

  
</details>
<br />

## Stack & Tech

- [Flutter](https://flutter.dev/)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)

## Contributing

Please, read our section labeled **How to submit a Pull Request** on our [CONTRIBUTING.md](https://github.com/facily-tech/cxp-social-commerce-frontend/blob/develop/docs/CONTRIBUTING.md#How-to-submit-a-Pull-Request) file.

### Running tests

<!-- Add here any additional prerequisite to run tests on this module like running generators on changing any code, if needed -->

Run

```sh
flutter test
```

## License

Facily. All rights reserved.
