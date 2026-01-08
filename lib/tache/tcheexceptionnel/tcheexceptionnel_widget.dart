import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_installer/backend/api_requests/api_calls.dart';
import 'package:mobile_installer/backend/schema/structs/client_struct.dart';
import 'package:mobile_installer/backend/schema/structs/exception_task_form_struct.dart';
import 'package:mobile_installer/backend/schema/structs/index.dart';
import 'package:mobile_installer/backend/schema/structs/new_task_info_struct.dart';

import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tcheexceptionnel_model.dart';
export 'tcheexceptionnel_model.dart';

class TcheexceptionnelWidget extends StatefulWidget {
  const TcheexceptionnelWidget({super.key, required this.typeTask});

  static String routeName = 'Tcheexceptionnel';
  static String routePath = '/tcheexceptionnel';
  final String? typeTask;

  @override
  State<TcheexceptionnelWidget> createState() => _TcheexceptionnelWidgetState();
}

class _TcheexceptionnelWidgetState extends State<TcheexceptionnelWidget> {
  bool _isButtonEnabled = true;

  late TcheexceptionnelModel _model;
  List<ExceptionTaskFormStruct> exceptionTasksInfo = [];
  List<ClientStruct> newTaskInfo = [];
  List<CityStruct> clientCity = [];
  List<CategoryOfTaskStruct> taskCategory = [];
  final appState = FFAppState();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String nowDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String nowTime = DateFormat('HH:mm').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TcheexceptionnelModel());
    print("typeTask:${widget.typeTask}");
    _model.textControllerClientName ??= TextEditingController();
    _model.textFieldFocusClientName ??= FocusNode();

    _model.textControllerPhoneNumber ??= TextEditingController();
    _model.textFieldFocusPhoneNumber ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textControllerQuantite ??= TextEditingController();
    _model.textFieldFocusQuantite ??= FocusNode();

    _model.textControllerDescription ??= TextEditingController();
    _model.textFieldFocusDescription ??= FocusNode();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      try {
        _model.apiResponseNewTaskInfo = await TechnicienGroup.getNewTaskInfoCall.call();

        if ((_model.apiResponseNewTaskInfo?.succeeded ?? true)) {
          _model.newTaskInfo = NewTaskInfoStruct.maybeFromMap(
            _model.apiResponseNewTaskInfo?.jsonBody,
          );
          safeSetState(() {
            newTaskInfo = _model.newTaskInfo!.clients;
            clientCity = _model.newTaskInfo!.clientCity;
            taskCategory = _model.newTaskInfo!.typeTask;
          });
        }
      } catch (e) {
        print("error: $e");
      }
    });
  }

  Future<void> addNewExceptionTask() async {
    setState(() {
      _isButtonEnabled = !_isButtonEnabled;
    });
    final newTaskData = ExceptionTaskFormStruct(
      nomComplet: _model.textControllerClientName.text,
      telephone: _model.textControllerPhoneNumber.text,
      typeTask: widget.typeTask == "Nouvelle tâche" ? "normal" : "exceptional",
      typeTache: _model.dropDownTypeTaskValue.toString(),
      date: "$nowDate $nowTime",
      quantite: _model.textControllerQuantite.text,
      clientCity: _model.dropDownCityValue.toString(),
      description: _model.textControllerDescription.text,
    );
    await TechnicienGroup.taskConfirmedCall.call(
      newTaskData,
    );
    Navigator.pop(context);
  }

  void showCuppertinoDatePicker(Widget childWidget) async {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(top: false, child: childWidget),
      ),
    );
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            widget.typeTask.toString(),
            style: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.interTight(
                fontWeight: FontWeight.bold,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              fontSize: 20.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Client Name - Autocomplete
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Autocomplete<ClientStruct>(
                                optionsBuilder: (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text.isEmpty) {
                                    return List<ClientStruct>.empty();
                                  }
                                  return newTaskInfo.where((clientInfo) =>
                                      clientInfo.clientname.toLowerCase()
                                          .contains(textEditingValue.text.toLowerCase()));
                                },
                                fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                                  return TextField(
                                    controller: textEditingController,
                                    focusNode: focusNode,
                                    decoration: InputDecoration(
                                      labelText: 'Client Name',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 16.0,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _model.textControllerClientName.text = value;
                                      });
                                    },
                                  );
                                },
                                optionsViewBuilder: ((context, onselected, newTaskInfo) {
                                  return Material(
                                    elevation: 4.0,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: newTaskInfo.length,
                                      itemBuilder: (context, index) {
                                        final option = newTaskInfo.elementAt(index);
                                        return ListTile(
                                          title: Text(option.clientname),
                                          onTap: () {
                                            onselected(option);
                                            setState(() {
                                              _model.textControllerClientName.text = option.clientname;
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  );
                                }),
                                displayStringForOption: (clientInfo) => clientInfo.clientname,
                              ),
                            ),

                            // Phone Number
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: TextFormField(
                                controller: _model.textControllerPhoneNumber,
                                focusNode: _model.textFieldFocusPhoneNumber,
                                decoration: InputDecoration(
                                  labelText: 'Téléphone Client',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 16.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                                keyboardType: TextInputType.phone,
                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textController2Validator.asValidator(context),
                              ),
                            ),

                            // Type de tâche Dropdown
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownTypeTaskValueValueController ??= FormFieldController<String>(null),
                                options: taskCategory.map((type) => type.taskName.toString()).toList(),
                                optionLabels: taskCategory.map((type) => type.taskName).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _model.dropDownTypeTaskValue = val;
                                  });
                                },
                                height: 56.0,
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  color: Color(0xFF57636C),
                                  letterSpacing: 0.0,
                                ),
                                hintText: 'Type de tâche',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.black,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: EdgeInsets.symmetric(horizontal: 12.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),

                            // Date and Time Picker
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Container(
                                height: 56.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                showCuppertinoDatePicker(CupertinoDatePicker(
                                                  showDayOfWeek: false,
                                                  mode: CupertinoDatePickerMode.date,
                                                  use24hFormat: true,
                                                  onDateTimeChanged: (DateTime newDateTime) {
                                                    setState(() => nowDate = DateFormat('dd/MM/yyyy').format(newDateTime).toString());
                                                  },
                                                ));
                                              },
                                              child: Text(
                                                nowDate.toString(),
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                showCuppertinoDatePicker(CupertinoDatePicker(
                                                  mode: CupertinoDatePickerMode.time,
                                                  use24hFormat: true,
                                                  onDateTimeChanged: (DateTime newDateTime) {
                                                    setState(() => nowTime = DateFormat('HH:mm').format(newDateTime).toString());
                                                  },
                                                ));
                                              },
                                              child: Text(
                                                nowTime.toString(),
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.calendar_month,
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Quantité
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: TextFormField(
                                controller: _model.textControllerQuantite,
                                focusNode: _model.textFieldFocusQuantite,
                                decoration: InputDecoration(
                                  labelText: 'Quantité',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 16.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                                keyboardType: TextInputType.number,
                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textController5Validator.asValidator(context),
                              ),
                            ),

                            // Ville Dropdown
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueCityController ??= FormFieldController<String>(null),
                                options: clientCity.map((city) => city.id.toString()).toList(),
                                optionLabels: clientCity.map((city) => city.cityName).toList(),
                                onChanged: (val) => safeSetState(() => _model.dropDownCityValue = val),
                                height: 56.0,
                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  color: Color(0xFF57636C),
                                  letterSpacing: 0.0,
                                ),
                                hintText: 'Réalisée à',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.black,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: EdgeInsets.symmetric(horizontal: 12.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),

                            // Description
                            Padding(
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: TextFormField(
                                controller: _model.textControllerDescription,
                                focusNode: _model.textFieldFocusDescription,
                                decoration: InputDecoration(
                                  labelText: 'Description',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 16.0,
                                  ),
                                  alignLabelWithHint: true,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textController6Validator.asValidator(context),
                              ),
                            ),

                            // Bouton Ajouter
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: SizedBox(
                                height: 48.0,
                                child: FFButtonWidget(
                                  onPressed: _isButtonEnabled ? addNewExceptionTask : null,
                                  text: 'Ajouter la tâche',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 48.0,
                                    padding: EdgeInsets.all(0),
                                    color: Color(0xFF07C491),
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
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
                            SizedBox(height: MediaQuery.of(context).viewInsets.bottom > 0 ? 100 : 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}