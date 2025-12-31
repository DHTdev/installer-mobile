import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<TechnicianTaskStruct>? filterTasks(
  List<TechnicianTaskStruct>? tasks,
  String? cityFilter,
  String? dateFilter,
  String? searchText,
) {
  // ===== FILTER TASKS =====

  if (tasks == null) return [];

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(Duration(days: 1));
  final tomorrow = today.add(Duration(days: 1));

  return tasks.where((task) {
    // ===== CITY FILTER =====
    if (cityFilter != null && cityFilter.isNotEmpty && cityFilter != "Toutes les villes") {
      if ((task.cityName ?? '').toLowerCase().trim() != cityFilter.toLowerCase().trim()) {
        return false;
      }
    }

    // ===== DATE FILTER =====
    if (dateFilter != null && dateFilter.isNotEmpty && dateFilter != "ALL") {
      final taskDateTime = DateTime.tryParse(task.date_previsionnelle_debut.toString() ?? '');
      if (taskDateTime == null) return false;

      final taskDate = DateTime(taskDateTime.year, taskDateTime.month, taskDateTime.day);

      if (dateFilter == "aujourd'hui" && taskDate != today) return false;
      if (dateFilter == "hier" && taskDate != yesterday) return false;
      if (dateFilter == "demain" && taskDate != tomorrow) return false;
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

    return true;
  }).toList();

  // ===== END FILTER TASKS =====
}

// ===== FILTER DEVICES =====
List<GpsStruct>? filterDevices(
  List<GpsStruct>? devices,
  String? searchText,
) {
  if (devices == null) return [];

  return devices.where((device) {
    // ===== TEXT SEARCH =====
    if (searchText != null && searchText.trim().isNotEmpty) {
      final text = searchText.toLowerCase().trim();
      final serialNumber = (device.serialNumber ?? '').toLowerCase();
      final simRelating = (device.serialNumberCombination ?? '').toLowerCase();
      final model = (device.nameModele ?? '').toLowerCase();
      final brand = (device.nameType ?? '').toLowerCase();

      if (!serialNumber.contains(text) && !simRelating.contains(text) && !model.contains(text) && !brand.contains(text)) {
        return false;
      }
    }

    return true;
  }).toList();

  // ===== END FILTER DEVICES =====
}

// ===== FILTER SIM =====
List<SimStruct>? filterSIM(
  List<SimStruct>? sims,
  String? searchText,
) {
  if (sims == null) return [];

  return sims.where((sim) {
    // ===== TEXT SEARCH =====
    if (searchText != null && searchText.trim().isNotEmpty) {
      final text = searchText.toLowerCase().trim();
      final serialNumber = (sim.serialNumber ?? '').toLowerCase();
      final model = (sim.nameModele ?? '').toLowerCase();
      final brand = (sim.nameType ?? '').toLowerCase();

      if (!serialNumber.contains(text) && !model.contains(text) && !brand.contains(text)) {
        return false;
      }
    }

    return true;
  }).toList();

  // ===== END FILTER SIM =====
}

// ===== FILTER ACCESSORY =====
List<AccessoryStruct>? filterAccessories(
  List<AccessoryStruct>? accessories,
  String? searchText,
) {
  if (accessories == null) return [];

  return accessories.where((accessory) {
    // ===== TEXT SEARCH =====
    if (searchText != null && searchText.trim().isNotEmpty) {
      final text = searchText.toLowerCase().trim();
      final serialNumber = (accessory.serialNumber ?? '').toLowerCase();
      final model = (accessory.nameModele ?? '').toLowerCase();
      final brand = (accessory.nameType ?? '').toLowerCase();

      if (!serialNumber.contains(text) && !model.contains(text) && !brand.contains(text)) {
        return false;
      }
    }

    return true;
  }).toList();
}
// ===== END FILTER ACCESSORY =====

// ===== FILTER TASHE CONFIRMER =====
List<TechnicianTaskStruct>? filterTacheaConfirmer(
  List<TechnicianTaskStruct>? TechnicianTasks,
  String? searchText,
) {
  if (TechnicianTasks == null) return [];

  return TechnicianTasks.where((techniciantask) {
    // ===== TEXT SEARCH =====
    if (searchText != null && searchText.trim().isNotEmpty) {
      final text = searchText.toLowerCase().trim();
      final nomClient = (techniciantask.clientName ?? '').toLowerCase();

      if (!nomClient.contains(text)) {
        return false;
      }
    }

    return true;
  }).toList();
}

// ===== END FILTER TASHE CONFIRMER =====

// ===== FILTER DEVICES DESINSTAlLED =====
List<ReturnedDevicesStruct>? filterDesinstalledDevices(
  List<ReturnedDevicesStruct>? desinstalledDevices,
  String? searchText,
) {
  if (desinstalledDevices == null) return [];

  return desinstalledDevices.where((desinstalledDevice) {
    // ===== TEXT SEARCH =====
    if (searchText != null && searchText.trim().isNotEmpty) {
      final text = searchText.toLowerCase().trim();
      final nomClient = (desinstalledDevice.nomComplet ?? '').toLowerCase();
      final matricule = (desinstalledDevice.matricule ?? '').toLowerCase();
      final serialNumber = (desinstalledDevice.serialNumber ?? '').toLowerCase();
      final deviceType = (desinstalledDevice.nameModele ?? '').toLowerCase();

      if (!nomClient.contains(text) && !matricule.contains(text) && !serialNumber.contains(text) && !deviceType.contains(text)) {
        return false;
      }
    }

    return true;
  }).toList();
}

  // ===== END FILTER TASHE CONFIRMER =====