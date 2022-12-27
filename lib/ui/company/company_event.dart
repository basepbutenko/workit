part of 'company_bloc.dart';

@immutable
abstract class CompanyEvent {}
class LoadCompanyEvent extends CompanyEvent{
  String companyID;

  LoadCompanyEvent(this.companyID);
}
