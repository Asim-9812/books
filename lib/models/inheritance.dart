

abstract class DataCall<T>{
  T getData();
}

class k implements DataCall{
  @override
  int getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }

}

class m implements DataCall{
  @override
  String getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }

}


// mixin running{
//   void runall(){
//     print('f');
//   }
// }
//
// class Person with running{
//
// }



//
//
// abstract class vehicle{
//
//   late  int wheel;
//   void drive();
//
//
// }
//
// class car implements vehicle{
//   @override
//   int wheel=4;
//
//   @override
//   void drive() {
//     // TODO: implement drive
//   }
//
//
// }
//
// class bike{
//
//
// }
//



//
// class A{
//
//   void sit(){
//
//     print('sitting');
//
//   }
//
// }
//
//
// class Animal{
//
//   void sleep(){
//
//     print('sleep');
//
//   }
//
//   void eat(){
//
//     print('eat');
//
//   }
//
// }
//
// class dog extends Animal{
//
//   void eat(){
//     print('dog is sleeping');
//   }
//
// }
//
// class cat extends Animal with A{
//
// }