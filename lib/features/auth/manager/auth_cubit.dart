import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/auth/data/model/auth_model.dart';
import 'package:medical_app/features/auth/data/repo/authentication_repo.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context)=>BlocProvider.of(context);

  void signup(AuthModel model) async {
    try{
      emit(AuthLoading());
      await AuthenticationRepo.Signup(model: model);

      emit(AuthSuccess());
    }catch(e){
      emit(AuthError(e.toString()));
      print(e);
    }
  }
  void login(AuthModel model) async {
    try{
      emit(AuthLoading());
      await AuthenticationRepo.Login(model: model);
      emit(AuthSuccess());
    }catch(e){
      emit(AuthError(e.toString()));
      print(e);
    }
  }

}
