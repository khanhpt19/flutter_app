import 'package:flutter/material.dart';
import 'package:flutter_app/core/widgets/index.dart';
import 'package:flutter_app/presentations/home/bloc/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePageBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        cubit: GetIt.instance.get<HomeBloc>(),
        builder: (_, state) {
          return AppMovieList(movieList: state.movieList);
        },
      ),
    );
  }
}
