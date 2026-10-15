import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task/Model/usermodel.dart';


class UserService {
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}