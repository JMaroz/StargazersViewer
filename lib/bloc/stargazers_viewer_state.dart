part of 'stargazers_viewer_bloc.dart';

class StargazersViewerState extends Equatable {
  final GitHubUser? selectedUser;
  final GitHubRepository? selectedRepository;

  const StargazersViewerState({this.selectedUser, this.selectedRepository});

  @override
  List<Object?> get props => [selectedUser, selectedRepository];

  StargazersViewerState copyWith({
    ValueGetter<GitHubUser?>? selectedUser,
    ValueGetter<GitHubRepository?>? selectedRepository,
  }) {
    return StargazersViewerState(
      selectedUser: selectedUser != null ? selectedUser() : this.selectedUser,
      selectedRepository: selectedRepository != null
          ? selectedRepository()
          : this.selectedRepository,
    );
  }
}
