import 'package:chat_app_clone/pages/chat_page.dart';
import 'package:chat_app_clone/pages/register_page.dart';
import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../models/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Profile profile =
      Profile(id: 'id', name: '', avt: 'avt', isActive: false, role: 1);
  String myUserId = '';
  @override
  void initState() {
    myUserId = supabase.auth.currentUser!.id;
    getUser();
    // TODO: implement initState
    super.initState();
  }

  Future getUser() async {
    final data =
        await supabase.from('user').select().eq('id', myUserId).single();
    print(data);
    profile = Profile.fromMap(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ${profile.name}'),
        actions: [
          IconButton(
              onPressed: () {
                supabase.auth.signOut();
                Navigator.of(context)
                    .pushAndRemoveUntil(RegisterPage.route(), (route) => false);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Column(children: [
        StreamBuilder<List<Profile>>(
            stream: supabase.from('user').stream(primaryKey: ['id'])
                // .eq(column, value)
                .map(
                    (maps) => maps.map((map) => Profile.fromMap(map)).toList()),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return preloader;
              }
              List<Profile> lists = snapshot.data!;

              return ListView.builder(
                itemCount: lists.length,
                itemBuilder: (context, index) => lists[index].id == myUserId
                    ? Container()
                    : ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  ChatPage.route(lists[index].id, profile.id));
                            },
                            icon: Icon(Icons.navigate_next)),
                        title: Text(
                          '${lists[index].name}',
                        ),
                      ),
                shrinkWrap: true,
              );
            })
      ]),
    );
  }
}
