part of tyba.core.util;

Future<bool> checkPermission() async {
  PermissionHandler permission = PermissionHandler();
  PermissionStatus status =
      await permission.checkPermissionStatus(PermissionGroup.location);
  return status == PermissionStatus.granted;
}

bool validateEmail(TextEditingController controller) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (controller.text.isNotEmpty && !regex.hasMatch(controller.text))
    return false;
  else
    return true;
}

void loadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 120.0,
              height: 120.0,
              child: FlareActor(
                "assets/anims/loading_food.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: 'Untitled',
              ),
            ),
          ],
        ),
      );
    },
  );
}
