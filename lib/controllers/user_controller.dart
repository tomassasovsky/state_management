import 'package:get/get.dart';

import 'package:state_management/models/user.dart';

class UserController extends GetxController {
  RxBool userExists = false.obs;
  Rx<User>? user = User().obs;

	get professionsLength {
		return this.user!.value.professions.length;
	}

  void loadUser(User user) {
    this.userExists.value = true;
    this.user?.value = user;
  }

  void changeAge(int age) {
    this.user?.update((user) {
			user?.age = age;
		});
  }

  void addProfession(String profession) {
    this.user?.update((user) {
			user?.professions = [
				...user.professions,
				profession,
			];
		});
  }

  void logout() {
    this.user = null;
  }
}
