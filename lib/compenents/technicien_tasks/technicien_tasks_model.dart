import '/compenents/manage_taches/manage_taches_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'technicien_tasks_widget.dart' show TechnicienTasksWidget;
import 'package:flutter/material.dart';

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
