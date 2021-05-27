import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:state_management/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(InitialUserState());

  void selectUser(User user) {
    emit(CurrentUser(user));
  }

  void changeAge(int age) {
    final currentState = state;
    if (currentState is CurrentUser) {
      final newUser = currentState.user.copyWith(age: 30);
      emit(CurrentUser(newUser));
    }
  }

  void addProfession() {
    final currentState = state;
    if (currentState is CurrentUser) {
      final professions = currentState.user.professions;
      final newProfessions = [
        ...professions,
        'Profession ${professions.length + 1}',
      ];
      final newUser = currentState.user.copyWith(professions: newProfessions);
      emit(CurrentUser(newUser));
    }
  }

  void logOut() {
    emit(InitialUserState());
  }
}
