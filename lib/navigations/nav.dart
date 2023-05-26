import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../../backend/backend.dart';
import '../../index.dart';
import '../../main.dart';
import '../providers/app_state_provider.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
          routes: [
            FFRoute(
              name: 'CreateAnAccount',
              path: 'createAnAccount',
              builder: (context, params) => CreateAnAccountWidget(),
            ),
            FFRoute(
              name: 'LoginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'ForgotPassword',
              path: 'forgotPassword',
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'SignIn',
              path: 'signIn',
              builder: (context, params) => SignInWidget(),
            ),


            FFRoute(
              name: 'AllEmployeeWidgets',
              path: 'AllEmployeeWidgets',
              builder: (context, params) => AllEmployeesWidget(),
            ),
            FFRoute(
              name: 'ChooseProfile',
              path: 'chooseProfile',
              builder: (context, params) => ChooseProfileWidget(),
            ),
            FFRoute(
              name: 'EmailPasswordReset',
              path: 'emailPasswordReset',
              builder: (context, params) => EmailPasswordResetWidget(),
            ),
            FFRoute(
              name: 'ResetPassword',
              path: 'resetPassword',
              builder: (context, params) => ResetPasswordWidget(),
            ),
            FFRoute(
              name: 'Profile',
              path: 'profile',
              builder: (context, params) => ProfileWidget(),
            ),
            FFRoute(
              name: 'ForgotPasswordOtp',
              path: 'forgotPasswordOtp',
              builder: (context, params) => ForgotPasswordOtpWidget(),
            ),
            FFRoute(
              name: 'EmployerProfileForm',
              path: 'employerProfileForm',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'EmployerProfileForm')
                  : EmployerProfileFormWidget(),
            ),
            FFRoute(
              name: 'JobCategory',
              path: 'jobCategory',
              builder: (context, params) => JobCategoryWidget(),
            ),
            FFRoute(
              name: 'JobPosting',
              path: 'jobPosting',
              builder: (context, params) => JobPostingWidget(),
            ),
            FFRoute(
              name: 'CreateJobPage',
              path: 'createJobPage',
              builder: (context, params) => CreateJobPageWidget(),
            ),
            FFRoute(
              name: 'AddRequirements',
              path: 'addRequirements',
              builder: (context, params) => AddRequirementsWidget(
                vacancyRef: params.getParam('vacancyRef',
                    ParamType.DocumentReference, false, ['vacancy']),
              ),
            ),
            FFRoute(
              name: 'EmployeeJobDetailsView',
              path: 'employeeJobDetailsView',
              builder: (context, params) => EmployeeJobDetailsViewWidget(
                details: params.getParam(
                    'details', ParamType.DocumentReference, false, ['vacancy']),
              ),
            ),
            FFRoute(
              name: 'JobPostSuccess',
              path: 'jobPostSuccess',
              builder: (context, params) => JobPostSuccessWidget(),
            ),
            FFRoute(
              name: 'SwipeScreen',
              path: 'swipeScreen',
              builder: (context, params) => SwipeScreenWidget(),
            ),
            FFRoute(
              name: 'SwipeScreenEmployee',
              path: 'swipeScreenEmployee',
              builder: (context, params) => SwipeScreenEmployeeWidget(),
            ),
            FFRoute(
              name: 'EmployerJobDetailsView',
              path: 'employerJobDetailsView',
              builder: (context, params) => EmployerJobDetailsViewWidget(
                details: params.getParam(
                    'details', ParamType.DocumentReference, false, ['vacancy']),
              ),
            ),
            FFRoute(
              name: 'EmployeePendingMatchRepl',
              path: 'employeePendingMatchRepl',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: EmployeePendingMatchReplWidget(),
              ),
            ),
            FFRoute(
              name: 'EmployerPendingMatchReply',
              path: 'employerPendingMatchReply',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'EmployerPendingMatchReply')
                  : EmployerPendingMatchReplyWidget(),
            ),
            FFRoute(
              name: 'SavedLikedEmployeeScreen',
              path: 'savedLikedEmployeeScreen',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'SavedLikedEmployeeScreen')
                  : NavBarPage(
                      initialPage: 'SavedLikedEmployeeScreen',
                      page: SavedLikedEmployeeScreenWidget(),
                    ),
            ),
            FFRoute(
              name: 'MatchedPage',
              path: 'matchedPage',
              builder: (context, params) => MatchedPageWidget(),
            ),
            FFRoute(
              name: 'Settings',
              path: 'settings',
              builder: (context, params) => SettingsWidget(),
            ),
            FFRoute(
              name: 'Security',
              path: 'security',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: SecurityWidget(),
              ),
            ),
            FFRoute(
              name: 'Notification',
              path: 'notification',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Notification')
                  : NotificationWidget(),
            ),
            FFRoute(
              name: 'Appearance',
              path: 'appearance',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: AppearanceWidget(),
              ),
            ),
            FFRoute(
              name: 'Help',
              path: 'help',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: HelpWidget(),
              ),
            ),
            FFRoute(
              name: 'TermsAndConditions',
              path: 'termsAndConditions',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: TermsAndConditionsWidget(),
              ),
            ),
            FFRoute(
              name: 'PrivacyPolicy',
              path: 'privacyPolicy',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: PrivacyPolicyWidget(),
              ),
            ),
            FFRoute(
              name: 'JobPostingListDisplay',
              path: 'jobPostingListDisplay',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: JobPostingListDisplayWidget(),
              ),
            ),
            FFRoute(
              name: 'ChatScreen',
              path: 'chatScreen',
              builder: (context, params) => ChatScreenWidget(),
            ),
            FFRoute(
              name: 'SwipeScreenEmployer',
              path: 'swipeScreenEmployer',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'SwipeScreenEmployer')
                  : SwipeScreenEmployerWidget(),
            ),
            FFRoute(
              name: 'EmployerAssignJob',
              path: 'employerAssignJob',
              builder: (context, params) => EmployerAssignJobWidget(
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'AllEmployees',
              path: 'allEmployees',
              builder: (context, params) => AllEmployeesWidget(),
            ),
            FFRoute(
              name: 'AllAssignedJobs',
              path: 'allAssignedJobs',
              builder: (context, params) => AllAssignedJobsWidget(),
            ),
            FFRoute(
              name: 'ErrandMapDisplay',
              path: 'errandMapDisplay',
              builder: (context, params) => ErrandMapDisplayWidget(
                errandRef: params.getParam('errandRef',
                    ParamType.DocumentReference, false, ['errands']),
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'selectDestinationPage',
              path: 'selectDestinationPage',
              builder: (context, params) => SelectDestinationPageWidget(),
            ),
            FFRoute(
              name: 'findingRidePage',
              path: 'findingRidePage',
              builder: (context, params) => FindingRidePageWidget(
                rideDetailsReference: params.getParam('rideDetailsReference',
                    ParamType.DocumentReference, false, ['ride']),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/jemcap-low-resolution-logo-color-on-transparent-background.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}