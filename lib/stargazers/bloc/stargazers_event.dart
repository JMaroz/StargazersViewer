part of 'stargazers_bloc.dart';

class StargazersEvent extends Equatable {
  final GitHubUser user;
  final GitHubUserRepository repository;

  const StargazersEvent({required this.user, required this.repository});

  @override
  List<Object?> get props => [user, repository];
}

