import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/core/core.dart';
import 'package:learn/core/navigation/navigation.dart';
import 'package:learn/ui/ui.dart';

part './data/data_source/authorization_data_source.dart';
part './data/repositories/authorization_repository.dart';
part 'domain/models/user_model.dart';
part './presentation/screen/authorization_screen.dart';
part './presentation/screen/logic/authorization_state.dart';
part './presentation/screen/logic/authorization_cubit.dart';
part 'domain/use_cases/authorization_user_use_case.dart';
