import 'package:flutter/cupertino.dart';

class CompaniesTab extends StatefulWidget {
  const CompaniesTab({Key? key}) : super(key: key);

  @override
  State<CompaniesTab> createState() => _CompaniesTabState();
}

class _CompaniesTabState extends State<CompaniesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('companies'),);
  }
}
