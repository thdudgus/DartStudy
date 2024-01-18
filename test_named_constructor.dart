class Player {
  final String name;
  int xp = 1500;
  int age;
  String team;

  // constructor (기본 생성자)
  Player(
      {required this.name,
      required this.xp,
      required this.team,
      required this.age});

  // Named constructor
  Player.createBlackPlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name, // 받아오는 값
        this.team = 'balck',
        this.xp = 0; // 자동 할당

  // positional constructor
  Player.createRedPlayer(String name, int age)
      : this.age = age,
        this.name = name, // 받아오는 값
        this.team = 'red',
        this.xp = 0; // 자동 할당

  void sayHello() {
    print("hi, I am $name in $team, my age is $age and my xp is $xp");
  }
}

void main() {
  var player = Player.createBlackPlayer(
    name: 'tobio',
    age: 15,
  );
  player.sayHello();

  var player2 = Player.createRedPlayer("kenma", 16);
  player2.sayHello();
}
