part of 'companies_bloc.dart';

@immutable
abstract class CompaniesEvent {}

class LoadCompaniesEvent extends CompaniesEvent {}

class CreateCompanyEvent extends CompaniesEvent {
  String name;
  String description;
  String industry;

  CreateCompanyEvent(this.name, this.description, this.industry);
}
