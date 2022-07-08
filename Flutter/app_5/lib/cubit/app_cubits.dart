import 'package:app_5/cubit/app_cubit_states.dart';
import 'package:app_5/model/data_model.dart';
import 'package:app_5/services/data_services.dart';
import 'package:bloc/bloc.dart';

class AppCubits extends Cubit<CubitStates> {
  
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      // print(e);
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }

}
