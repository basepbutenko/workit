import '../model/company.dart';
import '../repo/company_repo.dart';

class GetCompaniesUseCase {
  CompanyRepository companyRepository;

  GetCompaniesUseCase(this.companyRepository);

  Future<List<Company>> execute() {
    return companyRepository.getAllCompanies();
  }
}
