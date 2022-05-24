import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_repository/github_repository.dart';

part 'repository_event.dart';

part 'repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  final GitHubRepository repository;

  RepositoryBloc(this.repository) : super(const RepositoryState()) {
    on<RepositoryEvent>(_loadRepositories);
  }

  FutureOr<void> _loadRepositories(
    RepositoryEvent event,
    Emitter<RepositoryState> emit,
  ) async {
    emit(RepositoryLoading());
    final result = await repository.getRepositories(event.user.login);
    if (result.isSuccess) {
      emit(RepositoryResultSuccess(result.getOrNull()!));
    } else {
      emit(RepositoryResultError(result.exceptionOrNull()?.toString() ??
          "Error while fetching the user repositories"));
    }
  }
}
