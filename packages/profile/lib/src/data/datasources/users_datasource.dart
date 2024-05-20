import 'package:dependencies/adapters/http/http.dart';

import '../exceptions/exceptions.dart';
import '../models/models.dart';

///
///
///
abstract class IUsersDatasource {
  ///
  Future<List<UserModel>> getList();
}

///
///
///
class UsersDatasource implements IUsersDatasource {
  ///
  UsersDatasource(this._http);

  final HttpAdapter _http;

  @override
  Future<List<UserModel>> getList() async {
    try {
      final result = await _http.get('users');
      final users = UserModel.fromMapList(result);
      return users;
    } catch (e, s) {
      throw UnknowException(message: e.toString(), stackTrace: s);
    }
  }
}
