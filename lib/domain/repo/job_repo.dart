import '../model/job.dart';

abstract class JobRepository{
  Future<List<Job>>getAllJobs();
  Future<List<Job>> getAllJobsOfCompany(String companyID);
}