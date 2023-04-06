// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeStates {}

class InitState extends HomeStates {}

class ProductLoadingState extends HomeStates {}

class ProductSuccsessgState extends HomeStates {}

class ProductErrorState extends HomeStates {}

class RegisterLoadingState extends HomeStates {}

class RegisterSuccessState extends HomeStates {}

class RegisterErrorState extends HomeStates {}

class SigninLoadingState extends HomeStates {}

class SigninSuccessState extends HomeStates {
  String? token;
  SigninSuccessState({
    this.token,
  });
}

class SigninErrorState extends HomeStates {}

class ChangeBottomNavBarState extends HomeStates {}

class CreatUserLoadingState extends HomeStates {}

class CreatUserSuccessState extends HomeStates {}

class CreatUserErrorState extends HomeStates {}

class GetUserDateLoadingState extends HomeStates {}

class GetUserDateSuccessState extends HomeStates {}

class GetUserDateErrorState extends HomeStates {}

class UpdateUserDateLoadingState extends HomeStates {}

class UpdateUserDateSuccessState extends HomeStates {}

class UpdateUserDateErrorState extends HomeStates {}

class ProfileImageLoadingState extends HomeStates {}

class ProfileImageSuccessState extends HomeStates {}

class ProfileImageErrorState extends HomeStates {}
