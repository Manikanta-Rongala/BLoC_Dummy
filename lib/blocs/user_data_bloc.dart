
import 'package:bloc_dummy/repositoriy/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../models/user_model.dart';

class UserDataBloc{

  //initializing repository

  final _repository = Repository();

  final _userDataFetcher = PublishSubject<List<UserModel>>();

  //creating stream from above publishedsubject

  Stream<List<UserModel>> get userDataStream => _userDataFetcher.stream;

  //create method to fetch data

   fetchUserData()  async {
  List<UserModel> data = await _repository.getUserData();

  _userDataFetcher.sink.add(data);

}
  //closing the stream

  dispose(){
     _userDataFetcher.close();
  }
}

//creating singleton for accessing the object globally

final userDataBloc = UserDataBloc();
