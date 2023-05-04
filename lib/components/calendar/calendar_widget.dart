import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_model.dart';
export 'calendar_model.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late CalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: FlutterFlowCalendar(
        color: FlutterFlowTheme.of(context).primary,
        weekFormat: false,
        weekStartsMonday: false,
        onChange: (DateTimeRange? newSelectedDate) {
          setState(() => _model.calendarSelectedDay = newSelectedDate);
        },
        titleStyle: TextStyle(),
        dayOfWeekStyle: TextStyle(
          color: FlutterFlowTheme.of(context).primaryText,
        ),
        dateStyle: TextStyle(
          color: FlutterFlowTheme.of(context).primaryText,
        ),
        selectedDateStyle: TextStyle(),
        inactiveDateStyle: TextStyle(),
      ),
    );
  }
}
