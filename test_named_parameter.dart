class Player {
  final String name;
  int xp = 1500;
  int age;
  String team;

  // constructor (생성자)
  Player(
      {required this.name,
      required this.xp,
      required this.team,
      required this.age}); // 순서가 중요하지 않아짐. null이 있을 수 있기에, 값들이 반드시 있어야 한다는 required를 앞에 삽입.
  void sayHello() {
    print("hi, I am $name in $team, my age is $age and my xp is $xp");
  }
}

void main() {
  var player = Player(name: 'kageyama', age: 15, team: 'karasuno', xp: 1500);
  player.sayHello();
}
