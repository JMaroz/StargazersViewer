import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/stargazers/bloc/stargazers_bloc.dart';
import 'package:stargazersviewer/stargazers/view/stargazers_list.dart';

class StargazersView extends StatelessWidget {
  final GitHubUser user;
  final GitHubUserRepository repository;

  const StargazersView({Key? key, required this.user, required this.repository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${user.login}'s repositories")),
      body: BlocListener<StargazersBloc, StargazersState>(
        listener: (context, state) {
          if (state is StargazersResultError) {
            final snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<StargazersBloc, StargazersState>(
          builder: (context, state) {
            if (state is StargazersResultSuccess) {
              return StargazersList(
                users: state.users,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
