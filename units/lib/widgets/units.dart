
import 'package:flutter/material.dart';
import 'package:nedzananitakalani_220002027/routes/routes.dart';

class Units extends StatelessWidget {
  const Units({super.key, required this.map});
  final Map<String, dynamic> map;

  set username(String username) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //the card contains information about the objects of json data
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'My TPG316C Units',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Image.network('${map['image']}'),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${map['unit']}',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${map['concepts']}',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${map['definition']}',
                style: const TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),

              //the button will redirect the user to the next page which is the secondPage
              ElevatedButton(
                child: const Text('Select one Unit'),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManager.secondPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
