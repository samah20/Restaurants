import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurants/firestore/data/router_helper.dart';
import 'package:restaurants/firestore/models/gd_user.dart';
import 'package:restaurants/firestore/providers/app_provider.dart';
import 'package:restaurants/firestore/ui/chats/chat_messages_screen.dart';
import 'package:provider/provider.dart';

class AllUsersScreen extends StatelessWidget {
  GdUser us;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/back.png'),
          ),
        ),
        child: provider.users == null
            ? Center(
                //child:print("tasl is ${us.name}"),
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: provider.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      log("tasl is ${us.name}");

                      RouterHelper.routerHelper
                          .routingToSpecificWidgetWithoutPop(
                              AllChatMessagesScreen(
                        otherUser: provider.users[index],
                      ));
                    },
                    leading: CircleAvatar(
                      child: Text(
                        provider.users[index].name[0].toUpperCase(),
                      ),
                    ),
                    title: Text(provider.users[index].name,
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text(provider.users[index].email,
                        style: TextStyle(color: Colors.white)),
                  );
                }),
      );
    });
  }
}
