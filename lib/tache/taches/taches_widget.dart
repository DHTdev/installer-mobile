import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:google_fonts/google_fonts.dart';

import '/components/multi_filter_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '../tcheexceptionnel/tcheexceptionnel_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/compenents/technicien_tasks/technicien_tasks_widget.dart';
import '/components/header_section_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'taches_provider.dart';
import 'taches_model.dart';

class TachesWidget extends StatefulWidget {
  const TachesWidget({super.key});

  static String routeName = 'Taches';
  static String routePath = '/taches';

  @override
  State<TachesWidget> createState() => _TachesWidgetState();
}

class _TachesWidgetState extends State<TachesWidget> {
  late TachesModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FFAppState appState = FFAppState();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TachesModel());
    _model.textController = TextEditingController();
    _model.textFieldFocusNode = FocusNode();

    // Chargement initial des données
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final provider = context.read<TachesProvider>();
      await provider.loadCities();
      await provider.loadTasks(appState.authToken);
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
  @override
  void deactivate() {
    try {
      final provider = context.read<TachesProvider>();
      provider.reset();
    } catch (e) {
      debugPrint('Erreur lors du reset: $e');
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
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
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: wrapWithModel(
                model: _model.headerSectionModel,
                updateCallback: () => setState(() {}),
                child: HeaderSectionWidget(),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Consumer<TachesProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bouton Tâche exceptionnelle
                    _buildExceptionalTaskButton(context),

                    // Section filtres
                    _buildFiltersSection(context, provider),

                    // Liste des tâches
                    _buildTasksList(context, provider),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildExceptionalTaskButton(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1, -1),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
        child: FFButtonWidget(
          onPressed: () async {
            context.pushNamed(
              TcheexceptionnelWidget.routeName,
              queryParameters: {'typeTask': 'Tâche exceptionnel'},
            );
          },
          text: 'Tâche exceptionnel ',
          options: FFButtonOptions(
            width: 179.7,
            height: 40,
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: FlutterFlowTheme.of(context).success,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  font: GoogleFonts.interTight(),
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
            elevation: 0,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildFiltersSection(BuildContext context, TachesProvider provider) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.125,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                  child: Text(
                    'List Des Tâches   |  ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      fontSize: 16,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    '${provider.filteredTasks.length} tâches',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      fontSize: 16,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 500),
                              () => provider.setSearchText(_model.textController.text),
                        ),
                        autofocus: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                            ),
                            letterSpacing: 0.0,
                          ),
                          alignLabelWithHint: false,
                          hintText: 'Rechercher par Nom Client',
                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                            ),
                            letterSpacing: 0.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF15284C),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                          suffixIcon: Icon(Icons.search),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8,
                    buttonSize: 40,
                    fillColor: Color(0x8357636C),
                    icon: Icon(
                      Icons.tune,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24,
                    ),
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: MultiFilterWidget(
                                applyAction: (city, date, type, etat) async {
                                  provider.setSelectedCity(city);
                                  provider.setSelectedDateFilter(date);
                                  provider.setSelectedTaskCategory(type);
                                  provider.setSelectedTaskStatus(etat);
                                  print('city ${city}');
                                  setState(() {});
                                },
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                  ),
                ],
              ),
            ),
          ]
              .divide(SizedBox(height: 5))
              .around(SizedBox(height: 5)),
        ),
      ),
    );
  }

  Widget _buildTasksList(BuildContext context, TachesProvider provider) {
    if (provider.isLoading) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      );
    }

    if (provider.error != null) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text('Erreur: ${provider.error}'),
        ),
      );
    }

    if (provider.filteredTasks.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text('Aucune tâche trouvée'),
        ),
      );
    }

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: RefreshIndicator(
        onRefresh: () => provider.refreshTasks(appState.authToken),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 5),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: provider.filteredTasks.length,
          separatorBuilder: (_, __) => SizedBox(height: 5),
          itemBuilder: (context, index) {
            final task = provider.filteredTasks[index];
            return TechnicienTasksWidget(
              TechnicianTask: task,
              key: Key('Keyxum_${index}_of_${provider.filteredTasks.length}'),
              id: task.id,
              clientName: task.clientName,
              taskType: task.catache,
              city: task.cityName,
              stateTask: task.etatTache,
              date: task.date_previsionnelle_debut,
            );
          },
        ),
      ),
    );
  }
}
