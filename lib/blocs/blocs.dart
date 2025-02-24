import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/blocs/local/diagram_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> get providers => [
      BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      BlocProvider<DiagramBloc>(create: (context) => DiagramBloc()),
    ];
