part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {}

class SearchResultSuccess extends SearchState {
  final List<GitHubUser> usersFound;
  final bool hasMore;

  const SearchResultSuccess(this.usersFound, this.hasMore);

  @override
  List<Object> get props => [usersFound, hasMore];
}

class SearchResultError extends SearchState {
  final String errorMessage;

  const SearchResultError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
