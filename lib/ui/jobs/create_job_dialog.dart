import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../companies/companies_bloc.dart';
import '../company/company_bloc.dart';
import 'jobs_bloc.dart';

class CreateJobDialog extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  int companyId;

  CreateJobDialog(this.companyId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('CREATE JOB'),
      content: Column(
        children: [
          Container(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration.collapsed(hintText: 'name'),
                controller: nameController,
              ),
            ),
          ),
          Container(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration:
                    const InputDecoration.collapsed(hintText: 'description'),
                controller: descriptionController,
              ),
            ),
          ),
          Container(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration:
                    const InputDecoration.collapsed(hintText: 'city'),
                controller: cityController,
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close')),
        TextButton(
          onPressed: () {
            JobsBloc jobsBloc = BlocProvider.of(context);
            jobsBloc.add(CreateJobEvent(nameController.text,
                descriptionController.text, cityController.text,companyId));
            Navigator.pop(context);
            CompanyBloc companyBloc = BlocProvider.of(context);
            companyBloc.add(LoadCompanyEvent(companyId.toString()));
          },
          child: Text('Ok!'),
        )
      ],
    );
  }
}
