import 'package:arquitetura/app/pages/home/components/custom_switch_widget.dart';
import 'package:arquitetura/app/pages/home/home_controller.dart';
import 'package:arquitetura/app/repositories/apiadvisor_repository.dart';
import 'package:arquitetura/app/sevices/client_http_service.dart';
import 'package:arquitetura/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../models/apiadvisor_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(
    ApiadvisorViewModel(
      ApiadvisorRepository(
        ClientHttpService(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.account_circle),
        onPressed: () {
          controller.getTime();
        },
      ),
      body: Center(
        child: Column(
          children: [
            CustomSwitchWidget(),
            ValueListenableBuilder<ApiadvisorModel>(
                valueListenable: controller.time,
                builder: (context, model, child) {
                  if (model.description == null) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return Text(model.description!);
                })
          ],
        ),
      ),
    );
  }
}
