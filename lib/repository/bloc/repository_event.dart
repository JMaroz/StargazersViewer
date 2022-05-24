part of 'repository_bloc.dart';

class RepositoryEvent extends Equatable {

  final GitHubUser user;

  const RepositoryEvent(this.user);

  @override
  List<Object?> get props => [user];
}
