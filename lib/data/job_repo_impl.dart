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
}
