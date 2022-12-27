import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'companies_bloc.dart';

class CompaniesTab extends StatefulWidget {
  const CompaniesTab({Key? key}) : super(key: key);

  @override
  State<CompaniesTab> createState() => _CompaniesTabState();
}

class _CompaniesTabState extends State<CompaniesTab> {
  @override
  Widget build(BuildContext context) {
    CompaniesBloc companiesBloc = BlocProvider.of(context);
    companiesBloc.add(LoadCompaniesEvent());
    return BlocBuilder<CompaniesBloc, CompaniesState>(
      bloc: companiesBloc,
      builder: (context, state) {
        if (state is CompaniesLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CompaniesLoadedState) {
          return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: state.companies.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Row(
                  children: [
                    Column(
                      children: [
                        Text(state.companies[index].name),
                        Text(state.companies[index].description),
                        Text(state.companies[index].industry),
                      ],
                    ),
                  ],
                );
              });
        }
        return Container(
          child: Text('companies'),
        );
      },
    );
  }
}
