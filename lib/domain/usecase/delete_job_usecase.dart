import '../model/company.dart';
import '../repo/company_repo.dart';
import '../repo/job_repo.dart';

class DeleteJobUseCase {
  JobRepository jobRepository;

  DeleteJobUseCase(this.jobRepository);

  Future<void> execute(int jobId) {
    return jobRepository.deleteJob(jobId);
  }
}
