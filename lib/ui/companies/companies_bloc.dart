import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/model/company.dart';
import '../../domain/usecase/create_company_usecase.dart';
import '../../domain/usecase/get_companies_usecase.dart';

part 'companies_event.dart';

part 'companies_state.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesState> {
  GetCompaniesUseCase getCompaniesUseCase;
  CreateCompanyUseCase createCompanyUseCase;

  CompaniesBloc(this.getCompaniesUseCase, this.createCompanyUseCase)
      : super(CompaniesInitial()) {
    on<CompaniesEvent>((event, emit) async {
      if (event is LoadCompaniesEvent) {
        emit.call(CompaniesLoadingState());
        List<Company> result = await getCompaniesUseCase.execute();
        emit.call(CompaniesLoadedState(result));
      } else if (event is CreateCompanyEvent) {
        await createCompanyUseCase.execute(
            event.name, event.description, event.industry);
        add(LoadCompaniesEvent());
      }
    });
  }
}
