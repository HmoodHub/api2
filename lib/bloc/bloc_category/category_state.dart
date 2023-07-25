// ignore_for_file: must_be_immutable

part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategoryGetSuccess extends CategoryState {

}
class CategoryError extends CategoryState {
  String error;

  CategoryError(this.error);
}
class SaveUserData extends CategoryState {}
class SetData extends CategoryState{}
class Logout extends CategoryState{}
