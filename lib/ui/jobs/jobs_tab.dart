import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'jobs_bloc.dart';

class JobsTab extends StatefulWidget {
  const JobsTab({Key? key}) : super(key: key);

  @override
  State<JobsTab> createState() => _JobTabState();
}

class _JobTabState extends State<JobsTab> {
  @override
  Widget build(BuildContext context) {
    JobsBloc jobsBloc = BlocProvider.of(context);
    jobsBloc.add(LoadJobsEvent());
    return BlocBuilder<JobsBloc, JobsState>(
      bloc: jobsBloc,
      builder: (context, state) {
        if (state is JobsLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is JobsLoadedState) {
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
    );
  }
}
