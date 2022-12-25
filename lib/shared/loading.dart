import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {






    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.deepOrangeAccent,
          size: 50.0,
        ),
      ),
    );
  }
}
