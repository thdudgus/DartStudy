# DartStudy
personal study for hult prize  
노마드 코더 강의를 활용해 실습 예정

:pencil2: !TIL 기록! :pencil2:  

#
## 2024.01.16
## VARIABLES
### main  
실제로 동작하는 코드는 모두 main()에 넣어줘야 함.  
세미콜론(;)을 문장 끝에 넣어줘야 하는데, 특정 기능(casecade operator)엔 일부러 넣지 않아야 하기 때문.  
#


### var Keyword   
var name = 'youngsan'; 처럼 변수 타입을 지정해주지 않아도 var 키워드로 변수 선언 가능.  
**dart의 권장 사항 =>** <span style="color:yellow"><u>관습적으로 함수나 메소드 내부에 지역 변수를 선언할 때는, var 사용</span></u>    
<br/>
```dart
void main()
{
    var name = 'youngsan';      
    name = 'kegeyama';  
    // name은 String으로 선언됐기 때문에, int와 bool 등 String이 아니면 선언(수정) 불가
    name = 9; 
    name = true;
}
```
String name 'kageyama'; 처럼 명시적으로 변수 타입을 지정해주어도 됨.  
클래스에서 변수나 property를 선언할 때, 타입 지정.
##


### Dynamic
dynamic은 여러 타입을 가질 수 있는 변수에 쓰는 키워드  
```dart
void main()
{
    var name;      // dynamic name;도 가능
    name = 'youngsan';
    name = 9;
    name = true;
}
```
해당 코드가 가능한 이유는 변수의 타입이 dynamic이기 때문.   
<br/>

   **dynamic이 필요한 이유**  
   - 변수가 어떤 타입인지 알기 어려운 경우
   - dynamic으로 돌아가는 게 유용한 경우도 존재  
  
```dart
void main()
{
    dynamic name;
   
    if (name is String) 
    {
        name.~~~; // name이 String 타입인 걸 알기 때문에 다양한 자동완성 제공
    }
    // 이 조건문 밖에선 name의 타입을 확인해줘야 함. name이 dynamic이기 때문에 
}
```
dynamic을 이용하면 dart가 데이터 타입을 확인해줄 수 있음.   
<u><span style="color:yellow">**dynamic은 꼭 필요한 상황에서만 사용하는 것을 권장**</span></u>
#

### Nullable Variables
dart에선 어떤 변수가 null 될 수 있음을 정확히 표시해야 함. 타입 뒤에 ?를 붙임.
```dart
void main()
{
    String name = 'kageyama';
    name = null; // error -> name은 오직 String이어야 하기 때문.

    String? namae = 'kageyama';
    namae = null; // not error -> namae가 String일 수도, null일 수도 있다는 걸 dart가 앎.
    namae.length; // 컴파일러에서 밑줄이 생성, namae가 null일 수 있다는 것을 알려줌.
    

    if (namae != null){ 
        namae.isNotEmpty; // 이 변수를 사용하기 전 확인
    }
    // 위 if문과 같음
    namae?.isNotEmpty; // namae가 null이 아니라면, isNotEmpty속성을 달라고 요청
}
```
**dart의 null safety**  
어떤 변수, 혹은 data가 null이 될 수 있음을 명시하는 것. 어떤 data가 null일 때 참조하지 않도록 dart가 도와줄 것임.   
<u><span style="color:yellow"> 기본적으로 모든 변수는 non-nullable </span></u>  
<br/>
flutter를 하다보면 '?'를 많이 발견하게 되는데, API 같은 데에서 data를 받아올 때 등임.   
#

### Final Variables
처음 변수의 값을 선언하면 중간에 바꿀 수 없음. javascript나 typescript의 const와 같음.
```dart
void main()
{
    final name = 'young';  // final String name = 'young';도 가능하나 final만 써도 무방
    name = 'san'; // 재설정 불가능
}
```

#

