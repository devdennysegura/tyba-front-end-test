part of tyba.ui;

const String initialRoute = "/";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => RootPage(title: ''));
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'signin':
        return MaterialPageRoute(builder: (_) => SignInView());
      case 'signup':
        return MaterialPageRoute(builder: (_) => SignUpView());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'profile':
        return MaterialPageRoute(builder: (_) => ProfileView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
