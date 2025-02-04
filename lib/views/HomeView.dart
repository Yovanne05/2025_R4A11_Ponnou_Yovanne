import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/CustomCounter.dart';
import 'package:counter_app/core/constants/constants.dart';
import '../viewmodels/CounterViewModel.dart';

class HomeView extends StatelessWidget {
  CustomCounter customCounter = CustomCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CounterViewModel>(
        builder: (context, viewModel, child){
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[customCounter],
              ),
            );
        },

      )

    );
  }
}

