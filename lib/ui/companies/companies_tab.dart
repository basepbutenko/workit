import 'package:flutter/cupertino.dart';
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
          return Container(
            child: Text('loading'),
          );
        } else if (state is CompaniesLoadedState) {
          return Container(
            child: Text('loaded'),
          );
        }
        return Container(
          child: Text('companies'),
        );
      },
    );
  }
}
