import 'package:firebase_auth/firebase_auth.dart';
import 'package:jem_job_app/providers/user_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../navigations/views/admin_map_view.dart';
import '../../navigations/views/user_map.dart';
import '../../navigations/widgets/permissions.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

import '../../navigations/nav.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'employer_assign_job_model.dart';
export 'employer_assign_job_model.dart';

class EmployerAssignJobWidget extends StatefulWidget {
  const EmployerAssignJobWidget({
    Key? key,
    this.userRef,
  }) : super(key: key);

  final DocumentReference? userRef;

  @override
  _EmployerAssignJobWidgetState createState() =>
      _EmployerAssignJobWidgetState();
}

class _EmployerAssignJobWidgetState extends State<EmployerAssignJobWidget> {
  late EmployerAssignJobModel _model;
  late LatLng employeeLatestLocation;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployerAssignJobModel());
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.nameController ??= TextEditingController();
    getEmployeeLatestLocation();
  }

  @override
  void dispose() {
    _model.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  getEmployeeLatestLocation() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot =
        await collection.doc(FirebaseAuth.instance.currentUser?.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var value = data?['location']; // <-- The value you want to retrieve.

      setState(() {
        employeeLatestLocation = LatLng(value.latitude, value.longitude);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        title: Text(
            'Assigning to ${userProvider.currentEmployeeRecord.displayName}'),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FlutterFlowGoogleMap(
                  controller: _model.googleMapsController,
                  onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                  initialLocation: _model.googleMapsCenter ??=
                      currentUserLocationValue!,
                  markerColor: GoogleMarkerColor.violet,
                  mapType: MapType.normal,
                  style: GoogleMapStyle.standard,
                  initialZoom: 14.0,
                  allowInteraction: true,
                  allowZoom: true,
                  showZoomControls: true,
                  showLocation: true,
                  showCompass: false,
                  showMapToolbar: false,
                  showTraffic: false,
                  centerMapOnMarkerTap: true,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FlutterFlowPlacePicker(
                    iOSGoogleMapsApiKey:
                        'AIzaSyCV3HaLkTEa66rVXTk9QjGSntzZU-pOKrA',
                    androidGoogleMapsApiKey:
                        'AIzaSyCV3HaLkTEa66rVXTk9QjGSntzZU-pOKrA',
                    webGoogleMapsApiKey:
                        'AIzaSyCV3HaLkTEa66rVXTk9QjGSntzZU-pOKrA',
                    onSelect: (place) async {
                      setState(() => _model.placePickerValue = place);
                    },
                    defaultText: 'Set Location',
                    icon: Icon(
                      Icons.place,
                      color: Colors.white,
                    ),
                    buttonOptions: FFButtonOptions(
                      width: 200.0,
                      height: 40.0,
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 40.0, 15.0, 0.0),
                        child: TextFormField(
                          controller: _model.nameController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Please enter assignment',
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCD0F0F),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCD0F0F),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.nameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.95),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 20.0, 15.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              // final createErrandData = createErrandsRecordData(
                              //   location: employeeLatestLocation,
                              //   destinationLocation:
                              //       _model.placePickerValue.latLng,
                              //   address: _model.placePickerValue.address,
                              //   userRef: widget.userRef,
                              //   errandName: _model.nameController.text,
                              // );
                              var errandsRecordReference = ErrandsRecord
                                  .collection
                                  .doc(userProvider.currentEmployeeRecord.uid);

                              await errandsRecordReference.set({
                                'location': GeoPoint(
                                    employeeLatestLocation.latitude,
                                    employeeLatestLocation.longitude),
                                'destinationLocation': GeoPoint(
                                    _model.placePickerValue.latLng.latitude,
                                    _model.placePickerValue.latLng.longitude),
                                'address': _model.placePickerValue.address,
                                'userRef':
                                    userProvider.currentEmployeeRecord.uid,
                                'errandName': _model.nameController.text,
                              }).then((value) {
                                showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Success'),
                                      content:
                                          Text('Job assigned successfully'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement
                                              (context, MaterialPageRoute(builder: (context) => AdminMapView(errandUserId: '${userProvider.currentEmployeeRecord.uid}',)));
                                          },
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                              //
                              // _model.savedErrand =
                              //     ErrandsRecord.getDocumentFromData(
                              //         createErrandData, errandsRecordReference);

                              // requestPermission().then((value) {
                              //   if (value == PermissionStatus.granted) {
                              //     Navigator.of(context).push(MaterialPageRoute(
                              //         builder: (context) => NavigationScreen(
                              //             userProvider.currentEmployeeRecord
                              //                 .location!.latitude,
                              //             userProvider.currentEmployeeRecord
                              //                 .location!.longitude)));
                              //   } else if (value == PermissionStatus.denied) {
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //         const SnackBar(
                              //             content: Text('Permission denied')));
                              //   } else {
                              //     Navigator.of(context).push(MaterialPageRoute(
                              //         builder: (context) => NavigationScreen(
                              //             userProvider.currentEmployeeRecord
                              //                 .location!.latitude,
                              //             userProvider.currentEmployeeRecord
                              //                 .location!.longitude)));
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //         const SnackBar(
                              //             backgroundColor: Colors.green,
                              //             content: Text('Granted')));
                              //   }
                              // });

                              // context.pushNamed(
                              //   'ErrandMapDisplay',
                              //   queryParams: {
                              //     'errandRef': serializeParam(
                              //       _model.savedErrand!.reference,
                              //       ParamType.DocumentReference,
                              //     ),
                              //   }.withoutNulls,
                              // );

                              setState(() {});
                            },
                            text: 'Assign Job',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
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
  }
}