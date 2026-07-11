import 'package:bloc/bloc.dart';

class IsSearchedCubit extends Cubit<bool> {
  IsSearchedCubit() : super(false);
  void isSearched(bool done) {
    emit(done);
  }
}
