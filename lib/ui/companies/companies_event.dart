part of 'companies_bloc.dart';

@immutable
abstract class CompaniesEvent {}

class CompaniesLoadingState extends CompaniesEvent {}

class CompaniesLoadedState extends CompaniesEvent {
  final List<Company> companies;

  CompaniesLoadedState(this.companies);
}
