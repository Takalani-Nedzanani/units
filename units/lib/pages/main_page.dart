
import 'package:flutter/material.dart';
import 'package:nedzananitakalani_220002027/models/units_data.dart';
import 'package:nedzananitakalani_220002027/routes/routes.dart';
import 'package:nedzananitakalani_220002027/widgets/units.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    context.read<UnitsData>().fetchData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Reflections'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 103, 155, 245),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<UnitsData>().fetchData;
        },
        child: Center(
          child: Consumer<UnitsData>(
            builder: (context, value, child) {
              return value.map.length == 0 && !value.error
                  ? const CircularProgressIndicator()
                  : value.error
                      ? Text(
                          'Oops, something went wrong. ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )
                      // below is the if statement that contains the data on which is passed from the textfield of the second_page that if the user enters '1' the button should iterate the user to unit 1 only (should display unit 1 objects of json data only ) and goes for other units as well.
                      : value.username == "5"
                          ? const Text(
                              "The unit number entered does not exist!")
                          : value.username == "1"
                              ? ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return Units(map: value.map["Specs"][0]);
                                  })
                              : value.username == "2"
                                  ? ListView.builder(
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return Units(
                                            map: value.map["Specs"][1]);
                                      })
                                  : value.username == "3"
                                      ? ListView.builder(
                                          itemCount: 1,
                                          itemBuilder: (context, index) {
                                            return Units(
                                                map: value.map["Specs"][2]);
                                          })
                                      : value.username == "4"
                                          ? ListView.builder(
                                              itemCount: 1,
                                              itemBuilder: (context, index) {
                                                return Units(
                                                    map: value.map["Specs"][3]);
                                              })
                                          : ListView.builder(
                                              itemCount:
                                                  value.map['Specs'].length,
                                              itemBuilder: (context, index) {
                                                return Units(
                                                    map: value.map['Specs']
                                                        [index]);
                                              },
                                            );
            },
            child: ElevatedButton(
              child: const Text('Select one Unit'),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManager.secondPage);
              },
            ),
          ),
        ),
      ),
    );
  }
}
