import 'package:app_5/cubit/app_cubit_logics.dart';
import 'package:app_5/cubit/app_cubits.dart';
import 'package:app_5/pages/detail_page.dart';
import 'package:app_5/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(data: DataServices()),
        child: AppCubitLogics(),
      ),
    );
  }
}
