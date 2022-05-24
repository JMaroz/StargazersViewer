part of 'stargazers_bloc.dart';

class StargazersState extends Equatable {
  const StargazersState();
  @override
  List<Object> get props => [];
}

class StargazersLoading extends StargazersState {}

class StargazersResultSuccess extends StargazersState {
  final List<GitHubUser> users;

  const StargazersResultSuccess(this.users);

  @override
  List<Object> get props => [users];
}

class StargazersResultError extends StargazersState {
  final String errorMessage;

  const StargazersResultError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}