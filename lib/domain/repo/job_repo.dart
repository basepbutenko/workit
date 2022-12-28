import '../model/job.dart';

abstract class JobRepository {
  Future<List<Job>> getAllJobs();

  Future<List<Job>> getAllJobsOfCompany(String companyID);

  Future<void> createJob(
      String title, String description, String city, int companyId);

  Future<void> deleteJob(int jobId);
}
