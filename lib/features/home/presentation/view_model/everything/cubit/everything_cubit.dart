import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_nti/features/home/data/model/news_model.dart';
import 'package:news_app_nti/features/home/data/repo/news_repo.dart';

part 'everything_state.dart';

class EverythingCubit extends Cubit<EverythingState> {
  EverythingCubit() : super(EverythingInitial());
  Future everything(String q, String sortBy) async {
    emit(EverythingLoading());
    final data = await NewsRepo.getEverything(q, sortBy);
    data.fold(
      (l) {
        emit(EverythingError(errorMassage: l));
      },
      (r) {
        emit(EverythingSuccess(everything: r));
      },
    );
  }
}
