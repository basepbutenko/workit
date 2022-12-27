import '../model/company.dart';
import '../model/job.dart';
import '../repo/company_repo.dart';
import '../repo/job_repo.dart';

class GetJobsOfCompanyUseCase {
  JobRepository jobRepository;

  GetJobsOfCompanyUseCase(this.jobRepository);

  Future<List<Job>> execute(String companyID) {
    return jobRepository.getAllJobsOfCompany(companyID);
  }
}
