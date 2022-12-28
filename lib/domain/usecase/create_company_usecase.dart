import '../model/company.dart';
import '../repo/company_repo.dart';

class CreateCompanyUseCase {
  CompanyRepository companyRepository;

  CreateCompanyUseCase(this.companyRepository);

  Future<void> execute(String name, String description, String industry) {
    return companyRepository.createCompany(name, description, industry);
  }
}
