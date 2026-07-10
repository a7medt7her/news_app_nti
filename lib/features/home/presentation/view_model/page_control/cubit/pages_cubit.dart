import 'package:bloc/bloc.dart';

class PagesCubit extends Cubit<int> {
  PagesCubit() : super(0);
  void changeIndex(int index) {
    emit(index);
  }
}
