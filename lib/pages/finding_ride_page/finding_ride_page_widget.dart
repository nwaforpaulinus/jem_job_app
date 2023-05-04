import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'finding_ride_page_model.dart';
export 'finding_ride_page_model.dart';

class FindingRidePageWidget extends StatefulWidget {
  const FindingRidePageWidget({
    Key? key,
    this.rideDetailsReference,
  }) : super(key: key);

  final DocumentReference? rideDetailsReference;

  @override
  _FindingRidePageWidgetState createState() => _FindingRidePageWidgetState();
}

class _FindingRidePageWidgetState extends State<FindingRidePageWidget> {
  late FindingRidePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FindingRidePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<RideRecord>(
      stream: RideRecord.getDocument(widget.rideDetailsReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        final findingRidePageRideRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Text(
              findingRidePageRideRecord.destinationAddress!,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (findingRidePageRideRecord.isDriverAssigned ?? true)
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1BB1CB),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Found Ride',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Icon(
                              Icons.check,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!findingRidePageRideRecord.isDriverAssigned!)
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.RouteViewStatic(
                          width: double.infinity,
                          height: double.infinity,
                          lineColor: FlutterFlowTheme.of(context).background,
                          iOSGoogleMapsApiKey:
                              'AIzaSyCV3HaLkTEa66rVXTk9QjGSntzZU-pOKrA',
                          androidGoogleMapsApiKey:
                              'AIzaSyCV3HaLkTEa66rVXTk9QjGSntzZU-pOKrA',
                          webGoogleMapsApiKey:
                              'AIzaSyCV3HaLkTEa66rVXTk9QjGSntzZU-pOKrA',
                          startAddress: findingRidePageRideRecord.userAddress,
                          destinationAddress:
                              findingRidePageRideRecord.destinationAddress,
                          startCoordinate:
                              findingRidePageRideRecord.userLocation!,
                          endCoordinate:
                              findingRidePageRideRecord.destinationLocation!,
                        ),
                      ),
                    ),
                  if (findingRidePageRideRecord.isDriverAssigned ?? true)
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.RouteViewLive(
                          width: double.infinity,
                          height: double.infinity,
                          lineColor: FlutterFlowTheme.of(context).background,
                          iOSGoogleMapsApiKey:
                              'AIzaSyCV3HaLkTEa66rVXTk9QjGSntzZU-pOKrA',
                          androidGoogleMapsApiKey:
                              'AIzaSyCV3HaLkTEa66rVXTk9QjGSntzZU-pOKrA',
                          webGoogleMapsApiKey:
                              'AIzaSyCV3HaLkTEa66rVXTk9QjGSntzZU-pOKrA',
                          startAddress: findingRidePageRideRecord.userAddress,
                          destinationAddress:
                              findingRidePageRideRecord.destinationAddress,
                          startCoordinate:
                              findingRidePageRideRecord.driverLocation!,
                          endCoordinate:
                              findingRidePageRideRecord.destinationLocation!,
                          rideDetailsReference:
                              findingRidePageRideRecord.reference,
                        ),
                      ),
                    ),
                  if (!findingRidePageRideRecord.isDriverAssigned!)
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1BB1CB),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Found Ride...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Container(
                              width: 26.0,
                              height: 26.0,
                              child: custom_widgets.CustomProgressIndicator(
                                width: 26.0,
                                height: 26.0,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                strokeWidth: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (findingRidePageRideRecord.isDriverAssigned ?? true)
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      'Arriving in',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 20.0,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 200.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1BB1CB),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 0.0),
                                          child: Text(
                                            FFAppState().routeDuration,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 8.0),
                                          child: Text(
                                            FFAppState().routeDistance,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: Color(0xFFACACAC),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFAFAFAF),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                      size: 30.0,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 8.0, 0.0),
                                        child: Text(
                                          findingRidePageRideRecord.driverName!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 8.0, 0.0),
                                        child: Text(
                                          'Cab',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFFACACAC),
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
