import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _nameState();
}

class _nameState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Happy Meal"),
      ),
      body: GridView.builder(
        itemCount: 2,
        gridDelegate:
          const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
      //    return Card(child: ListTile(dense: true,title: ,),);
        },
      ),
    );
  }
}
