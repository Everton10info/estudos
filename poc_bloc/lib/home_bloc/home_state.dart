import 'package:poc_bloc/models/team_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {
  HomeInitialState();
}

class HomeLoadeState extends HomeState {
  HomeLoadeState();
}

class HomeSucessState extends HomeState {
  List<TeamModel> teams;
  HomeSucessState({required this.teams});
}

class ScoreSucessState extends HomeState {
  List<TeamModel> teams;
  ScoreSucessState(this.teams);
}
