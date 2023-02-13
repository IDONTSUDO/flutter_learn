import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/core/core.dart';
import 'package:learn/core/navigation/navigation.dart';

part './data/data_source/navigation_hub_data_source.dart';
part './data/repositories/navigation_hub_repository.dart';
part './domain/models/number_trivia.dart';
part './presentation/screen/navigation_hub_screen.dart';
part './presentation/screen/logic/navigation_hub_state.dart';
part './presentation/screen/logic/navigation_hub_cubit.dart';
part './domain/use_cases/get_number_trivia_use_case.dart';
