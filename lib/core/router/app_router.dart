import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kkumul/features/home/home_screen.dart';
import 'package:kkumul/features/group/group_list_screen.dart';
import 'package:kkumul/features/group/add_group_screen.dart';
import 'package:kkumul/features/group/invite_code_screen.dart';
import 'package:kkumul/features/group/create_group_screen.dart';
import 'package:kkumul/features/group/group_detail_screen.dart';
import 'package:kkumul/features/appointment/add_appointment_screen.dart';
import 'package:kkumul/features/appointment/appointment_detail_screen.dart';
import 'package:kkumul/features/appointment/preparation_status_screen.dart';
import 'package:kkumul/features/mypage/mypage_screen.dart';
import 'package:kkumul/core/router/app_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    // Shell route with bottom navigation
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/groups',
          name: 'groups',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: GroupListScreen(),
          ),
        ),
        GoRoute(
          path: '/mypage',
          name: 'mypage',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MypageScreen(),
          ),
        ),
      ],
    ),

    // Full screen routes (without bottom navigation)
    GoRoute(
      path: '/groups/add',
      name: 'addGroup',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const AddGroupScreen(),
    ),
    GoRoute(
      path: '/groups/invite-code',
      name: 'inviteCode',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const InviteCodeScreen(),
    ),
    GoRoute(
      path: '/groups/create',
      name: 'createGroup',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const CreateGroupScreen(),
    ),
    GoRoute(
      path: '/groups/:groupId',
      name: 'groupDetail',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final groupId = state.pathParameters['groupId']!;
        return GroupDetailScreen(groupId: groupId);
      },
    ),
    GoRoute(
      path: '/appointments/add',
      name: 'addAppointment',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final groupId = state.uri.queryParameters['groupId'];
        return AddAppointmentScreen(groupId: groupId);
      },
    ),
    GoRoute(
      path: '/appointments/:appointmentId',
      name: 'appointmentDetail',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final appointmentId = state.pathParameters['appointmentId']!;
        return AppointmentDetailScreen(appointmentId: appointmentId);
      },
    ),
    GoRoute(
      path: '/appointments/:appointmentId/preparation',
      name: 'preparationStatus',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final appointmentId = state.pathParameters['appointmentId']!;
        return PreparationStatusScreen(appointmentId: appointmentId);
      },
    ),
  ],
);
