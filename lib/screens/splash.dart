import 'dart:async';

import 'package:bloc_test/cubit/english_cubit.dart';
import 'package:bloc_test/globals/enum/enum.dart';
import 'package:bloc_test/screens/secScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';
import '../cubit/internet_cubit.dart';

class Splash extends StatefulWidget {
  const Splash({
    super.key,
  });

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final textController = TextEditingController(text: "");

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
              return Text(state.counterValue > 0
                  ? "yay" + state.counterValue.toString()
                  : state.counterValue.toString());
            },
          ),
          Builder(builder: (context) {
            final counterstate = context.watch<CounterCubit>().state;
            final englishstate = context.watch<EnglishCubit>().state;

            return Text('test     ' +
                counterstate.counterValue.toString() +
                "    english     " +
                String.fromCharCode(
                  englishstate.englishValue,
                ));
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                child: (Text("remove")),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: Text("add"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<EnglishCubit>(context).decrement();
                },
                child: (Text("english remove")),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<EnglishCubit>(context).increment();
                },
                child: Text("english add"),
              )
            ],
          ),
          SizedBox(
            width: 200,
            child: TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]+')),
              ],
              controller: textController,
              maxLength: 1,
              style: TextStyle(
                fontSize: 14,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'new english letter',
              ),
            ),
          ),
          TextButton(
              child: Text("confirm letter"),
              onPressed: () {
                BlocProvider.of<EnglishCubit>(context)
                    .ChangeLetter(textController.text.codeUnitAt(0));
              }),
          TextButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SecScreen.routeName),
            child: Text("next screen"),
          ),
          // BlocBuilder<InternetCubit, InternetState>(
          //   builder: (context, state) {
          //     if (state is InternetConnection) {
          //       print('${state.type}+"ofek"');
          //     }
          //     if (state is InternetConnection &&
          //         state.type == ConnectionTypes.wifi) {
          //       return Text("wifi");
          //     } else if (state is InternetConnection &&
          //         state.type == ConnectionTypes.mobile) {
          //       return Text("mobile");
          //     } else if (state is InternetConnection &&
          //         state.type == ConnectionTypes.noConnection) {
          //       return Text("no");
          //     } else if (state is InternetConnection &&
          //         state.type == ConnectionTypes.cantread) {
          //       return Text("cant read");
          //     }

          //     return Container();
          //   },
          // )
        ],
      ),
    );
  }
}
