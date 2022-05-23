import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_repository/github_repository.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GitHubRepository repository;

  SearchBloc(this.repository) : super(const SearchState()) {
    on<SearchEvent>(_onSearchEvent);
  }

  FutureOr<void> _onSearchEvent(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    if (event.query.isEmpty) {
      return emit(
        const SearchState(),
      );
    } else if (event.query.length <= 2) {
      return emit(
        const SearchResultError("The name is too short, add some character"),
      );
    } else {
      final result = await repository.searchUser(event.query);
      if (result.isSuccess) {
        emit(SearchResultSuccess(
          result.getOrNull()!.item1,
          result.getOrNull()!.item2,
        ));
      } else {
        emit(SearchResultError(result.exceptionOrNull()?.toString() ??
            "Error while searching the users"));
      }
    }
  }
}
