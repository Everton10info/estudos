import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_bloc/home_bloc/home_event.dart';
import 'package:poc_bloc/home_bloc/home_state.dart';
import 'package:poc_bloc/repositories/repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    Repository repository = Repository();

    on<HomeLoadEvent>(
      (event, emit) async {
        emit(HomeInitialState());
        await Future.delayed(const Duration(seconds: 3));
        emit(HomeSucessState(teams: []));
      },
    );

    on<HomeAddTeamEvent>(
      ((event, emit) {
        repository.teams.add(event.team);
        emit(HomeSucessState(teams: repository.teams));
      }),
    );

    on<TeamAddScoreEvent>(
      ((event, emit) {
        repository.teams.indexWhere(
          (element) {
            if (element == event.team) {
              element.score += 1;
            }
            return false;
          },
        );
        emit(HomeSucessState(teams: repository.teams));
      }),
    );
  }
}
