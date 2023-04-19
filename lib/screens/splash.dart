import 'dart:async';

import 'package:bloc_test/globals/enum/enum.dart';
import 'package:bloc_test/screens/secScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';
import '../cubit/internet_cubit.dart';

class Splash extends StatelessWidget {
  const Splash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return Text(state.counterValue > 0
                  ? "yay" + state.counterValue.toString()
                  : state.counterValue.toString());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).remove();
                },
                child: (Text("remove")),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).add();
                },
                child: Text("add"),
              )
            ],
          ),
          TextButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SecScreen.routeName),
            child: Text("data"),
          ),
          BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state is InternetConnection) {
                print('${state.type}+"ofek"');
              }
              if (state is InternetConnection &&
                  state.type == ConnectionTypes.wifi) {
                return Text("wifi");
              } else if (state is InternetConnection &&
                  state.type == ConnectionTypes.mobile) {
                return Text("mobile");
              } else if (state is InternetConnection &&
                  state.type == ConnectionTypes.noConnection) {
                return Text("no");
              } else if (state is InternetConnection &&
                  state.type == ConnectionTypes.cantread) {
                return Text("cant read");
              }

              return Container();
            },
          )
        ],
      ),
    );
  }
}
