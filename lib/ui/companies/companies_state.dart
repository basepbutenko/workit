part of 'companies_bloc.dart';

@immutable
abstract class CompaniesState {}

class CompaniesInitial extends CompaniesState {}
class CompaniesLoadingState extends CompaniesState {}

class CompaniesLoadedState extends CompaniesState {
  final List<Company> companies;

  CompaniesLoadedState(this.companies);
}