import 'package:workit/data/datasource/network_datasource.dart';
import 'package:workit/domain/model/company.dart';
import 'package:workit/domain/repo/company_repo.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  NetworkDataSource networkDataSource;

  CompanyRepositoryImpl(this.networkDataSource);

  @override
  Future<List<Company>> getAllCompanies() {
    return networkDataSource.getAllCompanies();
  }

  @override
  Future<void> createCompany(String name, String description, String industry) {
    return networkDataSource.createCompany(name, description, industry);
  }

  @override
  Future<void> deleteCompany(int companyId) {
    return networkDataSource.deleteCompany(companyId);
  }

}
