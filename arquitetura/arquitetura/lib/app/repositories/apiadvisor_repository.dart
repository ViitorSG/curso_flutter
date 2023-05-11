import 'package:arquitetura/app/interfaces/client_http_interface.dart';
import 'package:arquitetura/app/models/apiadvisor_model.dart';
import 'package:arquitetura/app/repositories/apiadvisor_repository_interface.dart';

class ApiadvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiadvisorRepository(this.client);

  @override
  Future<ApiadvisorModel> getTime() async {
  var json = await client.get("https://api.openweathermap.org/data/2.5/weather?q=japan&appid=9d72889658c9b8b8772e4e0f05576319");

  ApiadvisorModel model = ApiadvisorModel.fromJson(json[0]);
  return model;
  }
}
