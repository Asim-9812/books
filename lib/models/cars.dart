class carOwner{
  String owner;
  String carModel;

  carOwner({required this.owner,required this.carModel});

  void description(){
    print('the owner of $carModel is $owner');
  }

}