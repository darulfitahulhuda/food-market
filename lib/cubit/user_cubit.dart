import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market/models/models.dart';
import 'package:food_market/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> signUp(User user, String password, {File picturePath}) async {
    ApiReturnValue<User> result =
        await UserServices.signUp(user, password, pictureFile: picturePath);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> uploadProfilePicture(File picturePath) async {
    ApiReturnValue<String> result =
        await UserServices.uploadProfilePicture(picturePath);

    if (result.value != null) {
      emit(UserLoaded((state as UserLoaded).user.copyWith(
          picturePath: "http://foodmarket-backend.buildwithangga.id/storage" +
              result.value)));
    }
  }

  Future<bool> signOut() async {
    ApiReturnValue<bool> result = await UserServices.signOut();
    if (result.value != null) {
      return true;
    } else {
      return false;
    }
  }
}
