part of 'jobs_bloc.dart';

@immutable
abstract class JobsEvent {}

class LoadJobsEvent extends JobsEvent {}

class CreateJobEvent extends JobsEvent {
  String title;
  String description;
  String city;
  int companyId;

  CreateJobEvent(this.title, this.description, this.city, this.companyId);
}
