import '/backend/schema/structs/index.dart';
import '/compenents/details/details_widget.dart';
import '/compenents/manage_taches/manage_taches_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter_animate/flutter_animate.dart';
import 'technicien_tasks_widget.dart' show TechnicienTasksWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TechnicienTasksModel extends FlutterFlowModel<TechnicienTasksWidget> {
  ///  Local state fields for this component.

  String clientName = 'A H BETON';

  String taskType = 'installation gasoil';

  String? date;

  String city = 'tanger';

  int stateTask = 1;

  bool showMenu = false;

  ///  State fields for stateful widgets in this component.

  // Model for ManageTaches component.
  late ManageTachesModel manageTachesModel;

  @override
  void initState(BuildContext context) {
    manageTachesModel = createModel(context, () => ManageTachesModel());
  }

  @override
  void dispose() {
    manageTachesModel.dispose();
  }
}
