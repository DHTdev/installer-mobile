import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:mobile_installer/backend/api_requests/api_calls.dart';
import 'package:mobile_installer/backend/schema/structs/technician_task_struct.dart';
import 'package:mobile_installer/compenents/taskToConfirmed/task_to_confirmed_item_widget.dart';
import 'package:mobile_installer/flutter_flow/custom_functions.dart' as function;

import '/components/header_section_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'tacheconfirmer_model.dart';
export 'tacheconfirmer_model.dart';

class TacheconfirmerWidget extends StatefulWidget {
  const TacheconfirmerWidget({super.key});

  static String routeName = 'Tacheconfirmer';
  static String routePath = '/tacheconfirmer';

  @override
  State<TacheconfirmerWidget> createState() => _TacheconfirmerWidgetState();
}

class _TacheconfirmerWidgetState extends State<TacheconfirmerWidget> {
  late TacheconfirmerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TacheconfirmerModel());
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResponseAllConfirmedTask = await TechnicienGroup.taskToConfirmedCall.call();

      if ((_model.apiResponseAllConfirmedTask?.succeeded ?? true)) {
        _model.tasksToConfirmed =
            ((_model.apiResponseAllConfirmedTask?.jsonBody ?? '').toList().map<TechnicianTaskStruct?>(TechnicianTaskStruct.maybeFromMap).toList() as Iterable<TechnicianTaskStruct?>)
                .withoutNulls
                .toList()
                .cast<TechnicianTaskStruct>();
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtertaskConfirme = function.filterTacheaConfirmer(_model.tasksToConfirmed, _model.textController!.text);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFEAEDF7),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.headerSectionModel,
                      updateCallback: () => safeSetState(() {}),
                      child: HeaderSectionWidget(),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(TcheexceptionnelWidget.routeName, queryParameters: {
                          'typeTask': 'Nouvelle tâche',
                        });
                      },
                      text: 'Nouvelle tâche',
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      options: FFButtonOptions(
                        width: 179.7,
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).success,
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.interTight(
                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                            ),
                        elevation: 0,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'Clients  | ',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              '${filtertaskConfirme!.length} clients',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) async {
                              function.filterTacheaConfirmer(_model.tasksToConfirmed, _model.textController!.text);
                              _model.isShowFullList = false;
                              safeSetState(() {});
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                  ),
                              hintText: 'Rechercher par Nom Client',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x4C000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator.asValidator(context),
                          ),
                        ),
                      ),
                      if (filtertaskConfirme!.isNotEmpty && filtertaskConfirme != null)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                          child: FutureBuilder(
                              future: (_model.apiRequestCompleterAllConfirmedTask ??= Completer<ApiCallResponse>()..complete(TechnicienGroup.taskToConfirmedCall.call())).future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return SingleChildScrollView(
                                  child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: filtertaskConfirme.length,
                                    itemBuilder: (context, tasksToConfirmedIndex) {
                                      final tasksToConfirmedItem = filtertaskConfirme[tasksToConfirmedIndex];
                                      return wrapWithModel(
                                        model: _model.taskToConfirmedItemModel,
                                        updateCallback: () => setState(() {}),
                                        child: TaskToConfirmedItemWidget(
                                          key: Key(
                                            'Keyf6j_${tasksToConfirmedIndex}_of_${_model.tasksToConfirmed.length}',
                                          ),
                                          tasksToConfirmedItem: tasksToConfirmedItem,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
