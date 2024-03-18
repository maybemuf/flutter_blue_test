import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_test/application.dart';
import 'package:flutter_blue_test/features/blue/repositories/blue_repository.dart';

void main() {
  runApp(
    RepositoryProvider<BlueRepository>(
      create: (BuildContext context) => BlueRepositoryImpl(),
      child: const Application(),
    ),
  );
}
