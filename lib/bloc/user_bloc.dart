import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youbank/data/repository.dart';
import 'package:youbank/models/user_models.dart';

class UserBloc extends Cubit<UserState> {
  final Repository _repository;

  UserBloc(this._repository) : super(Empyt());

  Future getUserData() async {
    emit(Loading());

    try {
      final user = await _repository.getuser();

      emit(DataLoaded(user: user));
    } catch (e) {
      rethrow;
    }
  }
}

abstract class UserState {}

class Empyt extends UserState {}

class Loading extends UserState {}

class DataLoaded extends UserState {
  final List<User> user;

  DataLoaded({
    required this.user,
  });
}
