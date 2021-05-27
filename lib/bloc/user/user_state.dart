part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class InitialUserState extends UserState {
  final bool userExists = false;
}

class CurrentUser extends UserState {
  final userExists = true;
  final User user;

  CurrentUser(this.user);
}
