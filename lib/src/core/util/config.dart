part of tyba.core.util;

class AppSettings extends InheritedWidget {
  final String appName;
  final bool releaseMode;
  final String projectId;
  final String collectionId;

  AppSettings({
    @required this.appName,
    @required this.releaseMode,
    @required this.projectId,
    @required this.collectionId,
    @required Widget child,
  }) : super(child: child);

  static AppSettings of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppSettings>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
