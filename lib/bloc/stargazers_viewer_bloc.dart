import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:github_repository/github_repository.dart';
import 'package:meta/meta.dart';

part 'stargazers_viewer_event.dart';

part 'stargazers_viewer_state.dart';

class StargazersViewerBloc
    extends Bloc<StargazersViewerEvent, StargazersViewerState> {
  StargazersViewerBloc() : super(const StargazersViewerState()) {
    on<UserSelected>((event, emit) {
      emit(state.copyWith(
        selectedUser: () => event.user,
        selectedRepository: () => null,
      ));
    });
    on<RepositorySelected>((event, emit) {
      emit(state.copyWith(
          selectedUser: () => event.user,
          selectedRepository: () => event.repository));
    });
  }
}
