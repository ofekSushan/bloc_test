import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class SecScreen extends StatelessWidget {
  const SecScreen({
    super.key,
  });

  static const routeName = "/SecScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterCubit, CounterState>(
            listener: (context, state) {
              if (state.wasIncremented == true)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("nice"),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              if (state.wasIncremented == false)
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
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                child: (Text("rrr")),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: Text("aaa"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
