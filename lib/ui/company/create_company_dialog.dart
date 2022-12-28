import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../companies/companies_bloc.dart';

class CreateCompanyDialog extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController industryController = TextEditingController();

  CreateCompanyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('CREATE COMPANY'),
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
                    const InputDecoration.collapsed(hintText: 'industry'),
                controller: industryController,
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
            CompaniesBloc companiesBloc = BlocProvider.of(context);
            companiesBloc.add(CreateCompanyEvent(nameController.text, descriptionController.text, industryController.text));
            Navigator.pop(context);
          },
          child: Text('Ok!'),
        )
      ],
    );
  }
}
