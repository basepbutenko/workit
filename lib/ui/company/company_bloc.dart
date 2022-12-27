import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/model/job.dart';
import '../../domain/usecase/get_jobs_of_company_usecase.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  GetJobsOfCompanyUseCase getJobsOfCompanyUseCase;
  CompanyBloc(this.getJobsOfCompanyUseCase) : super(CompanyInitial()) {
    on<CompanyEvent>((event, emit) async {
      if (event is LoadCompanyEvent) {
        emit.call(CompanyJobsLoadingState());
        List<Job> result = await getJobsOfCompanyUseCase.execute(event.companyID);
        emit.call(CompanyJobsLoadedState(result));
      }
    });
  }
}
