import '../model/company.dart';
import '../repo/company_repo.dart';
import '../repo/job_repo.dart';

class CreateJobUseCase {
  JobRepository jobRepository;

  CreateJobUseCase(this.jobRepository);

  Future<void> execute(
      String title, String description, String city, int companyId) {
    return jobRepository.createJob(title, description, city, companyId);
  }
}
