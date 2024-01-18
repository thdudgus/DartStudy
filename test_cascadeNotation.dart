class Player {
  String name;
  int xp;
  String team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print("hi, I am $name in $team and my xp is $xp");
  }
}

void main() {
  var young = Player(name: 'young', xp: 1200, team: 'blue');
  young.name = 'hyun';
  young.team = 'red';
  young.xp = 1500;
  // 다른 표기 (= cascade)
  var young = Player(name: 'young', xp: 1200, team: 'blue')
    ..name = 'hyun'
    ..team = 'red'
    ..xp = 1500;

  // cascade는 바로 앞 class를 가리킴.
  var young = Player(name: 'young', xp: 1200, team: 'blue');
  var potato = young
    ..name = 'hyun'
    ..team = 'red'
    ..xp = 1500
    ..sayHello();
}
