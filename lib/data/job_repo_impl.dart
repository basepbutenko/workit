import 'package:workit/data/datasource/network_datasource.dart';
import 'package:workit/domain/model/job.dart';
import 'package:workit/domain/repo/job_repo.dart';

class JobRepositoryImpl implements JobRepository {
  NetworkDataSource networkDataSource;

  JobRepositoryImpl(this.networkDataSource);

  @override
  Future<List<Job>> getAllJobs() {
    return networkDataSource.getAllJobs();
  }
  @override
  Future<List<Job>> getAllJobsOfCompany(String companyID) {
    return networkDataSource.getAllJobsOfCompany(companyID);
  }

  @override
  Future<void> createJob(String title, String description, String city, int companyId) {
    return networkDataSource.createJob(title, description, city, companyId);
  }

  @override
  Future<void> deleteJob(int jobId) {
    return networkDataSource.deleteJob(jobId);
  }
}