### Late Variables
final이나 var 앞에 붙여줄 수 있는 수식어.   
late는 초기 데이터 없이 변수를 선언할 수 있게 해줌.
```dart
void main()
{
    late final String name;
    // ex) do something, go to api, api의 요청으로 데이터를 받은 후, 
    name = 'san'; // 그 데이터를 나중에 변수에 넣을 수 있음.
    name = '9'; // 재설정 불가능
}
```
<br/>

flutter로 data fetching할 때 유용함.
```dart
void main()
{
    late final String name;
    print(name); // dart는 name이 late변수이기 때문에, 값을 넣기 전에 접근하지 말아야 한다는 걸 알려줌. like null safety
}
```
#

### Const Variables
javascript나 typescript의 const와 다름.  
dart에서 const는 **compile-time constant**를 생성. const는 상수이기 때문에 중간에 값 변경 불가.
```dart
void main()
{
    const name = 'young'; 
    name = 'san'; // 재설정 불가능
}
```
<br/>

<u><span style="color:yellow"> const는 **compile-time**에 알고 있는 값이어야 함.</span></u>   
예를 들어 API 요청을 한다고 했을 때 (사용자의 휴대폰에서 앱을 실행할 때 이루어지는 것들),  
아래 코드는 컴파일러가 API 변수 값을 모르기 때문에 compile-time constant가 아님.
```dart
void main(){
const API = fetchAPI(); // API가 받아와야 하는 값이기 때문에 const가 아닌 final이나 var이 맞음.
}
```
const는 컴파일 할 때 알고 있는 값에 사용하는 것.  
스토어에 앱을 올리기 전에 알고 있는 값.  
어떤 값인지 모르고, 그 값이 API로부터 온다거나 사용자가 화면에서 입력해야 하는 값이라면, final이나 var가 되어야 함.

#

## DATA TYPES
### Basic data types
다른 언어에서 사용하는 공통적인 기본 데이터 타입들이 있음.  
dart는 객체지향언어  
모든 게 object, class로 이루어져있음. String, integer 등... **해당 변수 타입에 대한 많은 메소드를 가지고 있음.**  

integer와 double의 부모 class는 num으로, num은 int일 수도, double일 수도 있음.   
#
### Lists
```dart
void main(){
    var numbers = [1, 2, 3, 4]; // integer로 된 list
    // 다른 표기
    List<int> numbers = [1, 2, 3, 4];
    numbers.add(5); // int 타입만 추가 가능
}
```
<br/>

# 
### collection if
list를 생성할 때, 조건에 따라 element 추가 가능.
```dart
void main(){
    bool giveMeFive = true;

    var numbers = [
        1, 
        2, 
        3, 
        4, 
        if(giveMeFive) 5,  // giveMeFive가 true일 때, 5를 numbers에 추가
        ];

    //다른 표기 
    var numbers = [1, 2, 3, 4];
    if (giveMeFive){
        numbers.add(5);
    }
}
```
결과 : [1, 2, 3, 4, 5]

#
### String Interpolation
string interpolation은 text에 변수를 추가하는 방법.  
'$' 기호 뒤에 변수 이름을 추가해주면 됨.   

- 변수가 이미 존재할 때의 사용 방법.   
```dart
void main(){
    var name = 'kageyama';
    var greeting = 'hello, my name is $name, nice to meet you!';
    print(greeting);
}
```
결과 : hello, my name is kageyama, nice to meet you!  
   

