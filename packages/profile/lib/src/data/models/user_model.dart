import '../../domain/entities/entities.dart';

///
///
///
class UserModel {
  ///
  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  ///
  final int id;

  ///
  final String name;

  ///
  final String email;

  /// Convert model to entity
  User get toEntity => User(
        id: id,
        userName: name,
        email: email,
      );

  /// Factory from map/json
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'],
        name: map['name'],
        email: map['email'],
      );

  /// parse list to List<UserModel> if list is not empty
  static List<UserModel> fromMapList(List? list) {
    if (list == null) return [];
    return list
        .map<UserModel>(
          (el) => UserModel.fromMap(
            Map<String, dynamic>.from(el),
          ),
        )
        .toList();
  }
}
