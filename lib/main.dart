import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobile_installer/firebase_options.dart';
import 'package:mobile_installer/notifications/notifications_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'index.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// Handle background message (log, analytics, local DB, etc.)
  debugPrint('BG message: \\${message.messageId} data=\\${message.data}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  // ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  ThemeMode _themeMode = ThemeMode.light;


  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e as RouteMatch?))
          .toList();
  @override
  void initState() {
    super.initState();
    firebaseMessaging();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = ThemeMode.light;
        FlutterFlowTheme.saveThemeMode(ThemeMode.light);
      });

void firebaseMessaging() async {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final fcmToken = await _firebaseMessaging.getToken();
  print('FCM Token: ${fcmToken}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('message: ${message.notification?.title}');
    final title = message.notification?.title ?? "N/A";
    final body = message.notification?.body ?? "N/A";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(
          body,
          maxLines: 1,
          style: TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('message: ${message.notification?.title}');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationsWidget()),
    );
  });

  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if(message!=null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationsWidget()),
      );
    }
  });
}

Future<void> checkInitialMessage() async {
  final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationsWidget()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Installer',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({
    Key? key,
    this.initialPage,
    this.page,
    this.disableResizeToAvoidBottomInset = false,
  }) : super(key: key);

  final String? initialPage;
  final Widget? page;
  final bool disableResizeToAvoidBottomInset;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Taches';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Taches': TachesWidget(),
      'Appareils': AppareilsWidget(),
      'Appareilsdesintalls': AppareilsdesintallsWidget(),
      'Tacheconfirmer': TacheconfirmerWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      resizeToAvoidBottomInset: !widget.disableResizeToAvoidBottomInset,
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => safeSetState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: Color(0xFF15284C),
        selectedItemColor: FlutterFlowTheme.of(context).secondaryBackground,
        unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.tasks,
              size: 24.0,
            ),
            label: 'Tâche',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_rounded,
              size: 24.0,
            ),
            label: 'Appareils',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.u_turn_right_rounded,
              size: 24.0,
            ),
            label: 'Appareils désinstallés',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.edit_calendar,
              size: 24.0,
            ),
            label: 'Tâche à confirmer',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
