import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => NavBarPage(),
        ),
        FFRoute(
          name: TachesWidget.routeName,
          path: TachesWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Taches')
              : TachesWidget(),
        ),
        FFRoute(
          name: AuthentificationWidget.routeName,
          path: AuthentificationWidget.routePath,
          builder: (context, params) => AuthentificationWidget(
            token: params.getParam(
              'token',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EditTachesWidget.routeName,
          path: EditTachesWidget.routePath,
          builder: (context, params) => EditTachesWidget(),
        ),
        FFRoute(
          name: TcheexceptionnelWidget.routeName,
          path: TcheexceptionnelWidget.routePath,
          builder: (context, params) => TcheexceptionnelWidget(),
        ),
        FFRoute(
          name: AppareilsWidget.routeName,
          path: AppareilsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Appareils')
              : AppareilsWidget(
                  technicianDevices: params.getParam(
                    'technicianDevices',
                    ParamType.DataStruct,
                    isList: false,
                    structBuilder: DeviceStruct.fromSerializableMap,
                  ),
                ),
        ),
        FFRoute(
          name: GpsWidget.routeName,
          path: GpsWidget.routePath,
          builder: (context, params) => GpsWidget(
            imei: params.getParam(
              'imei',
              ParamType.String,
            ),
            simNumber: params.getParam(
              'simNumber',
              ParamType.String,
            ),
            model: params.getParam(
              'model',
              ParamType.String,
            ),
            brand: params.getParam(
              'brand',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SimWidget.routeName,
          path: SimWidget.routePath,
          builder: (context, params) => SimWidget(),
        ),
        FFRoute(
          name: AccessoiresWidget.routeName,
          path: AccessoiresWidget.routePath,
          builder: (context, params) => AccessoiresWidget(),
        ),
        FFRoute(
          name: AppareilsdesintallsWidget.routeName,
          path: AppareilsdesintallsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Appareilsdesintalls')
              : AppareilsdesintallsWidget(),
        ),
        FFRoute(
          name: TacheconfirmerWidget.routeName,
          path: TacheconfirmerWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Tacheconfirmer')
              : TacheconfirmerWidget(),
        ),
        FFRoute(
          name: NouvelleTachesWidget.routeName,
          path: NouvelleTachesWidget.routePath,
          builder: (context, params) => NouvelleTachesWidget(),
        ),
        FFRoute(
          name: TacheTerminerWidget.routeName,
          path: TacheTerminerWidget.routePath,
          builder: (context, params) => TacheTerminerWidget(),
        ),
        FFRoute(
          name: TchesreporteWidget.routeName,
          path: TchesreporteWidget.routePath,
          builder: (context, params) => TchesreporteWidget(),
        ),
        FFRoute(
          name: DetailstacheWidget.routeName,
          path: DetailstacheWidget.routePath,
          builder: (context, params) => DetailstacheWidget(),
        ),
        FFRoute(
          name: DashboardWidget.routeName,
          path: DashboardWidget.routePath,
          builder: (context, params) => DashboardWidget(),
        ),
        FFRoute(
          name: TachetechWidget.routeName,
          path: TachetechWidget.routePath,
          builder: (context, params) => TachetechWidget(),
        ),
        FFRoute(
          name: SupportTechniqueWidget.routeName,
          path: SupportTechniqueWidget.routePath,
          builder: (context, params) => SupportTechniqueWidget(),
        ),
        FFRoute(
          name: CommercialWidget.routeName,
          path: CommercialWidget.routePath,
          builder: (context, params) => CommercialWidget(),
        ),
        FFRoute(
          name: CalendrierWidget.routeName,
          path: CalendrierWidget.routePath,
          builder: (context, params) => CalendrierWidget(),
        ),
        FFRoute(
          name: AppareilsCopyWidget.routeName,
          path: AppareilsCopyWidget.routePath,
          builder: (context, params) => AppareilsCopyWidget(),
        ),
        FFRoute(
          name: GPSGerantWidget.routeName,
          path: GPSGerantWidget.routePath,
          builder: (context, params) => GPSGerantWidget(),
        ),
        FFRoute(
          name: SIMGerantWidget.routeName,
          path: SIMGerantWidget.routePath,
          builder: (context, params) => SIMGerantWidget(),
        ),
        FFRoute(
          name: AccessoiresGerantWidget.routeName,
          path: AccessoiresGerantWidget.routePath,
          builder: (context, params) => AccessoiresGerantWidget(),
        ),
        FFRoute(
          name: LogGPSWidget.routeName,
          path: LogGPSWidget.routePath,
          builder: (context, params) => LogGPSWidget(),
        ),
        FFRoute(
          name: LogSIMWidget.routeName,
          path: LogSIMWidget.routePath,
          builder: (context, params) => LogSIMWidget(),
        ),
        FFRoute(
          name: AppareilsretourneeWidget.routeName,
          path: AppareilsretourneeWidget.routePath,
          builder: (context, params) => AppareilsretourneeWidget(),
        ),
        FFRoute(
          name: TacheconfirmerCopyWidget.routeName,
          path: TacheconfirmerCopyWidget.routePath,
          builder: (context, params) => TacheconfirmerCopyWidget(),
        ),
        FFRoute(
          name: DesinstallationWidget.routeName,
          path: DesinstallationWidget.routePath,
          builder: (context, params) => DesinstallationWidget(),
        ),
        FFRoute(
          name: PanneWidget.routeName,
          path: PanneWidget.routePath,
          builder: (context, params) => PanneWidget(
            clientName: params.getParam(
              'clientName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PanneGPSWidget.routeName,
          path: PanneGPSWidget.routePath,
          builder: (context, params) => PanneGPSWidget(
            clientName: params.getParam(
              'clientName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PanneRelaisWidget.routeName,
          path: PanneRelaisWidget.routePath,
          builder: (context, params) => PanneRelaisWidget(
            clientName: params.getParam(
              'clientName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PanneSIMWidget.routeName,
          path: PanneSIMWidget.routePath,
          builder: (context, params) => PanneSIMWidget(
            clientName: params.getParam(
              'clientName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ReinstallationWidget.routeName,
          path: ReinstallationWidget.routePath,
          builder: (context, params) => ReinstallationWidget(),
        ),
        FFRoute(
          name: CanceledTaskWidget.routeName,
          path: CanceledTaskWidget.routePath,
          builder: (context, params) => CanceledTaskWidget(
            clientName: params.getParam(
              'clientName',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
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
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
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

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
