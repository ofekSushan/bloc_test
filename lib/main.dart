import 'dart:async';

import 'package:bloc_test/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';
import 'screens/SecScreen.dart';
import 'screens/splash.dart';

void main() {
  runApp(MyApp(
    connection: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connection;

  const MyApp({super.key, required this.connection});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connection),
        ),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const Splash(),
        SecScreen.routeName: (context) => const SecScreen(),
      },
    );
  }
}



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CounterCubit(),
//       child: MaterialApp(),
//     );
//   }
// }
