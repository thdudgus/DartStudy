enum Team { red, blue }

enum XPlevel { beginner, medium, pro }

class Player {
  String name;
  XPlevel xp;
  Team team;

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
  var young = Player(name: 'hyun', xp: XPlevel.beginner, team: Team.red);
  young.sayHello();

  var potato = young
    ..name = 'so'
    ..team = Team.blue
    ..xp = XPlevel.pro
    ..sayHello();
}
