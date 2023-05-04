import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'employer_pending_match_reply_model.dart';
export 'employer_pending_match_reply_model.dart';

class EmployerPendingMatchReplyWidget extends StatefulWidget {
  const EmployerPendingMatchReplyWidget({Key? key}) : super(key: key);

  @override
  _EmployerPendingMatchReplyWidgetState createState() =>
      _EmployerPendingMatchReplyWidgetState();
}

class _EmployerPendingMatchReplyWidgetState
    extends State<EmployerPendingMatchReplyWidget> {
  late EmployerPendingMatchReplyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployerPendingMatchReplyModel());
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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: StreamBuilder<List<SwipeScreenRecord>>(
                stream: querySwipeScreenRecord(),
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
                  List<SwipeScreenRecord> containerSwipeScreenRecordList =
                      snapshot.data!;
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 52.0,
                                    height: 52.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
                                      icon: Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        context.pop();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Vacancy Matches',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        PagedListView<DocumentSnapshot<Object?>?,
                            VacancyMatchRecord>(
                          pagingController: () {
                            final Query<Object?> Function(Query<Object?>)
                                queryBuilder =
                                (vacancyMatchRecord) => vacancyMatchRecord;
                            if (_model.pagingController != null) {
                              final query =
                                  queryBuilder(VacancyMatchRecord.collection);
                              if (query != _model.pagingQuery) {
                                // The query has changed
                                _model.pagingQuery = query;
                                _model.streamSubscriptions
                                    .forEach((s) => s?.cancel());
                                _model.streamSubscriptions.clear();
                                _model.pagingController!.refresh();
                              }
                              return _model.pagingController!;
                            }

                            _model.pagingController =
                                PagingController(firstPageKey: null);
                            _model.pagingQuery =
                                queryBuilder(VacancyMatchRecord.collection);
                            _model.pagingController!
                                .addPageRequestListener((nextPageMarker) {
                              queryVacancyMatchRecordPage(
                                queryBuilder: (vacancyMatchRecord) =>
                                    vacancyMatchRecord,
                                nextPageMarker: nextPageMarker,
                                pageSize: 25,
                                isStream: true,
                              ).then((page) {
                                _model.pagingController!.appendPage(
                                  page.data,
                                  page.nextPageMarker,
                                );
                                final streamSubscription =
                                    page.dataStream?.listen((data) {
                                  data.forEach((item) {
                                    final itemIndexes = _model
                                        .pagingController!.itemList!
                                        .asMap()
                                        .map((k, v) =>
                                            MapEntry(v.reference.id, k));
                                    final index =
                                        itemIndexes[item.reference.id];
                                    final items =
                                        _model.pagingController!.itemList!;
                                    if (index != null) {
                                      items.replaceRange(
                                          index, index + 1, [item]);
                                      _model.pagingController!.itemList = {
                                        for (var item in items)
                                          item.reference: item
                                      }.values.toList();
                                    }
                                  });
                                  setState(() {});
                                });
                                _model.streamSubscriptions
                                    .add(streamSubscription);
                              });
                            });
                            return _model.pagingController!;
                          }(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<VacancyMatchRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, listViewIndex) {
                              final listViewVacancyMatchRecord = _model
                                  .pagingController!.itemList![listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      listViewVacancyMatchRecord.userRef!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    final containerUsersRecord = snapshot.data!;
                                    return Material(
                                      color: Colors.transparent,
                                      elevation: 1.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor1,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 80.0,
                                                          height: 80.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/art-hauntington-jzY0KRJopEI-unsplash.jpg',
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor1,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            child: Image.asset(
                                                              'assets/images/art-hauntington-jzY0KRJopEI-unsplash.jpg',
                                                              width: 100.0,
                                                              height: 100.0,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (containerUsersRecord
                                                                  .photoUrl !=
                                                              null &&
                                                          containerUsersRecord
                                                                  .photoUrl !=
                                                              '')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 80.0,
                                                            height: 80.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: Image
                                                                    .network(
                                                                  containerUsersRecord
                                                                      .photoUrl!,
                                                                ).image,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor1,
                                                              ),
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                              child:
                                                                  Image.network(
                                                                containerUsersRecord
                                                                    .photoUrl!,
                                                                width: 100.0,
                                                                height: 100.0,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0,
                                                                10.0, 0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          containerUsersRecord
                                                              .displayName!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            containerUsersRecord
                                                                .occupation!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xB3090F13),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 275.0,
                                              child: Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor1,
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                if (listViewVacancyMatchRecord
                                                        .status ==
                                                    'Pending')
                                                  Container(
                                                    width: 275.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFDEAD),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  6.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        listViewVacancyMatchRecord
                                                            .status!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFFAC6300),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                Container(
                                                  width: 275.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFFDEAD),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listViewVacancyMatchRecord
                                                          .status!,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFFAC6300),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                if ((listViewVacancyMatchRecord
                                                            .status ==
                                                        'Pending') &&
                                                    (currentUserReference ==
                                                        listViewVacancyMatchRecord
                                                            .ownerRef))
                                                  InkWell(
                                                    onTap: () async {
                                                      if (currentUserReference ==
                                                          listViewVacancyMatchRecord
                                                              .ownerRef) {
                                                        final vacancyMatchUpdateData =
                                                            createVacancyMatchRecordData(
                                                          isMatched: true,
                                                          status: 'Accepted',
                                                        );
                                                        await listViewVacancyMatchRecord
                                                            .reference
                                                            .update(
                                                                vacancyMatchUpdateData);
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1500));
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Success'),
                                                              content: Text(
                                                                  'You have matched this user sucessfully'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 275.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFDDF5F9),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Accept',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if ((listViewVacancyMatchRecord
                                                            .status ==
                                                        'Accepted') &&
                                                    (currentUserReference ==
                                                        listViewVacancyMatchRecord
                                                            .ownerRef))
                                                  InkWell(
                                                    onTap: () async {
                                                      if (currentUserReference ==
                                                          listViewVacancyMatchRecord
                                                              .ownerRef) {
                                                        final vacancyMatchUpdateData =
                                                            {
                                                          ...createVacancyMatchRecordData(
                                                            isMatched: true,
                                                            status: 'Declined',
                                                          ),
                                                          'owner_ref':
                                                              FieldValue
                                                                  .delete(),
                                                        };
                                                        await listViewVacancyMatchRecord
                                                            .reference
                                                            .update(
                                                                vacancyMatchUpdateData);
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1500));
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Success'),
                                                              content: Text(
                                                                  'You have matched this user sucessfully'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 275.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFDDF5F9),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Decline',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if ((listViewVacancyMatchRecord
                                                            .status ==
                                                        'Accepted') &&
                                                    (currentUserReference ==
                                                        listViewVacancyMatchRecord
                                                            .userRef))
                                                  StreamBuilder<UsersRecord>(
                                                    stream: UsersRecord.getDocument(
                                                        listViewVacancyMatchRecord
                                                            .ownerRef!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final containerUsersRecord =
                                                          snapshot.data!;
                                                      return InkWell(
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              'Appearance');
                                                        },
                                                        child: Container(
                                                          width: 275.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFFDEAD),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Chat owner',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFFAC6300),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
