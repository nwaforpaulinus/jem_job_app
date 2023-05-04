import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddRequirementsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Requirement1 widget.
  TextEditingController? requirement1Controller;
  String? Function(BuildContext, String?)? requirement1ControllerValidator;
  // State field(s) for Requirement2 widget.
  TextEditingController? requirement2Controller;
  String? Function(BuildContext, String?)? requirement2ControllerValidator;
  // State field(s) for Requirement3 widget.
  TextEditingController? requirement3Controller;
  String? Function(BuildContext, String?)? requirement3ControllerValidator;
  // State field(s) for Requirement4 widget.
  TextEditingController? requirement4Controller;
  String? Function(BuildContext, String?)? requirement4ControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    requirement1Controller?.dispose();
    requirement2Controller?.dispose();
    requirement3Controller?.dispose();
    requirement4Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
