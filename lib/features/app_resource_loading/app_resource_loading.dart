import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn/core/core.dart';
import 'package:learn/core/navigation/navigation.dart';
import 'package:learn/features/authorization/authorization.dart';
import 'package:learn/features/navigation_hub/navigation_hub.dart';

part './data/data_source/app_resource_loading_data_source.dart';
part './data/repositories/app_resource_loading_repository.dart';
part './presentation/screen/app_resource_loading_screen.dart';
part './presentation/screen/logic/app_resource_loading_cubit.dart';
part './presentation/screen/logic/app_resource_loading_state.dart';
part 'domain/use_cases/user_is_authorized_use_case.dart';
