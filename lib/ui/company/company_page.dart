import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workit/domain/model/company.dart';
import 'package:workit/ui/company/company_bloc.dart';
import 'package:workit/ui/company/company_bloc.dart';

import '../jobs/create_job_dialog.dart';

class CompanyPage extends StatefulWidget {
  String companyID;
   CompanyPage(this.companyID,{Key? key}) : super(key: key);

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    CompanyBloc jobsBloc = BlocProvider.of(context);
    jobsBloc.add(LoadCompanyEvent(widget.companyID));
    return Scaffold(
      body: BlocBuilder<CompanyBloc, CompanyState>(
        bloc: jobsBloc,
        builder: (context, state) {
          if (state is CompanyJobsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CompanyJobsLoadedState) {
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: state.jobs.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          Text(state.jobs[index].title),
                          Text(state.jobs[index].description),
                          Text(state.jobs[index].city),
                        ],
                      ),
                    ],
                  );
                });
          }
          return Container(
            child: Text('jobs'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CreateJobDialog(int.parse(widget.companyID));
                });
        },
        icon: Icon(Icons.add),
        label: Text("ADD"),
      ),
    );
  }
}
