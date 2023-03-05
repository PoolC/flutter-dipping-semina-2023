<div style="margin-right: 30px;">
	
# 1회차 : Install & Dart Basics

# 1. Flutter?

- **쉽다**
Android, Swift 네이티브 개발에 비해 쉽다
- **크로스플랫폼 & 빠른 속도 (Hot Reload : 코드 수정하면 즉시 반영)**
다른 크로스플랫폼 개발 프레임워크보다 속도가 빠르다
- **Fuchsia**
Google의 새로운 운영체제와 관련 있다

# 2. Flutter 설치

## 1. SDK 파일 다운로드

### **Fluter Install** : [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)

<aside>
📌 **Warning:** Do not install Flutter in a directory like `C:\Program Files\` that requires elevated privileges. (높은 권한 요구하는 위치에 다운로드받은 파일 압축 푸지 마세요)
`**C:\src\` 에 다운로드받은 파일 압축 풀면 `C:\src\flutter`**

</aside>

## 2. 환경 변수

 **`C:\src\flutter\bin`** 에 들어가면 flutter 및 dart command 파일이 들어있음.

해당 경로를 “시스템 환경 변수 편집” 에 들어가 “고급” > “환경변수” > “PATH”에 등록해주면, 어디서든 flutter 및 dart 명령 사용 가능

![Untitled](https://user-images.githubusercontent.com/88659167/222979240-4b191545-19c4-49af-b090-bc6944343bf0.png)

cmd 에 들어가 `flutter --version` 명령어 입력했을 때, 버전이 잘 출력되었다면 성공!

### macOS / Linux 인 경우

`~/dev/flutter`  에 압축 풀었으면, 아래 명령을 통해 환경변수에 SDK 위치 등록

```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

터미널에 똑같이 `flutter --version` 을 통해 확인하면 됨.

## 3. IDE

### Android Studio

Congiure > Plugins 에서 Flutter와 Dart 플러그인 설치하고 재시작

→ Create New Flutter Project 항목 생김!

### Visual Studio Code

## 4. 콘솔에 `flutter doctor` 실행

![Untitled 1](https://user-images.githubusercontent.com/88659167/222979239-dcbbbc99-1253-480e-a127-64727bd9d96f.png)

`flutter doctor` 실행했을 때, 이슈 없는지 확인
이슈 없으면 Flutter 환경 구성 성공!

더 자세한 정보 알고 싶으면 `flutter doctor -v` / `flutter doctor --verbose` 실행하면 됨.

# 3. Flutter CLI (command-line tool)

[https://docs.flutter.dev/reference/flutter-cli](https://docs.flutter.dev/reference/flutter-cli)
[https://www.geeksforgeeks.org/flutter-important-cli-commands/](https://www.geeksforgeeks.org/flutter-important-cli-commands/)

### 1. Create a new flutter app

```bash
flutter create {app_name}
cd {app_name}
```

### 2. Analyze & Test

```bash
flutter anaylyze # code 에러 있는지 확인
flutter test # ~/test 에 있는 dart 파일 실행해 test해보기
```

### 3. Run a file (or an app)

```bash
flutter run {app_name} 
```

### 4. Add package to *pubsec.yaml* & Download & Update pacakges

### [**pub.dev](http://pub.dev) (the official pacakge repo for Dart & Flutter)**

```bash
flutter pub add {pacakge_name}
flutter pub get # pubsec.yaml에 있는 패캐지, dependecy 모두 다운로드해주는 명령어
flutter pub upgrade # 제일 최신 버전으로 패키지 업데이트
flutter pub outdated 
# 설치된 패키지 버전 확인하고,최신, stable 버전 등을 알려줌
# Current   Upgradable  Resolvable  Latest 
```

### 5. Flutter/ Dart SDK Version

```bash
flutter --version
flutter upgrade # 버전 업그레이드
```

### 6. Clean

```bash
flutter clean # `build/` & `.dart_tool/` 폴더 삭제
```

# 4. Dart : Get Started

### Dart : [https://dart.dev](https://dart.dev/overview)
**DartPad :** [https://dartpad.dev/](https://dartpad.dev/)?

(제 생각은, Dart 언어는 기본적인 문법만 배우고 나서 플러터 개발하면서 자연스럽게 익히는 게 좋은 것 같아요, 그리고 자바스크립트 언어 배우신 분들은 더 쉽게 느껴지실 것으로 생각되어요)

## 1. Dart?

Google에서 개발한 프로그래밍 언어 (2013년 출시)

JavaScript와 비슷함 / 객체지향프로그래밍 언어

- main() 함수로 시작 (entry point)
- 모든 데이터 타입은 Object
- 앞에 _ 붙이면, private 변수로, 해당 변수가 정의되지 않은 다른 파일에서는 사용 불가능
- Null Safety 지원
- generic 타입 지원 ex) `List<String> abc = [ 'a'. 'b', 'c'];`

## 2. Basics

### 1. Hello World! (String Interpolation)

 `${변수 이름}`  `$변수 이름`  (변수 하나만 쓴다면)
+) Dart Naming Convention : 변수 이름은 lowerCamelCase 사용함

```dart
void main() {
  String firstSemina = 'World';
  print('Hello $firstSemina.hello!'); // 뒤에 ; 붙여주기 
}
```

### 2. Data Type

runtime type을 확인하고 싶으면 변수 이름 뒤에 `.runtimeType` 해주면 됨. 
ex) `firstSemina.runtimeType`

- **var** : 자료형을 특정하지 않고, 데이터 타입 추론 (type inference)
        입력받은 값에 따라 자료형 결정됨
        (근데 정확히 타입 지정해주는 것이 좋음)
- **dynamic** : var와 같이 입력받은 값에 따라 자료형 결정됨

                       다만, var은 한 번 선언했을 때 결정된 자료형으로 지정되어서 변경 불가

                       dynamic은 자료형 변경 가능 (그냥 아무거나 다 넣을 수 있음)

- **int** : 정수
- **double** : 실수
- **num** : 정수와 실수
- **String** : 문자열
- **bool** : true / false (boolean)

### 3. Constant

- **final** : 선언한 이후로 변경 불가
- **const** : 선언한 이후로 변경 불가 (코드를 작성한 순간에 그 값을 알아야 함) ex) Datetime

