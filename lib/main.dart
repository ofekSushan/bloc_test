import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubit(),
        )
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.Isadded == true)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("nice"),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                if (state.Isadded == false)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("bad"),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
              },
              builder: (context, state) {
                return Text(state.counterValue.toString());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).remove();
                  },
                  child: (Text("remove")),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).add();
                  },
                  child: Text("add"),
                )
              ],
            ),
          ],
        ),
      ),
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
