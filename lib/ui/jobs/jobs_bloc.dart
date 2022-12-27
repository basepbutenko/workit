import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workit/domain/model/job.dart';

import '../../domain/usecase/get_jobs_usecase.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  GetJobsUseCase getJobsUseCase;
  JobsBloc(this.getJobsUseCase) : super(JobsInitial()) {
    on<JobsEvent>((event, emit) async {
      if (event is LoadJobsEvent) {
        emit.call(JobsLoadingState());
        List<Job> result = await getJobsUseCase.execute();
        emit.call(JobsLoadedState(result));
      }
    });
  }
}
