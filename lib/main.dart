import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState

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
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<JemJobAppFirebaseUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
    userStream = jemJobAppFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Jem Job App',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'SwipeScreenEmployer';
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
      'SwipeScreenEmployer': SwipeScreenEmployerWidget(),
      'SavedLikedEmployeeScreen': SavedLikedEmployeeScreenWidget(),
      'EmployerPendingMatchReply': EmployerPendingMatchReplyWidget(),
      'Notification': NotificationWidget(),
      'EmployerProfileForm': EmployerProfileFormWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: Color(0xFFDDF5F9),
        color: FlutterFlowTheme.of(context).primary,
        activeColor: FlutterFlowTheme.of(context).primary,
        tabBackgroundColor: Color(0x00000000),
        tabBorderRadius: 100.0,
        tabMargin: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        gap: 10.0,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        duration: Duration(milliseconds: 1),
        haptic: false,
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
            textStyle: GoogleFonts.getFont(
              'Lexend',
              color: FlutterFlowTheme.of(context).primary,
              fontWeight: FontWeight.w600,
              fontSize: 10.0,
            ),
            iconSize: 24.0,
          ),
          GButton(
            icon: Icons.bookmark,
            text: '',
            iconSize: 24.0,
          ),
          GButton(
            icon: FontAwesomeIcons.briefcase,
            text: 'Applicants',
            textStyle: GoogleFonts.getFont(
              'Lexend',
              color: Color(0xFF1BB1CB),
              fontWeight: FontWeight.w600,
              fontSize: 10.0,
            ),
            iconSize: 22.0,
          ),
          GButton(
            icon: FontAwesomeIcons.comment,
            text: 'Message',
            textStyle: GoogleFonts.getFont(
              'Lexend',
              color: FlutterFlowTheme.of(context).primary,
              fontWeight: FontWeight.w600,
              fontSize: 10.0,
            ),
            iconSize: 24.0,
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
            textStyle: GoogleFonts.getFont(
              'Lexend',
              color: Color(0xFF1BB1CB),
              fontWeight: FontWeight.w600,
              fontSize: 10.0,
            ),
            iconSize: 30.0,
          )
        ],
      ),
    );
  }
}
