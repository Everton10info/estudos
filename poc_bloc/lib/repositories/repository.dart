import '../models/team_model.dart';

class Repository {
  List<TeamModel> teams = [];

  List<TeamModel> addTeam(TeamModel team) {
    teams.add(team);
    return teams;
  }

  TeamModel addScore(TeamModel team) {
    team.score += 1;
    return team;
  }
}
