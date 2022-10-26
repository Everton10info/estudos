import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poc_bloc/home_bloc/home_bloc.dart';
import 'package:poc_bloc/home_bloc/home_event.dart';
import 'package:poc_bloc/home_bloc/home_state.dart';
import 'package:poc_bloc/models/team_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _teamName = TextEditingController();
  final _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(HomeLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Bloc'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _teamName,
                maxLength: 15,
              ),
              Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                bloc: _homeBloc,
                builder: ((context, state) {
                  if (state is HomeInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is HomeSucessState) {
                    return GridView.builder(
                      itemCount: state.teams.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(state.teams[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              BlocBuilder<HomeBloc, HomeState>(
                                bloc: _homeBloc,
                                builder: ((context, state) {
                                  if (state is HomeSucessState) {
                                    return Text(
                                      'Score : ${state.teams[index].score}',
                                      style: const TextStyle(fontSize: 16),
                                    );
                                  }
                                  return Container();
                                }),
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {
                                    _homeBloc.add(TeamAddScoreEvent(
                                        team: state.teams[index]));
                                  },
                                  icon: const Icon(Icons.add_circle_outline)),
                            ],
                          ),
                        );
                      }),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                    );
                  }

                  return Container();
                }),
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _homeBloc.add(
              HomeAddTeamEvent(
                team: TeamModel(name: _teamName.text, score: 0),
              ),
            );
            _teamName.text = '';
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
