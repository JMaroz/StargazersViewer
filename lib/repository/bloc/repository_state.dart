part of 'repository_bloc.dart';

class RepositoryState extends Equatable {
  const RepositoryState();
  @override
  List<Object> get props => [];
}

class RepositoryLoading extends RepositoryState {}

class RepositoryResultSuccess extends RepositoryState {
  final List<GitHubUserRepository> userRepositories;

  const RepositoryResultSuccess(this.userRepositories);

  @override
  List<Object> get props => [userRepositories];
}

class RepositoryResultError extends RepositoryState {
  final String errorMessage;

  const RepositoryResultError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

