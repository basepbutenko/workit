part of 'jobs_bloc.dart';

@immutable
abstract class JobsState {}

class JobsInitial extends JobsState {}

class JobsLoadingState extends JobsState {}

class JobsLoadedState extends JobsState {
  final List<Job> jobs;

  JobsLoadedState(this.jobs);
}
