import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Authentification Group Code

class AuthentificationGroup {
  static String getBaseUrl() => 'https://d3instal.com';
  static Map<String, String> headers = {};
  static CheckLoggedInCall checkLoggedInCall = CheckLoggedInCall();
  static LoginCall loginCall = LoginCall();
  static XsrfTokenCall xsrfTokenCall = XsrfTokenCall();
  static UserCall userCall = UserCall();
}

class CheckLoggedInCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = AuthentificationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'checkLoggedIn',
      apiUrl: '${baseUrl}/api/checkLoggedIn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? emailAddress = 'hamza.touil@gmail.com',
    String? password = 'elec97',
  }) async {
    final baseUrl = AuthentificationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "hamza.touil@gmail.com",
  "password": "elec97"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-XSRF-TOKEN': '',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class XsrfTokenCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = AuthentificationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'XSRF TOKEN',
      apiUrl: '${baseUrl}/sanctum/csrf-cookie',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = AuthentificationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'user',
      apiUrl: '${baseUrl}/api/user',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Authentification Group Code

/// Start Commercial Group Code

class CommercialGroup {
  static String getBaseUrl() => 'https://d3instal.com/api';
  static Map<String, String> headers = {};
  static ListeClientsCall listeClientsCall = ListeClientsCall();
  static CommercialeTasksCall commercialeTasksCall = CommercialeTasksCall();
  static ClientSpcifiqueCall clientSpcifiqueCall = ClientSpcifiqueCall();
  static UpdateTaskToConfirmedCall updateTaskToConfirmedCall =
      UpdateTaskToConfirmedCall();
  static AjouterUnClientCall ajouterUnClientCall = AjouterUnClientCall();
  static SearchClientCall searchClientCall = SearchClientCall();
  static SearchDateClientCall searchDateClientCall = SearchDateClientCall();
  static FilterTasksCall filterTasksCall = FilterTasksCall();
}

class ListeClientsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CommercialGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ListeClients',
      apiUrl: '${baseUrl}/clients',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CommercialeTasksCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CommercialGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'CommercialeTasks',
      apiUrl: '${baseUrl}/allCommercialeTasks',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ClientSpcifiqueCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CommercialGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'client Spcifique',
      apiUrl: '${baseUrl}/getTasksForEachClient/{idClient}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTaskToConfirmedCall {
  Future<ApiCallResponse> call({
    int? taskId,
  }) async {
    final baseUrl = CommercialGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Update Task To Confirmed',
      apiUrl: '${baseUrl}/UpdateTaskToConfirmed/{taskId}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AjouterUnClientCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CommercialGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Ajouter un client',
      apiUrl: '${baseUrl}/clients',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchClientCall {
  Future<ApiCallResponse> call({
    String? input = '',
  }) async {
    final baseUrl = CommercialGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'SearchClient',
      apiUrl: '${baseUrl}/searchClient/{input}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchDateClientCall {
  Future<ApiCallResponse> call({
    String? startDate = '',
    String? endDate = '',
  }) async {
    final baseUrl = CommercialGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'SearchDateClient',
      apiUrl: '${baseUrl}/searchDateClient/{StartDate}/{endDate}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FilterTasksCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CommercialGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'filterTasks',
      apiUrl: '${baseUrl}/filterTasksByDate',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Commercial Group Code

/// Start  Technicien Group Code

class TechnicienGroup {
  static String getBaseUrl() => 'https://d3instal.com/api/technicien';
  static Map<String, String> headers = {};
  static TasksCall tasksCall = TasksCall();
  static AppareilsCall appareilsCall = AppareilsCall();
  static ReturnedDevicesCall returnedDevicesCall = ReturnedDevicesCall();
  static AffectedDevicesCall affectedDevicesCall = AffectedDevicesCall();
  static TaskSpecifiqueCall taskSpecifiqueCall = TaskSpecifiqueCall();
  static UpdateTaskCall updateTaskCall = UpdateTaskCall();
  static CancelTaskCall cancelTaskCall = CancelTaskCall();
  static GetTasksCall getTasksCall = GetTasksCall();
  static AllUsersCall allUsersCall = AllUsersCall();
  static UpdateTaskTerminedCall updateTaskTerminedCall =
      UpdateTaskTerminedCall();
  static PostponeTaskCall postponeTaskCall = PostponeTaskCall();
  static TaskConfirmedCall taskConfirmedCall = TaskConfirmedCall();
  static TaskToConfirmedCall taskToConfirmedCall = TaskToConfirmedCall();
  static StartedTaskCall startedTaskCall = StartedTaskCall();
  static PostponedTaskCall postponedTaskCall = PostponedTaskCall();
  static NotificationUpdateCall notificationUpdateCall =
      NotificationUpdateCall();
  static UpdateTaskConfirmedCall updateTaskConfirmedCall =
      UpdateTaskConfirmedCall();
  static UninstallTaskCall uninstallTaskCall = UninstallTaskCall();
  static ChangeDeviceCall changeDeviceCall = ChangeDeviceCall();
  static ChangeRelaiCall changeRelaiCall = ChangeRelaiCall();
  static ChangeSimidCall changeSimidCall = ChangeSimidCall();
  static ReinstallationTaskCall reinstallationTaskCall =
      ReinstallationTaskCall();
  static PanneTaskCall panneTaskCall = PanneTaskCall();
  static GetNewTaskInfoCall getNewTaskInfoCall = GetNewTaskInfoCall();
  static GetTasksDataForReparationCall getTasksDataForReparationCall =
      GetTasksDataForReparationCall();
}

class TasksCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Tasks',
      apiUrl: '${baseUrl}/tâches',
      callType: ApiCallType.GET,
      headers: {
        'content-type': 'application/json',
        'Authorization':
            'Bearer 4356|3qnEpkUNGM4qCAPaCz87rT6DbmmKKRhf352176zL05237f92',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? technician(dynamic response) => (getJsonField(
        response,
        r'''$[:].uti_utilsateur_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? expectedStartDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].date_previsionnelle_debut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? startDate(dynamic response) => (getJsonField(
        response,
        r'''$[:].date_debut_realisation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? dateAffectation(dynamic response) => (getJsonField(
        response,
        r'''$[:].date_affectation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? car(dynamic response) => getJsonField(
        response,
        r'''$[:].vehicules''',
        true,
      ) as List?;
  List? accesoriesModel(dynamic response) => getJsonField(
        response,
        r'''$[:].accesoriesModel''',
        true,
      ) as List?;
  List<String>? catache(dynamic response) => (getJsonField(
        response,
        r'''$[:].catache''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cityName(dynamic response) => (getJsonField(
        response,
        r'''$[:].cityName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? clientname(dynamic response) => (getJsonField(
        response,
        r'''$[:].client_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? simNumber(dynamic response) => getJsonField(
        response,
        r'''$[:].SIM''',
        true,
      ) as List?;
  List? mainGPS(dynamic response) => getJsonField(
        response,
        r'''$[:].gps_principale''',
        true,
      ) as List?;
  List? owner(dynamic response) => getJsonField(
        response,
        r'''$[:].proprietaire''',
        true,
      ) as List?;
  List? garantie(dynamic response) => getJsonField(
        response,
        r'''$[:].garantie''',
        true,
      ) as List?;
  List? ownerSIM(dynamic response) => getJsonField(
        response,
        r'''$[:].SIM_proprietaire''',
        true,
      ) as List?;
  List<String>? clientPhoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].telephone_client''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? sendBy(dynamic response) => (getJsonField(
        response,
        r'''$[:].user_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? nameModeleGPS(dynamic response) => getJsonField(
        response,
        r'''$[:].nameModeleGPS''',
        true,
      ) as List?;
  List? nameModeleSIM(dynamic response) => getJsonField(
        response,
        r'''$[:].nameModeleSIM''',
        true,
      ) as List?;
  List? serialNumber(dynamic response) => getJsonField(
        response,
        r'''$[:].IMEI''',
        true,
      ) as List?;
  List<int>? stateTask(dynamic response) => (getJsonField(
        response,
        r'''$[:].etat_tache''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? matricule(dynamic response) => getJsonField(
        response,
        r'''$[:].matricule''',
        true,
      ) as List?;
  List<String>? observation(dynamic response) => (getJsonField(
        response,
        r'''$[:].observation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AppareilsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'appareils',
      apiUrl: '${baseUrl}/appareils',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer 4356|3qnEpkUNGM4qCAPaCz87rT6DbmmKKRhf352176zL05237f92',
        'content-type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReturnedDevicesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ReturnedDevices',
      apiUrl: '${baseUrl}/getAllReturnedDevices',
      callType: ApiCallType.GET,
      headers: {
        'content-type': 'application/json',
        'Authorization':
            'Bearer 4356|3qnEpkUNGM4qCAPaCz87rT6DbmmKKRhf352176zL05237f92',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? catacheid(dynamic response) => (getJsonField(
        response,
        r'''$[:].catache_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? serialnumber(dynamic response) => (getJsonField(
        response,
        r'''$[:].serial_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? nameModele(dynamic response) => (getJsonField(
        response,
        r'''$[:].nameModele''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? nomComplet(dynamic response) => (getJsonField(
        response,
        r'''$[:].nomComplet''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? endroits(dynamic response) => (getJsonField(
        response,
        r'''$[:].endroits''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? dateReturned(dynamic response) => (getJsonField(
        response,
        r'''$[:].dataReturned''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? matricule(dynamic response) => (getJsonField(
        response,
        r'''$[:].matricule''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AffectedDevicesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'affectedDevices',
      apiUrl: '${baseUrl}/affectedReturnedDevices',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TaskSpecifiqueCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'TaskSpecifique',
      apiUrl: '${baseUrl}/getTask/{id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTaskCall {
  Future<ApiCallResponse> call({
    int? id,
    int? statut,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'updateTask',
      apiUrl: '${baseUrl}/updateTask/{id}/{statut}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelTaskCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    final ffApiRequestBody = '''
{

"Observation":""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cancelTask',
      apiUrl: '${baseUrl}/cancelTask/{id}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTasksCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getTasks',
      apiUrl: '${baseUrl}/getTasksDataForReparation/{id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AllUsersCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'allUsers',
      apiUrl: '${baseUrl}/allUsers',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTaskTerminedCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'updateTaskTermined',
      apiUrl: '${baseUrl}/updateTaskTermined/{id}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostponeTaskCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
"NouvelleDate":"",
"Observation":""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postponeTask',
      apiUrl: '${baseUrl}/postponeTask/{id}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TaskConfirmedCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'taskConfirmed',
      apiUrl: '${baseUrl}/taskToConfirmed',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TaskToConfirmedCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'taskToConfirmed',
      apiUrl: '${baseUrl}/taskToConfirmed',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StartedTaskCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'StartedTask',
      apiUrl: '${baseUrl}/StartedTask/{id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostponedTaskCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'postponedTask',
      apiUrl: '${baseUrl}/postponedTask',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NotificationUpdateCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'NotificationUpdate',
      apiUrl: '${baseUrl}/NotificationUpdate/{id}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTaskConfirmedCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'UpdateTaskConfirmed',
      apiUrl: '${baseUrl}/UpdateTaskToConfirmed/{id}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UninstallTaskCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'uninstallTask',
      apiUrl: '${baseUrl}/uninstallTask/{id}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangeDeviceCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'changeDevice',
      apiUrl: '${baseUrl}/changeDevice/{id}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangeRelaiCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'changeRelai',
      apiUrl: '${baseUrl}/changeRelai/{id}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangeSimidCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'changeSimid',
      apiUrl: '${baseUrl}/changeSim/{id}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReinstallationTaskCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'reinstallationTask',
      apiUrl: '${baseUrl}/reinstallationTask/{id}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PanneTaskCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
"images":"",
"Observation":""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'panneTask',
      apiUrl: '${baseUrl}/panneTask/{id}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetNewTaskInfoCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getNewTaskInfo',
      apiUrl: '${baseUrl}/newTask',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTasksDataForReparationCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = TechnicienGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getTasksDataForReparation',
      apiUrl: '${baseUrl}/getTasksDataForReparation',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End  Technicien Group Code

/// Start Gerant Group Code

class GerantGroup {
  static String getBaseUrl() => 'https://d3instal.com/api/gerant';
  static Map<String, String> headers = {};
  static TchesaconfirmerCall tchesaconfirmerCall = TchesaconfirmerCall();
  static AllAppareilsCall allAppareilsCall = AllAppareilsCall();
  static LogDeviceCall logDeviceCall = LogDeviceCall();
  static AppareilsPerUserCall appareilsPerUserCall = AppareilsPerUserCall();
  static SearchTaskToConfirmedCall searchTaskToConfirmedCall =
      SearchTaskToConfirmedCall();
  static UpdateTaskConfirmCall updateTaskConfirmCall = UpdateTaskConfirmCall();
  static DeleteTaskCall deleteTaskCall = DeleteTaskCall();
}

class TchesaconfirmerCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = GerantGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'tchesaconfirmer',
      apiUrl: '${baseUrl}/tâchesaconfirmer',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AllAppareilsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = GerantGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'allAppareils',
      apiUrl: '${baseUrl}/allAppareils',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LogDeviceCall {
  Future<ApiCallResponse> call({
    int? device,
  }) async {
    final baseUrl = GerantGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'logDevice',
      apiUrl: '${baseUrl}/allAppareils/logDevice/{device}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AppareilsPerUserCall {
  Future<ApiCallResponse> call({
    int? userId,
    int? typeId,
  }) async {
    final baseUrl = GerantGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'AppareilsPerUser',
      apiUrl: '${baseUrl}/getAppareilsPerUser/{userId}/{typeId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchTaskToConfirmedCall {
  Future<ApiCallResponse> call({
    String? searchValue = '',
  }) async {
    final baseUrl = GerantGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'searchTaskToConfirmed',
      apiUrl: '${baseUrl}/searchTaskToConfirmed/{searchValue}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTaskConfirmCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = GerantGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'UpdateTaskConfirm',
      apiUrl: '${baseUrl}/UpdateTaskToConfirmed/{id}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteTaskCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = GerantGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteTask',
      apiUrl: '${baseUrl}/deleteTask/{id}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Gerant Group Code

class NotificationsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: ' Notifications',
      apiUrl: 'https://d3instal.com/api/Notification',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
