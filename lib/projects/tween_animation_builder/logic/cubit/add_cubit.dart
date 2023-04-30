import 'package:bloc/bloc.dart';

class AddCubit extends Cubit<int> {
  AddCubit() : super(0);

  addButtonPressed() => emit(state + 1);
}
