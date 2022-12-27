import '../model/company.dart';
import '../model/job.dart';
import '../repo/company_repo.dart';
import '../repo/job_repo.dart';

class GetJobsUseCase {
  JobRepository jobRepository;

  GetJobsUseCase(this.jobRepository);

  Future<List<Job>> execute() {
    return jobRepository.getAllJobs();
  }
}
