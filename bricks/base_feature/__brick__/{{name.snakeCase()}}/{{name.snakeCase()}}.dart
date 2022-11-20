import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/core/core.dart';

part './data/data_source/{{name.snakeCase()}}_data_source.dart';
part './data/repositories/{{name.snakeCase()}}_repository.dart';
part './domain/models/number_trivia.dart';
part './presentation/screen/{{name.snakeCase()}}_screen.dart';
part './presentation/screen/logic/{{name.snakeCase()}}_state.dart';
part './presentation/screen/logic/{{name.snakeCase()}}_cubit.dart';
part './domain/use_cases/get_number_trivia_use_case.dart';