- 변수에 계산을 추가해 실행할 때의 사용 방법
```dart
void main(){
    var name = 'kageyama';
    var int = 16;
    var greeting = 'hello, my name is $name and my age is ${age+2}!';
    print(greeting);
}
```
결과 : hello, my name is kageyama and my age is 18! 
#
### Collection For
```dart
void main(){
    var oldFriends = ['tsukisima', 'yamaguchi'];
    var newFriends = [
    'kageyama', 
    'hinata', 
    for (var friend in oldFriends) "🏫 $friend", 
    ];
    print(newFriends);
}
```
결과 : [kageyama, hinata, 🏫tsukisima, 🏫yamaguchi]
#
### Maps
key와 value로 이루어진 자료구조
```dart
void main(){
    var player = {
        'name' : 'youngsan',
        'age' : 16,
        'superpower' : true,
    };
}
```
var이기 때문에 위 코드는 map의 자료형이 string : object로 자동 설정됨.
아래 코드처럼 명시적으로 자료형을 설정해줄 수도 있음.
```dart
void main(){
    Map<int, bool> player = {
        1 : true,
        2 : false,
        3 : true,
    };

    Map<List<int>, bool> players = {
        [1, 2, 3, 4] : true,
        [2, 3, 4] : false,
        [9, 14, 2] : true,
    };
}
```
이외에도 여러 개의 map으로 이루어진 list를 만드는 등 다양한 방식으로 활용할 수 있음. 그러나 만약 key와 vlaue를 가지는 구조로 object를 만들 때, 그리고 그것들이 특정 형태를 가질 때, players, movies 혹은 photos와 같이 API로 얻은 데이터는 class를 사용하는 것을 추천
#
### Sets
set은 sequence(순서가 있음).
```dart
void main(){
    var numbers = {1, 2, 3, 4};
    // 다른 표기
    Set<int> numbers = {1, 2, 3, 4};
    
    numbers.add(1);
    numbers.add(1);
    numbers.add(1);
    print(numbers);
}
```
결과 : {1, 2, 3, 4}  

set과 list의 차이점은 set에 속한 원소들은 모두 unique하다는 것.   
set은 {}, list는 [] 사용.   
   
   dart의 set은 pyton의 tuple, dart의 list는 python의 list와 같음.   
#
## FUNCTIONS 
### Defining a Function
```dart
String sayHello(String potato){
    return "Hello $potato.";
}
// 다른 표기, 함수가 return 한 줄일 때만 아래 표기 사용 가능.
String sayHello(String potato) => "Hello $potato.";

void main(){
    print(sayHello('youngsan'));
}
```
결과 : Hello youngsan.
#


### Named Parameters
```dart
String sayHello({String name, int age, String country}){
    return "Hello $name, you are $age, and you come from $country";
}

void main(){
    print(sayHello(
        age : 15,
        country : 'Miyagi',
        name : 'kageyama'
    ));
}
```
결과 : Hello kageyama, you are 15, and you come from Miyagi   
<br/>
우리가 C언어 등 다른 언어를 사용할 때처럼 인수를 넣어 함수를 호출하는 방식을 사용해도 되지만, 그 방법은 인수의 순서나 넣어야할 값 등이 헷갈릴 수 있음.  
일일이 함수 정의를 확인해야 하는 불편함 존재. 
<br/>
위처럼 **named parameter를 사용하면 순서에 무관하게 작성 가능.**   
<br/>

**사용자가 매개변수의 값을 일부 혹은 모두 넘기지 않을 수 있는 경우**
- named argument에 default value를 설정.

```dart
String sayHello({
    String name = 'anon', 
    int age = 99, 
    String country = 'unknown'}){
    return "Hello $name, you are $age, and you come from $country";
}

void main(){
    print(sayHello(
        age : 15,
    ));
}
```
<br/>

- required modifier 이용.<br/>
자료형 앞 required 붙여 필수값으로 만들 수 있음.

```dart
String sayHello({
    required String name, 
    required int age, 
    required String country}){
    return "Hello $name, you are $age, and you come from $country";
}

void main(){
    print(sayHello()); // sayHello()가 호출될 때 반드시 name, age, country의 값이 필요하다는 걸 dart가 알려주게 됨.
}
```
#

### Optional Positional Parameter
특정 인수(argument)를 보내지 않고도 동작할 수 있게 함.
```dart
// 대괄호로 매개변수를 감싼 후, ?로 null이 될 수 있다고 표시 후 default value 설정.
String sayHello(String name, int age, [String? country = 'Japan']) => "Hello $name, you are $age, and you come from $country";
// name과 age는 필수 인자, country는 필수 x

void main(){
    print(sayHello('ys', 12)); 
}
```

