import 'package:flutter/material.dart';
import 'package:my_api/api/my_api.dart';
import 'package:my_api/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<MainModel>? theResponse;
  TextEditingController theText = TextEditingController();
  bool theVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 40.0,
                width: 350.0,
                child: TextField(
                  controller: theText,
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    labelText: "IP",
                    labelStyle: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  theResponse = getRequest(theText.text);
                  setState(
                    () {
                      theVisible = true;
                    },
                  );
                },
                child: const Text(
                  "Go!",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              Visibility(
                visible: theVisible,
                child: FutureBuilder(
                  future: theResponse,
                  builder: (BuildContext context,
                      AsyncSnapshot<MainModel> snapshot) {
                    if (!(snapshot.hasData)) {
                      return const CircularProgressIndicator();
                    }
                    return theResponse == null
                        ? const Text("Cant load the data")
                        : Center(
                            child: Text(
                              "Ip:${snapshot.data!.ip}\nCity:${snapshot.data!.city}\nRegion:${snapshot.data!.region}\nOrg:${snapshot.data!.org}\nTimeZone:${snapshot.data!.timeZone}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
