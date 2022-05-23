part of 'stargazers_viewer_bloc.dart';

@immutable
abstract class StargazersViewerEvent extends Equatable {
  const StargazersViewerEvent();

  @override
  List<Object> get props => [];
}

class UserSelected extends StargazersViewerEvent {

  final GitHubUser user;

  const UserSelected({required this.user});

  @override
  List<Object> get props => [user];
}

class UserDeselected extends StargazersViewerEvent {
  const UserDeselected();
}

class RepositorySelected extends StargazersViewerEvent {

  final GitHubUser user;
  final GitHubRepository repository;

  const RepositorySelected({required this.user, required this.repository});

  @override
  List<Object> get props => [user];
}

class RepositoryDeselected extends StargazersViewerEvent {

  final GitHubUser user;

  const RepositoryDeselected({required this.user});
}
