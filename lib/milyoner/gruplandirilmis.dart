import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class Gruplandirilmis extends StatefulWidget {
  const Gruplandirilmis({Key? key}) : super(key: key);

  @override
  State<Gruplandirilmis> createState() => _GruplandirilmisState();
}

class _GruplandirilmisState extends State<Gruplandirilmis> {
  final List<Map<String, String>> _elements = [
    //onceden final yoktu mavi uyari veriyodu
    {'name': 'Platon', 'group': 'Teistler-Deistler'},
    {'name': 'Kant', 'group': 'Teistler-Deistler'},
    {'name': 'Voltaire', 'group': 'Teistler-Deistler'},
    {'name': 'Locke', 'group': 'Teistler-Deistler'},
    {'name': 'Marx', 'group': 'Ateistler'},
    {'name': 'Hume', 'group': 'Ateistler'},
    {'name': 'Nietzsche', 'group': 'Ateistler'},
    {'name': 'Protagoras', 'group': 'Agnostikler'},
    {'name': 'Arkesilaos', 'group': 'Agnostikler'},
  ];

  @override
  Widget build(BuildContext context) {
    Padding(
      padding: const EdgeInsets.all(8.0),
      //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Text('Anasayfaya Dön'),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Din Felsefesi"),
      ),
      body: GroupedListView<dynamic, String>(
        elements: _elements,
        groupBy: (element) => element['group'],
        // optional (sorts list alphabetically)
        itemComparator: (item1, item2) =>
            item1['name'].compareTo(item2['name']),
        order: GroupedListOrder.ASC, // optional
        useStickyGroupSeparators: true, // optional (keeps header at top)
        floatingHeader: true, // optional (hides background of header)
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        itemBuilder: (ctx, element) {
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Icon(
                Icons.account_circle,
                size: 50,
              ),
              title: Text(element['name']),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        },
      ),
    );
  }
}
