part of tyba.core.data.models;

class ProfileModel extends BaseModel {
  Api _api = locator<Api>();

  dynamic connectedUser = {};
  List<dynamic> logs = [];

  void init(String id) async {
    final user = await _api.me();
    connectedUser = {
      'name': user.displayName,
      'email': user.email,
    };
    final response = await db
        .collection('tyba-tech')
        .document(id)
        .collection('logs')
        .where('user', isEqualTo: user.uid)
        .getDocuments();
    logs.addAll(response.documents ?? []);
    setState(ViewState.Idle);
  }
}
