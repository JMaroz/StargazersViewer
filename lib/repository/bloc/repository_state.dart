part of 'repository_bloc.dart';

abstract class RepositoryState extends Equatable {
  const RepositoryState();
}

class RepositoryInitial extends RepositoryState {
  @override
  List<Object> get props => [];
}
