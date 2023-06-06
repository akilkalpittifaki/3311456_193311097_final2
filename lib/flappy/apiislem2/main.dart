import 'package:flap14/flappy/apiislem2/model/user_model.dart';
import 'package:flap14/flappy/apiislem2/service/user_service.dart';
import 'package:flutter/material.dart';

import '../../hakkinda-felsefeonemi.dart';

//void main() => runApp(MyAppApi11());

class MyAppApi11 extends StatefulWidget {
  //const MyAppApi11({super.key});

  @override
  State<MyAppApi11> createState() => _MyAppApi11State();
}

class _MyAppApi11State extends State<MyAppApi11> {
  UserService _service = UserService();
  bool? isLoading;

  List<UsersModelData?> users = [];

  @override
  void initState() {
    super.initState();
    _service.fetchUsers().then((value) {
      if (value != null && value.data != null) {
        setState(() {
          users = value.data!;
          isLoading = true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 224, 230, 225),
      /*
      appBar: AppBar(
        title: const Text(''),
      ),
      */
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Üyelerimiz'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                    MaterialPageRoute(builder: (context) => Hakkinda()));
              },
            ),
          ),
          body: isLoading == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : isLoading == true
                  ? ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              "${users[index]!.firstName! + users[index]!.lastName!}"),
                          subtitle: Text(users[index]!.email!),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(users[index]!.avatar!),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text("Bir sorun oluştu.."),
                    ),
        ),
      ),
    );
  }
}
