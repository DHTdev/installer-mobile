import '../tache/taches/taches_provider.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'multi_filter_model.dart';
export 'multi_filter_model.dart';

class MultiFilterWidget extends StatefulWidget {
  const MultiFilterWidget({
    super.key,
    required this.applyAction,
  });

  final Future Function(String? city, String? date, String? type, int? etat)?
  applyAction;

  @override
  State<MultiFilterWidget> createState() => _MultiFilterWidgetState();
}

class _MultiFilterWidgetState extends State<MultiFilterWidget> {
  late MultiFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultiFilterModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TachesProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Options du filtrage',
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                              font: GoogleFonts.interTight(),
                              letterSpacing: 0.0,
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 16.0,
                            buttonSize: 32.0,
                            icon: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      // Formulaire des filtres
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Ville
                          _buildFilterSection(
                            label: 'Ville',
                            child: Container(
                              width: double.infinity,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.citiesDropDownValueController ??=
                                    FormFieldController<String>(null),
                                options: provider.cityNames,
                                onChanged: (val) {
                                  setState(() => _model.citiesDropDownValue = val);
                                  _model.selectedCity = val;
                                },
                                width: double.infinity,
                                height: 48.0,
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(),
                                  letterSpacing: 0.0,
                                ),
                                hintText: 'Toutes les villes',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ),

                          SizedBox(height: 12),

                          // Date
                          _buildFilterSection(
                            label: 'Date',
                            child: Container(
                              width: double.infinity,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dateDropDpownValueController ??=
                                    FormFieldController<String>(null),
                                options: ["aujourd'hui", 'hier', 'demain'],
                                onChanged: (val) {
                                  setState(() => _model.dateDropDpownValue = val);
                                  _model.selectedDateFilter = val;
                                },
                                width: double.infinity,
                                height: 48.0,
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(),
                                  letterSpacing: 0.0,
                                ),
                                hintText: "Aujourd'hui",
                                searchHintText: 'Rechercher...',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: true,
                                isMultiSelect: false,
                              ),
                            ),
                          ),

                          SizedBox(height: 12),

                          // Type
                          _buildFilterSection(
                            label: 'Type',
                            child: Container(
                              width: double.infinity,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.taskTypeDropDownValueController ??=
                                    FormFieldController<String>(null),
                                options: [
                                  'installation',
                                  'desinstalation',
                                  'Reinstallation',
                                  'Changement du SIM',
                                  'Changement du GPS',
                                  'reparationRelais',
                                  'Panne',
                                  'installation gasoil'
                                ],
                                onChanged: (val) {
                                  setState(() => _model.taskTypeDropDownValue = val);
                                  _model.selectedTaskCategory = val;
                                },
                                width: double.infinity,
                                height: 48.0,
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(),
                                  letterSpacing: 0.0,
                                ),
                                hintText: 'Selectionner un type de taches',
                                searchHintText: 'Rechercher....',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: true,
                                isMultiSelect: false,
                              ),
                            ),
                          ),

                          SizedBox(height: 12),

                          // État de la tâche
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  'Etat de la tache',
                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(),
                                    letterSpacing: 0.0,
                                  ),
                                ),
                              ),
                              FlutterFlowChoiceChips(
                                options: [
                                  ChipData('en attente'),
                                  ChipData('en cours'),
                                  ChipData('terminée'),
                                  ChipData('Reportée '),
                                  ChipData('Annulée ')
                                ],
                                onChanged: (val) {
                                  setState(() => _model.choiceChipsValue = val?.firstOrNull);
                                  _model.selectedTaskStatus = () {
                                    if (_model.choiceChipsValue == 'en attente') {
                                      return 0;
                                    } else if (_model.choiceChipsValue == 'en cours') {
                                      return 1;
                                    } else if (_model.choiceChipsValue == 'terminée') {
                                      return 2;
                                    } else if (_model.choiceChipsValue == 'Reportée ') {
                                      return 3;
                                    } else {
                                      return 4;
                                    }
                                  }();
                                },
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFF15284C),
                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(),
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                                  iconColor: FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 18.0,
                                  elevation: 4.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                    font: GoogleFonts.inter(),
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                                  iconColor: FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                chipSpacing: 8.0,
                                rowSpacing: 8.0,
                                multiselect: false,
                                alignment: WrapAlignment.center,
                                controller: _model.choiceChipsValueController ??=
                                    FormFieldController<List<String>>([]),
                                wrapped: true,
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      // Boutons
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: 'Annuler',
                              options: FFButtonOptions(
                                height: 44.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(),
                                  letterSpacing: 0.0,
                                ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await widget.applyAction?.call(
                                  _model.selectedCity,
                                  _model.selectedDateFilter,
                                  _model.selectedTaskCategory,
                                  _model.selectedTaskStatus,
                                );
                                Navigator.pop(context);
                              },
                              text: 'Appliquer',
                              options: FFButtonOptions(
                                height: 44.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF15284C),
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterSection({required String label, required Widget child}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
          child: Text(
            label,
            style: FlutterFlowTheme.of(context).labelMedium.override(
              font: GoogleFonts.inter(),
              letterSpacing: 0.0,
            ),
          ),
        ),
        child,
      ],
    );
  }
}