class Player {
  final String name;
  int xp;
  String team;

  // 'fromJson'이라는 name constructor
  Player.fromJson(Map<String, dynamic> playerJson)
      //property 초기화
      : name = playerJson['name'], // name은 playerJson 내부의 name
        xp = playerJson['xp'],
        team = playerJson['team'];

  void sayHello() {
    print("hi, I am $name in $team and my xp is $xp");
  }
}

void main() {
  // API로부터 여러 Player가 들어있는 목록을 받는다고 가정.
  var apiData = [
    {
      "name": "hyun",
      "team": "red",
      "xp": 0,
    },
    {
      "name": "so",
      "team": "green",
      "xp": 0,
    },
    {
      "name": "young",
      "team": "blue",
      "xp": 0,
    },
  ]; // 구조화 되지 않은 세 개의 elements

// element들을 각 player class로 바꿈.
  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });
}
