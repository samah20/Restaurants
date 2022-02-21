class Chat {
  String chatId;
  List membersIds;
  List membersNames;
  Chat({
    this.chatId,
    this.membersIds,
    this.membersNames,
  });
  Chat.fromJson(Map<String, dynamic> map) {
    this.chatId = map['chatId'];
    this.membersIds = map['membersIds'];
    this.membersNames = map['membersNames'];
  }
  toMap() {
    return {'membersIds': membersIds, 'membersNames': membersNames};
  }
}
