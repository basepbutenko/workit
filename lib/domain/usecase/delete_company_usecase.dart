import '../model/company.dart';
import '../repo/company_repo.dart';

class DeleteCompanyUseCase {
  CompanyRepository companyRepository;

  DeleteCompanyUseCase(this.companyRepository);

  Future<void> execute(int companyId) {
    return companyRepository.deleteCompany(companyId);
  }
}
