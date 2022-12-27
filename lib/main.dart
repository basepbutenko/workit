import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workit/data/company_repo_impl.dart';
import 'package:workit/data/datasource/network_datasource.dart';
import 'package:workit/data/job_repo_impl.dart';
import 'package:workit/domain/repo/company_repo.dart';
import 'package:workit/domain/repo/job_repo.dart';
import 'package:workit/domain/usecase/get_companies_usecase.dart';
import 'package:workit/domain/usecase/get_jobs_usecase.dart';
import 'package:workit/ui/companies/companies_bloc.dart';
import 'package:workit/ui/companies/companies_tab.dart';
import 'package:workit/ui/company/company_bloc.dart';
import 'package:workit/ui/jobs/jobs_bloc.dart';
import 'package:workit/ui/jobs/jobs_tab.dart';

import 'domain/usecase/get_jobs_of_company_usecase.dart';

void main() {
  NetworkDataSource networkDataSource = NetworkDataSource();
  CompanyRepository companyRepository =
      CompanyRepositoryImpl(networkDataSource);
  GetCompaniesUseCase getCompaniesUseCase =
      GetCompaniesUseCase(companyRepository);
  JobRepository jobRepository = JobRepositoryImpl(networkDataSource);
  GetJobsUseCase getJobsUseCase = GetJobsUseCase(jobRepository);
  GetJobsOfCompanyUseCase getJobsOfCompanyUseCase =
      GetJobsOfCompanyUseCase(jobRepository);
  runApp(MyApp(getCompaniesUseCase, getJobsUseCase, getJobsOfCompanyUseCase));
}

class MyApp extends StatelessWidget {
  GetJobsUseCase getJobsUseCase;
  GetCompaniesUseCase getCompaniesUseCase;
  GetJobsOfCompanyUseCase getJobsOfCompanyUseCase;

  MyApp(this.getCompaniesUseCase, this.getJobsUseCase,
      this.getJobsOfCompanyUseCase,
      {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CompaniesBloc(getCompaniesUseCase),
        ),
        BlocProvider(create: (context) => JobsBloc(getJobsUseCase)),
        BlocProvider(create: (context) => CompanyBloc(getJobsOfCompanyUseCase))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[CompaniesTab(), JobsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'COMPANIES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'JOBS',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
