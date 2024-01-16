void main() {
  var oldFriends = ['tsukisima', 'yamaguchi'];
  var newFriends = [
    'kageyama',
    'hinata',
    for (var friend in oldFriends) "🏫$friend",
  ];
  print(newFriends);
}
