import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: NinjaCard(),
      debugShowCheckedModeBanner: false,
    ));

class NinjaCard extends StatelessWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("VALORANT ID"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
                child: CircleAvatar(
              backgroundImage: AssetImage("assets/phoenix.jpg"),
              radius: 50.0,
            )),
            Divider(
              height: 90.0,
              color: Colors.grey[800],
            ),
            const Text(
              "USERNAME",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            // Put a empty box between two widgets
            Text(
              "TheMaster",
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "TAG",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            // Put a empty box between two widgets
            Text(
              "6024",
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "RANK",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            // Put a empty box between two widgets
            Text(
              "RADIANT",
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text("valo@themaster.co",
                    style: TextStyle(
                      letterSpacing: 1.5,
                      color: Colors.grey[400],
                      fontSize: 18,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
