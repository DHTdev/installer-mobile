import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:google_fonts/google_fonts.dart';

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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
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
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
          // En-tête avec compteur
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

        // Dropdown villes
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: FlutterFlowDropDown<String>(
            controller: _model.dropDownValueController1 ??=
                FormFieldController<String>(null),
            options: provider.cityNames,
            onChanged: (val) => provider.setSelectedCity(val),
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: 40,
            textStyle: FlutterFlowTheme.of(context).bodyMedium,
            hintText: 'Toutes les villes',
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24,
            ),
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 2,
            borderColor: Color(0x4C000000),
            borderWidth: 0,
            borderRadius: 8,
            margin: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
            hidesUnderline: true,
          ),
        ),

        // Dropdown dates
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: FlutterFlowDropDown<String>(
            controller: _model.dropDownValueController2 ??=
                FormFieldController<String>(null),
            options: ["aujourd'hui", 'hier', 'demain'],
            onChanged: (val) => provider.setSelectedDateFilter(val),
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: 40,
            textStyle: FlutterFlowTheme.of(context).bodyMedium,
            hintText: "Aujourd'hui",
            icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24,
          ),
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 2,
          borderColor: Color(0x4C000000),
          borderWidth: 0,
          borderRadius: 8,
          margin: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
          hidesUnderline: true,
        ),
      ),

      // Champ de recherche
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 5),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: TextFormField(
            onChanged: (_) => EasyDebounce.debounce(
              '_model.textController',
              Duration(milliseconds: 500),
                  () => provider.setSearchText(_model.textController.text),
            ),
            controller: _model.textController,
            focusNode: _model.textFieldFocusNode,
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Rechercher par Nom Client',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0x4C000000), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
        ),
      ),
      ],
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