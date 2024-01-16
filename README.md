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
**dart의 권장 사항 =>** <span style="color:yellow">관습적으로 함수나 메소드 내부에 지역 변수를 선언할 때는, var 사용</span>    
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
<span style="color:yellow">**dynamic은 꼭 필요한 상황에서만 사용하는 것을 권장**</span>
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
<span style="color:yellow"> 기본적으로 모든 변수는 non-nullable </span>  
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

<span style="color:yellow"> const는 **compile-time**에 알고 있는 값이어야 함.</span>   
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