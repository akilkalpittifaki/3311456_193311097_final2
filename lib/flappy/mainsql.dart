import "package:flutter/material.dart";
import 'package:sqflite/sqflite.dart';
import '../models/dog.dart';
import '../services/db_utils.dart';
import '../views/list_dogs.dart';

DbUtils utils = DbUtils();

class MyAppSql extends StatelessWidget {
  const MyAppSql({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 230, 225),
      appBar: AppBar(
        title: const Text('Filozofların Adını Yaz'),
      ),
      body: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController kopekIdController = TextEditingController();
  TextEditingController kopekAdController = TextEditingController();
  TextEditingController kopekYasController = TextEditingController();

  late Future<Database> database;

  List<Dog> dogList = [];

  _onPressedUpdate() async {
    final enik = Dog(
      id: int.parse(kopekIdController.text),
      name: kopekAdController.text,
      age: int.parse(kopekYasController.text),
    );
    utils.updateDog(enik);
    dogList = await utils.dogs();
    //print(dogList);
    getData();
  }

  _onPressedAdd() async {
    final enik = Dog(
      id: int.parse(kopekIdController.text),
      name: kopekAdController.text,
      age: int.parse(kopekYasController.text),
    );
    utils.insertDog(enik);
    dogList = await utils.dogs();
    //print(dogList);
    getData();
  }

  _deleteDogTable() {
    utils.deleteTable();
    dogList = [];
    getData();
  }

  void getData() async {
    await utils.dogs().then((result) => {
          setState(() {
            dogList = result;
          })
        });
    print(dogList);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Sqlite Örneği',
      home: Scaffold(
        //appBar: AppBar(title: const Text("Sqlite Örneği")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: kopekIdController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Filozofun ID kodu (sallayabilirsiniz)'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: kopekAdController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Filozofun Adı'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: kopekYasController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Kaç gösteriyor?'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: _onPressedAdd, child: Text("Filozofu Ekle")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: _onPressedUpdate, child: Text("Güncelle")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: _deleteDogTable, child: const Text("Sil")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListDogs()),
                      );
                    },
                    child: Text("Listele")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      getData();
                    },
                    child: Text("Refresh")),
              ),
              Text(dogList.length.toString()),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: dogList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(dogList[index].name),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


//hoca hafta 12 ders videosu 2.50 'de dedi kodları kullanabilirsiniz.
