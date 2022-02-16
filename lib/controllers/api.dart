import 'package:dio/dio.dart';

class ApiRequest {
  final String? url;

  final Map<String, dynamic>? data;
  ApiRequest({required this.url, this.data});

// ..trader         _S-9yCRjgC08rhEr0r0l  // Streaming wsUbVijl2Pmomdlt2gfw
// currencylayer    80ced12628af6ce3373666e9440a1583

  Dio _dio() {
    return Dio(BaseOptions(headers: {
      'x-ba-key': 'NDZjOGMxOTY0NDlkNGNjOTk1MjBmZTFmYWYxM2M5NDk',
    })); // BaseOptions // Dio
  }

  Future<dynamic> get() async {
    try {
      final response = await _dio().get(url!, queryParameters: data);

      return response.data;
    } catch (error, stacktrace) {
      print('Exception occured: $error with stacktrace: $stacktrace');
      throw Exception('Exception occured: $error with stacktrace: $stacktrace');
    }
  }
}
