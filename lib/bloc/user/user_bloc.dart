import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';

import 'package:state_management/models/user.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is ActivateUser) {
      yield state.copyWith(user: event.user);
    } else if (event is ChangeAge) {
      yield state.copyWith(user: state.user?.copyWith(age: event.age));
    } else if (event is AddProfession) {
      yield state.copyWith(
        user: state.user?.copyWith(
          professions: [
            ...state.user!.professions,
            event.profession,
          ],
        ),
      );
    } else if (event is LogOut) {
      yield state.initialState();
    }
  }
}