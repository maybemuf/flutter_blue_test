import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_test/features/blue/blocs/blue/blue_cubit.dart';
import 'package:flutter_blue_test/features/blue/repositories/blue_repository.dart';
import 'package:flutter_blue_test/features/blue/screens/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          BlueCubit(context.read<BlueRepository>())..init(),
        ),
      ],
      child: MaterialApp(
        title: 'BluetoothLE Task',
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
