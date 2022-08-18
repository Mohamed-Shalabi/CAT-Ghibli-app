import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_session_two/modules/people/view_models/single_person_view_model.dart';

class SinglePersonScreen extends StatelessWidget {
  const SinglePersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SinglePersonViewModel>();
    final person = viewModel.person;

    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ID: ${person.id}',
            ),
            Text(
              'Gender: ${person.gender.name}',
            ),
            Text(
              'Age: ${person.age}',
            ),
            Text(
              'Hair color: ${person.hairColor}',
            ),
          ],
        )
      ),
    );
  }
}
