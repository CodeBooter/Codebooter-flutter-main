import 'package:codebooter_study_app/Screens/CourseScreen.dart';
import 'package:codebooter_study_app/Screens/ExamNoteScreen.dart';
import 'package:codebooter_study_app/Screens/InterviewPrepScreen.dart';
import 'package:codebooter_study_app/Screens/SavedItem.dart';
import 'package:codebooter_study_app/authentication/LoginPage.dart';
import 'package:codebooter_study_app/authentication/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Screens/DsaScreen.dart';
import '../Screens/ErrorScreen.dart';
import '../home/HomeScreen.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        color: Colors.transparent,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        // routerDelegate: appRouter().router.routerDelegate,
        // routeInformationParser: appRouter().router.routeInformationParser,
        // routeInformationProvider: appRouter().router.routeInformationProvider,
        debugShowCheckedModeBanner: false);
  }

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            path: 'homepage',
            builder: (BuildContext context, GoRouterState state) =>
                HomeScreen(),
          ),
          GoRoute(
            path: 'dsa',
            builder: (BuildContext context, GoRouterState state) =>
                const DsaScreen(),
          ),
          GoRoute(
            path: 'courses',
            builder: (BuildContext context, GoRouterState state) =>
                const CourseScreen(),
          ),
          GoRoute(
            path: 'interview',
            builder: (BuildContext context, GoRouterState state) =>
                const InterviewPrepScreen(),
          ),
          GoRoute(
            path: 'notes',
            builder: (BuildContext context, GoRouterState state) =>
                const ExamNoteScreen(),
          ),
          GoRoute(
            path: 'saveditems',
            builder: (BuildContext context, GoRouterState state) =>
                const SavedItem(),
          ),
          // GoRoute(
          //   path: 'courses',
          //   builder: (BuildContext context, GoRouterState state) =>
          //       const CourseScreen(),
          // ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          // Check if the user is authenticated
          final isAuthenticated = AuthService().isAuthenticated();
          // final isLogout = sideBar().clickedLogout;

          // If authenticated, redirect to HomePage
          if (!isAuthenticated) {
            return LoginPage();
          } else {
            // Otherwise, show the LoginPage
            return HomeScreen();
          }
        },
      ),
    ],
  );
}