#
### QQ Operator
- QQ operator   
left ?? right에서 ??(QQ)가 null을 확인하는 역할.
```dart
String capitalize(String? name) => 
    name != null ? name.toUpperCase() : 'ANON';
// 다른 표기
String capitalize(String? name) => 
    name?.toUpperCase() ?? 'ANON'; // name 자체가 null인 경우 toUpperCase()이 안 되므로 ? 추가.

void main(){
    capitalize('soyoung');
    capitalize(null);
}
```
left가 null이면 right를 return.   
left가 null 아니면 left를 return.

- QQ equals (QQ assignment operator)   
null일 때 할당.
```dart
void main() {
  String? name;
  print(name);

  name ??= 'soyoung';
  print(name);

  name = null;
  name ??= 'another';
  print(name);
}
```
결과 :   
null   
soyoung   
another   
#

### Typedef
자료형의 이름을 재정의 (alias 사용)
```dart
typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
    var reversed = list.reversed;
    return reversed.toList();
}

void main() {
    print(reverseListOfNumbers([1, 2, 3]));
}
```
#
## CLASSES
### class
class를 생성할 땐 반드시 타입을 명시해줘야 함.
```dart
class Player {
    final String name = 'young';
    int xp = 1500;

    void sayHello(){
        print("hi, my name is $name"); // $this.name도 가능하나 권장 x
    }
    // 메소드 내에서 같은 이름으로 사용되는 경우만 사용.
    void sayHello(){
        var name = 'san';
        print("hi, my name is ${this.name}"); 
    }
}

void main() {
    var player = Player(); // new Player()도 무방
}
```
#

### Constructor
```dart
class Player {
    final String name;
    int xp;
    String team;
    int age;

    // constructor (생성자)
    Player(this.name, this.xp); // 순서가 중요, positional

    void sayHello(){
        print("hi, my name is $name"); 
    }
}

void main() {
    var player = Player('young', 1500);
    player.sayHello();

    var player2 = Player('san', 2500);
    player2.sayHello();
}
```
#

### Named Constructor Parameters
class의 규모가 커지면 생성자의 매개변수 순서에 혼동이 올 수 있음. 또한, 정의를 계속 찾아봐야 하는 등 번거로워 질 수 있기 때문에 이름을 붙임.   
flutter에서 자주 사용.
```dart
class Player {
  final String name;
  int xp = 1500;
  int age;
  String team;

  // constructor (기본 생성자)
  Player({
    required this.name, 
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
```
결과  : hi, I am kageyama in karasuno, my age is 15 and my xp is 1500
#

### Named Constructors
flutter에서 constructor를 만들 때 많이 사용하는 패턴 중 하나.   
**생성자에 이름을 붙여, 필요에 따라 인자를 다르게 받도록 함.**   
:을 사용하여 argument와 property를 일대일로 초기화하는 생성자를 만들 수 있음.
```dart
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
  // 기본적으로 positional parameter는 required가 아니기 때문에 명시적으로 작성해줌.
  Player.createBlackPlayer({ 
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name, // 받아오는 값
        this.team = 'balck',
        this.xp = 0; // 자동 할당

  // positional constructor
  // 기본적으로 positional parameter는 required
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
```
결과 :    
hi, I am tobio in balck, my age is 15 and my xp is 0   
hi, I am kenma in red, my age is 16 and my xp is 0
#


### constructor simulation example
API로부터 데이터를 받아옴. ex ) Jason Format  
데이터를 받으면 그걸 class로 바꿔야 함. Flutter dart class   
```dart
class Player {
  final String name;
  int xp;
  String team;

  // 'fromJson'이라는 name constructor
  Player.fromJson(Map<String, dynamic> playerJson)
      //property 초기화
      : name = playerJson['name'], // class 내부의 name은 playerJson Map에서 key가 name인 값을 가져와 넣음.
        xp = playerJson['xp'], // name과 같이 실행
        team = playerJson['team']; // name과 같이 실행

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
      "xp": 1,
    },
    {
      "name": "young",
      "team": "blue",
      "xp": 2,
    },
  ]; // 구조화 되지 않은 세 개의 elements

  // element들을 각 player class로 바꿈.
  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });
}
```
결과 :   
hi, I am hyun in red and my xp is 0  
hi, I am so in green and my xp is 1  
hi, I am young in blue and my xp is 2  
#

