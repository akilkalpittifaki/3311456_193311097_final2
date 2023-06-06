import 'package:flap14/flappy/user_model.dart';
import 'package:flap14/flappy/user_service.dart';
import 'package:flutter/material.dart';

class Apiislem extends StatefulWidget {
  const Apiislem({super.key});
  final String title = "Uygulamayı Kullanan Geleceğin Filozof Adayları !";

  @override
  State<Apiislem> createState() => _ApiislemState();
}

class _ApiislemState extends State<Apiislem> {
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
      appBar: AppBar(
        title: Text(widget.title),
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
                        backgroundImage: NetworkImage(users[index]!.avatar!),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                      "Bir sorun oluştu.."), //veriler gelmediyse bunu gösteriyor
                ),
    );
  }
}

//get veri almak için, post veri yollamak için.

