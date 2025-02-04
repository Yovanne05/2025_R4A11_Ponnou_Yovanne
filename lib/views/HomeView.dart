import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/CustomCounter.dart';
import 'package:counter_app/core/constants/constants.dart';

class HomeView extends StatelessWidget {
  CustomCounter customCounter = CustomCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Image.asset('assets/logo.png', height: 40),
              ),
              const SizedBox(width: 10),
              const Text(appTitle),
            ],
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[customCounter],
        ),
      ),
    );
  }
}

