import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/repository/bloc/repository_bloc.dart';
import 'package:stargazersviewer/repository/view/repository_list.dart';

class RepositoryView extends StatelessWidget {
  final GitHubUser user;

  const RepositoryView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${user.login}'s repositories")),
      body: BlocListener<RepositoryBloc, RepositoryState>(
        listener: (context, state) {
          if (state is RepositoryResultError) {
            final snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<RepositoryBloc, RepositoryState>(
          builder: (context, state) {
            if (state is RepositoryResultSuccess) {
              return RepositoryList(
                repositories: state.userRepositories,
                user: user,
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
