part of 'company_bloc.dart';

@immutable
abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyJobsLoadingState extends CompanyState {}

class CompanyJobsLoadedState extends CompanyState {
  final List<Job> jobs;

  CompanyJobsLoadedState(this.jobs);
}
