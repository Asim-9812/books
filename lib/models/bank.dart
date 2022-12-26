class Bank {
  String bankName;
  String bankAddress;
  String accountHolder;
  int employeeNum;

  Bank({required this.bankName,
    required this.bankAddress,
    required this.accountHolder,
    required this.employeeNum});

  int _balance = 0;


  void deposit(int amount){
    _balance += amount;
  }

  void withdraw(int amount){
    if(_balance > amount){
      _balance -= amount;
    }else{
      print('you do not have enough balance .. try for loan');
    }
  }

  int balanceShow(){

   return _balance;

  }



}