import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<TechnicianTaskStruct>? filterTasks(
  List<TechnicianTaskStruct>? tasks,
  String? cityFilter,
  String? dateFilter,
  String? searchText,
  String? categoryFilter,
  String? statusFilter,
) {
  if (tasks == null) return [];

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(Duration(days: 1));
  final tomorrow = today.add(Duration(days: 1));

  return tasks.where((task) {
    // ===== CITY FILTER =====
    if (cityFilter != null &&
        cityFilter.isNotEmpty &&
        cityFilter != "Toutes les villes") {
      if ((task.cityName ?? '').toLowerCase().trim() !=
          cityFilter.toLowerCase().trim()) {
        return false;
      }
    }

    // ===== DATE FILTER =====
    if (dateFilter != null && dateFilter.isNotEmpty && dateFilter != "ALL") {
      final taskDateTime =
          DateTime.tryParse(task.datePrevisionnelleDebut ?? '');
      if (taskDateTime == null) return false;

      final taskDate =
          DateTime(taskDateTime.year, taskDateTime.month, taskDateTime.day);

      if (dateFilter == "Aujourd'hui" && taskDate != today) return false;
      if (dateFilter == "Hier" && taskDate != yesterday) return false;
      if (dateFilter == "Demain" && taskDate != tomorrow) return false;
    }

    // ===== TEXT SEARCH =====
    if (searchText != null && searchText.trim().isNotEmpty) {
      final text = searchText.toLowerCase().trim();
      final clientName = (task.clientName ?? '').toLowerCase();
      final category = (task.catache ?? '').toLowerCase();

      if (!clientName.contains(text) && !category.contains(text)) {
        return false;
      }
    }

    // ===== CATEGORY FILTER =====
    if (categoryFilter != null &&
        categoryFilter.isNotEmpty &&
        categoryFilter != "ALL") {
      if ((task.catache ?? '').toLowerCase().trim() !=
          categoryFilter.toLowerCase().trim()) {
        return false;
      }
    }

    // ===== STATUS FILTER =====
    if (statusFilter != null &&
        statusFilter.isNotEmpty &&
        statusFilter != "ALL") {
      final selectedStatus = int.tryParse(statusFilter);
      if (selectedStatus == null) return false;

      if (task.etatTache != selectedStatus) {
        return false;
      }
    }

    return true;
  }).toList();
}