### Cascade Notation
```dart
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
  
  
  // cascade는 바로 앞 class를 가리킴. object 생성 직후가 아닌 나중에도 사용 가능하다는 뜻.
  var young = Player(name: 'young', xp: 1200, team: 'blue');
  var potato = young
    ..name = 'hyun'
    ..team = 'red'
    ..xp = 1500
    ..sayHello();
}
```
#

### Enum
```dart
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
  var young = Player(
    name: 'hyun', 
    xp: XPlevel.beginner, 
    team: Team.red);
  young.sayHello();

  var potato = young
    ..name = 'so'
    ..team = Team.blue
    ..xp = XPlevel.pro
    ..sayHello();
}
```
#

### Abstract Classes
추상 클래스는 메소드의 이름과 반환 타입만 정해서 정의할 수 있음.   
이를 상속 받은 클래스는 해당 메소드의 실행 부분을 구현해야 함.
```dart
abstract clss Human{
    void walk();  // 함수 실행 부분 구현 x
}

class Player extends Human{
    void walk(){ // 상속 받은 클래스 내에서 자체적으로 구현
        print("걷기 싫습니다");
    }
}

class Coach extends Human{
    void walk(){ // 상속 받은 클래스 내에서 자체적으로 구현
        print("걸어");
    }
}
```
#

### Inheritance
super는 상속한 부모 클래스의 property에 접근하게 하거나 메소드를 호출할 수 있게 함.   
<br/>
**확장한 부모 클래스가 생성자를 포함하고 있고 그 클래스를 다른 어떤 곳에서 상속 받아 사용하려면, 필요한 값을 전달해야 하고 그 부모 클래스의 생성자를 호출해야 함.**

```dart
abstract clss Human{
    final String name;
    Human({required this.name}); // 생성자
    void sayHello(){
        print("hello, I am $name");
    }
    
}

enum Team {blue, red}

class Player extends Human{
    final Team team;

    Player({  // 생성자
        required this.team,
        required String name. // Human을 상속 받았기 때문에, Human의 생성자도 호출해야 함. 필수 요소 넣어줌.
    }) : super(name : name); // name을 super 생성자에 전달
    // Human 클래스에 required가 없다면 super(name);도 가능. 선택사항


    // Human의 sayHello()를 재정의
    @override
    void sayHello(){
        super.sayHello(); // Human의 원래 메소드
        print('and I play for ${team}'); // 새롭게 추가한 부분
    }
}

void main()
{
    var platyer = Player(team : Team.red, name : 'young');
    player.sayHello(); // 메소드 뿐 아니라 함수도 해당 방법으로 사용 가능.
}
```
#

### Mixins
**생성자가 없는 클래스**를 의미. with 사용.  
여러 클래스에 재사용이 가능.    
<br/>
extends와 다름. extend를 하게 되면 확장한 클래스는 부모 클래스가 되고, 자식클래스는 super를 통해 부모클래스에 접근할 수 있으며 부모 클래스의 인스턴스가 됨.   
mixin은 **with를 사용해 mixin 내부의 property와 메소드를 가져오는 것.**   

```dart
enum Team {blue, red}

class Strong {
    final double strengthLevel = 1500.99;
}

class RunQuick {
    print("ruuuuuun!");
}

class Tall {
    final int height = 1.99;
}

// mixin 클래스들은 여러 클래스에 재사용이 가능. 필요한 특성만 상속 없이 가져다 쓸 수 있음.
class Player with Strong, RunQuickm, Tall {
    final Team team;
    Player({
        required this.team,
    });
}
class Horese with Strong, RunQuick{

}
class Kids with RunQuick {

}
``` 
