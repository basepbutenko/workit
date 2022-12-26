import 'package:flutter/cupertino.dart';

class JobsTab extends StatefulWidget {
  const JobsTab({Key? key}) : super(key: key);

  @override
  State<JobsTab> createState() => _JobTabState();
}

class _JobTabState extends State<JobsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('job'),);
  }
}
