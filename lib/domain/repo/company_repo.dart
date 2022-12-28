import 'package:workit/domain/model/company.dart';

abstract class CompanyRepository{
  Future<List<Company>>getAllCompanies();
  Future<void> deleteCompany(int companyId);
  Future<void> createCompany(String name, String description, String industry);

}