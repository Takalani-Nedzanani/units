
import 'package:flutter/material.dart';
import 'package:nedzananitakalani_220002027/models/units_data.dart';
import 'package:nedzananitakalani_220002027/routes/routes.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController usernameControler = TextEditingController();

  @override
  void dispose() {
    usernameControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Unit No'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 103, 155, 245),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              //the textfield will prompt the user to enter a unit number for your notes(the notes which you want to explore on)
              child: TextField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                controller: usernameControler,
                decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(),
                    labelText: 'Enter a unit number for your notes'),
              ),
            ),
            // the button will then use the data which was passed on the textfield to iterate to where the user wants to go.
            ElevatedButton(
              onPressed: () {
                context.read<UnitsData>().username = usernameControler.text;
                Navigator.of(context).pushNamed(RouteManager.homePage);
              },
              child: const Text('go to selected notes'),
            )
          ],
        ),
      ),
    );
  }
}
