import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/model/company.dart';
import '../../domain/usecase/get_companies_usecase.dart';

part 'companies_event.dart';

part 'companies_state.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesState> {
  GetCompaniesUseCase getCompaniesUseCase;

  CompaniesBloc(this.getCompaniesUseCase) : super(CompaniesInitial()) {
    on<CompaniesEvent>((event, emit) {

      // TODO: implement event handler
    });
  }
}
