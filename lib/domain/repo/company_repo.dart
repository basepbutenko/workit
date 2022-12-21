import 'package:workit/domain/model/company.dart';

abstract class CompanyRepository{
  Future<List<Company>>getAllCompanies();

}