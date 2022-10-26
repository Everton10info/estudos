import 'package:poc_bloc/models/team_model.dart';

abstract class HomeEvent {}

class HomeLoadEvent extends HomeEvent {}

class HomeAddTeamEvent extends HomeEvent {
  final TeamModel team;
  HomeAddTeamEvent({required this.team});
}

class TeamAddScoreEvent extends HomeEvent {
  final TeamModel team;
  TeamAddScoreEvent({required this.team});
}
