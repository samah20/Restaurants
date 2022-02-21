import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/firestore/models/gd_user.dart';
import 'package:restaurants/firestore/providers/app_provider.dart';
import 'package:restaurants/firestore/ui/chats/all_chats_screen.dart';
import 'package:restaurants/firestore/ui/chats/all_users_screen.dart';

class MainPage extends StatelessWidget {
  GdUser us;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Consumer<AppProvider>(builder: (context, provider, x) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Chat App'),
            actions: [
              IconButton(
                  onPressed: () {
                    print("tasl is ${us.name}");
                    provider.logOut();
                  },
                  icon: Icon(Icons.logout))
            ],
            bottom: TabBar(tabs: [
              Tab(
                text: 'All Users',
              ),
              Tab(
                text: 'All Chats',
              ),
            ]),
          ),
          body: TabBarView(
            children: [AllUsersScreen(), AllChatsScreen()],
          ),
        );
      }),
    );
  }
}
