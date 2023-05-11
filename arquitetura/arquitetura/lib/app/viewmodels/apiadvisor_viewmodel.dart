import 'package:arquitetura/app/models/apiadvisor_model.dart';
import 'package:arquitetura/app/repositories/apiadvisor_repository_interface.dart';
import 'package:flutter/material.dart';

class ApiadvisorViewModel {
  final IApiAdvisor repository;
  final apiadvisorModel = ValueNotifier<ApiadvisorModel>(null!);

  ApiadvisorViewModel(this.repository);

  fill() async {

    apiadvisorModel.value = await repository.getTime();

  }

}