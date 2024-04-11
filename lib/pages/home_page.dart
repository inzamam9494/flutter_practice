import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.black, width: 5),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                  offset: Offset(4, 4), color: Colors.black.withOpacity(0.5)),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 50,
                  width: 50,
                  color: Colors.green,
                  child: Container(
                    // margin: EdgeInsets.all(5),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
