// notifications_provider.dart (version alternative)
import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationProvider extends ChangeNotifier {
  List<TechnicianTaskStruct> _notifications = [];
  bool _isLoading = true;
  String? _errorMessage;

  List<TechnicianTaskStruct> get notifications => _notifications;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Méthode pour vérifier si une notification est lue
  bool isRead(int id) {
    final notification = _notifications.firstWhere(
          (n) => n.id == id,
      orElse: () => TechnicianTaskStruct()..id = -1,
    );
    return notification.id != -1 && notification.notifificationStatus == 0;
  }

  List<TechnicianTaskStruct> get unreadNotifications =>
      _notifications.where((n) => n.notifificationStatus == 1).toList();

  int get unreadCount => unreadNotifications.length;

  Future<void> loadNotifications(String authToken) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final apiResult = await TechnicienGroup.tasksCall.call(authToken);

      if (apiResult.succeeded) {
        _notifications = ((apiResult.jsonBody ?? '').toList()
            .map<TechnicianTaskStruct?>(TechnicianTaskStruct.maybeFromMap)
            .toList() as Iterable<TechnicianTaskStruct?>)
            .withoutNulls
            .toList()
            .cast<TechnicianTaskStruct>();
      } else {
        _errorMessage = 'Erreur lors du chargement des notifications';
      }
    } catch (e) {
      _errorMessage = 'Erreur: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void markAsRead(int id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      final old = _notifications[index];

      _notifications[index].notifificationStatus = 0;

      notifyListeners();
      print('Notification $id marquée comme lue');
    }
  }

  void markAllAsRead() {
    for (var notification in _notifications) {
      notification.notifificationStatus = 0;
    }
    notifyListeners();
  }

  void clearNotifications() {
    _notifications.clear();
    notifyListeners();
  }

  void addNotification(TechnicianTaskStruct notification) {
    _notifications.insert(0, notification);
    notifyListeners();
  }
}