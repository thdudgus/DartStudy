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
