import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_repository/src/github_repository.dart';

part 'stargazers_event.dart';

part 'stargazers_state.dart';

class StargazersBloc extends Bloc<StargazersEvent, StargazersState> {

  final GitHubRepository repository;

  StargazersBloc(this.repository) : super(const StargazersState()) {
    on<StargazersEvent>(_loadStargazers);
  }

  FutureOr<void> _loadStargazers(
    StargazersEvent event,
    Emitter<StargazersState> emit,
  ) async {
    emit(StargazersLoading());
    final result  = await repository.getStargazers(event.user.login, event.repository.name);
    if (result.isSuccess) {
      emit(StargazersResultSuccess(
        result.getOrNull()!,
      ));
    } else {
      emit(StargazersResultError(result.exceptionOrNull()?.toString() ??
          "Error while fetching the stargazers users"));
    }
  }
}
