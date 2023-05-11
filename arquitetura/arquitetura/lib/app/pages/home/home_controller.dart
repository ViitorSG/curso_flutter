import 'package:arquitetura/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../models/apiadvisor_model.dart';

class HomeController {

  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiadvisorModel> get time => viewModel.apiadvisorModel;


  getTime() {
    viewModel.fill();
  }


}