```dart
void main(){
  const pi = 3.14;
  pi = 4.23; // not possible  
  print("Value of PI is $pi");
}
```

위의 코드를 실행하면, 결과가 어떻게 나올까? >>> Error

### 4. Null Safety

기본적으로, 모든 자료형은 non-nullable

```dart
int age = 23;  // non-nullalbe
int age = null; // Error
```

- **? (nullable)**

```dart
String name = null; //데이터 타입 뒤에 ? 붙이면 null 값 포함 가능
print(name?.length); // null 출력
```

- **! (non-nullable; null assertion operator)**
null 값이 포함되어있지 않다고 보증

---

reference : [https://dartpad.dev/workshops.html?webserver=https://dartpad-workshops-io2021.web.app/null_safety_workshop](https://dartpad.dev/workshops.html?webserver=https://dartpad-workshops-io2021.web.app/null_safety_workshop)

### 5. Operator

### ****Arithmetic Operator****

| + | 더하기 | %  | 나머지 |
| --- | --- | --- | --- |
| - | 빼기 | ++  (후위 / 전위 연산)
num++
++num | 더하기
변수 사용한 후 1 더하기
변수에 1을 더한 후 사용 |
| * | 곱하기 | --  (후위 / 전위 연산)
num —
— num | 빼기
변수 사용한 후 1 빼기
변수에 1을 뺀 후 사용 |
| /  | 나누기 | ~/  | 몫 (int) |

### ****Relational Operator****

| == | 같은지 | >= | 왼쪽이 오른쪽보다 크거나 같은지 |
| --- | --- | --- | --- |
| != | 다른지 | <= | 왼쪽이 오른쪽보다 작거나 같은지 |
| > | 왼쪽이 오른쪽보다 큰지 | < | 왼쪽이 오른쪽보다 작은지 |

### Logical Operator

| && | and | ! | not |
| --- | --- | --- | --- |
| || | or | != | 다른지 |

### Type Test Operator

| is | 같은 타입이면 true |
| --- | --- |
| is! | 다른 타입이면 false |

### 6. Control flow

### if - else if - else

```dart
void main() {
  double grade = 85;
  
  if(grade >= 90 && grade <= 100){
    print('A');
  }else if(grade >= 80){
    print('B');
  }else{
    print('C');
  }
}
```

### conditional expression

1. `조건문 ? [참일 때] : [거짓일 때]` 
흔히 “삼항연산자”라고 함.

```dart
void main() {

	int a = 2;
	int b = 3;

	int smallNumber = a < b ? a : b;
	print("$smallNumber is smaller");

}
```

1. `변수 ?? [null일 때]`

```dart
void main(){
  int? x;
  x = null;
  
  print(x ?? 3); // null값이면, ?? 뒤에 있는 값으로 대체
}
```

### Switch case

`enum` 타입 (열거) 과 함께 잘 사용됨

```dart
// main 함수 밖에서 정의
enum Platform {naver, google, kakao}

void main() {
 const loginPlatform = Platform.naver;
  
  switch (loginPlatform) {
    case Platform.naver:
        print('Naver에서 로그인했습니다.');
        break;
      
    case Platform.google:
        print('Google에서 로그인했습니다.');
        break;
  
    case Platform.kakao:
        print('KaKao에서 로그인했습니다.');
        break;
    // default statement
    default:
        print('찾을 수 없습니다.');
        break;
    
  }
}
```

### 7. Loop

### for - loop

```dart
void main() {
  List<String> name = ['조윤수', '이상현', '양제성', '박지은','박수빈', '강민서', '진영민', '안석우' ];
  
  for (var i = 0; i < name.length; i++) {
    print('Hello ${name[i]}!');
  }
  
  print('------------');
    
  // for-in loop
  for (String n in name){
    print('Hello $n');
  }
}
```

### forEach loop

`list/collection.forEach(void f(value));` (내부 반복)

```dart
void main() {
  List<String> name = ['조윤수', '이상현', '양제성', '박지은','박수빈', '강민서'];
  
  // arrow function
  name.forEach((n) => print('Hello $n!'));
}
```

```dart
void main() {
  List<String> name = ['조윤수', '이상현', '양제성', '박지은','박수빈', '강민서'];
 
  name.asMap().forEach((i, n) => print('$i : Hello $n!'));
}
```

### +) where / any

```dart
void main() {
  List<String> name = ['조윤수', '이상현', '양제성', '박지은','박수빈', '강민서'];
  // 조건문 필터링
  name.where((n) => n.contains('박')).forEach(print);
}
```

```dart
void main() {
  List<String> name = ['조윤수', '이상현', '양제성', '박지은','박수빈', '강민서'];

  // 하나라도 조건문 만족하면 true 반환
  print(name.any((n) => n.contains('이')));
}
```

### while - loop

```dart
void main() {
  int i = 10;
  while (i >= 1) {
    print(i);
    i--;
  }
}
```

### break & continue

```dart
void main() {

	// loop 라벨링 가능
	// Nested for-loop
	outerLoop: for (int i = 1; i <= 3; i++) {

		innerLoop: for (int j = 1; j <= 3; j++) {
			print("$i $j");

			if (i == 2 && j == 2) {
				break outerLoop;
			}
		}
	}
}
```

```dart
void main() {
  for (int i = 10; i >= 1; i--) {
    if (i >= 5) {
      continue;
    }
    print(i);
  }
}
```

continue는 반복문 skip (반복문 종료하지 않고, 그 다음 반복 계속 진행)

### 8. Function

- 반환타입 **(return값이 없으면, `void`  <생략 가능>)**
- 함수 이름
- parameter

```dart
void main() {
  add(10, 20);
  String a = seminaName();
	print(a);
}

// parameter (o) & return (x)
void add(int num1, int num2){
  int sum;
  sum = num1 + num2;
   
  print("총합: $sum");
}

// parameter (o) & return (o)
int add2(int num1, int num2){
  int sum;
  sum = num1 + num2;
   
  return sum;
}

// parameter (x) & return (o)
String seminaName() {
  return "플러터 찍어먹기";
}

// arrow function {return ~;} 대신
int add3(int num1, int num2) => num1+num2;
```

1. **positional parameter**

   순서 지키기
2. **optional parameter**

   `[ ]`** 안에 parameter를 넣으면, optional 
3. **********named parameter**********

### 9. Collection

### List

```dart

```

### Map

```dart

```

### Set
</div>
