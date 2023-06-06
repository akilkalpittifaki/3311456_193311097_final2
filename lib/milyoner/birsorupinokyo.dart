import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Birsorupinokyo extends StatefulWidget {
  const Birsorupinokyo({Key? key}) : super(key: key);

  @override
  State<Birsorupinokyo> createState() => _BirsorupinokyoState();
}

class _BirsorupinokyoState extends State<Birsorupinokyo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("??????????"),
      ),
      body: SlidingUpPanel(
        backdropEnabled: true, //darken background if panel is open
        color: Colors
            .transparent, //necessary if you have rounded corners for panel
        /// panel itself
        panel: Container(
          decoration: const BoxDecoration(
            // background color of panel
            color: Colors.redAccent,
            // rounded corners of panel
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              BarIndicator(),
              Center(
                child: Text(
                  "\n Ben yalancıyım diyen doğru mu söylüyor yalan mı???",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),

        /// header of panel while collapsed
        collapsed: Container(
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            children: const [
              BarIndicator(),
              Center(
                child: Text(
                  "Soru",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        /// widget behind panel
        body: Center(
            child: Column(children: [
          Image.asset("assets/images/pin.jpg"),
          const Text(
            "Soru Aşağıdaki panelde :)",
            style: TextStyle(fontSize: 18),
          ),
        ])

            // child: Text(  "Ben yalancıyım diyen doğru mu söylüyor yoksa yalan mı?",   ),
            ),
      ),
    );
  }
}

class BarIndicator extends StatelessWidget {
  const BarIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: 40,
        height: 3,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
