import 'package:arquitetura/app/interfaces/client_http_interface.dart';
import 'package:dio/dio.dart';

class ClientHttpService implements IClientHttp {

  final Dio dio = Dio();


  @override
  void addToken(String token) {}

  Future<Map<String, dynamic>> get(String url) async {
    var response = await dio.get(url);
    return response.data;
  }

}