import 'dart:convert';
import 'package:dio/dio.dart';
import '../utils/constant_api.dart';

class ApiService {
  final String baseUrl = ConstantApi.baseUrlEndPoint;
  final Dio _dio = Dio(); // Create a Dio instance

  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
  }

  Future<List<dynamic>> fetchTasks({int page = 1, int limit = 10}) async {
    try {
      final response = await _dio.get('/todos', queryParameters: {'_page': page, '_limit': limit});
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to load tasks: ${e.message}');
    }
  }

  Future<void> addTask(Map<String, dynamic> task) async {
    try {
      await _dio.post('/todos', data: json.encode(task));
    } on DioException catch (e) {
      throw Exception('Failed to add task: ${e.message}');
    }
  }

  Future<void> updateTask(int id, Map<String, dynamic> task) async {
    try {
      await _dio.put('/todos/$id', data: json.encode(task));
    } on DioException catch (e) {
      throw Exception('Failed to update task: ${e.message}');
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await _dio.delete('/todos/$id');
    } on DioException catch (e) {
      throw Exception('Failed to delete task: ${e.message}');
    }
  }
}



//import 'package:http/http.dart' as http;
// class ApiService {
//   final String baseUrl = 'https://jsonplaceholder.typicode.com';
//
//   Future<List<dynamic>> fetchTasks({int page = 1, int limit = 10}) async {
//     final response = await http.get(Uri.parse('$baseUrl/todos?_page=$page&_limit=$limit'));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load tasks');
//     }
//   }
//
//
//   Future<void> addTask(Map<String, dynamic> task) async {
//     await http.post(
//       Uri.parse('$baseUrl/todos'),
//       headers: {'Content-Type': 'application/json; charset=UTF-8'},
//       body: json.encode(task),
//     );
//   }
//
//   Future<void> updateTask(int id, Map<String, dynamic> task) async {
//     await http.put(
//       Uri.parse('$baseUrl/todos/$id'),
//       headers: {'Content-Type': 'application/json; charset=UTF-8'},
//       body: json.encode(task),
//     );
//   }
//
//   Future<void> deleteTask(int id) async {
//     await http.delete(Uri.parse('$baseUrl/todos/$id'));
//   }
// }
