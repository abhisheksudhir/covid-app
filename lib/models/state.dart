import 'package:flutter/material.dart';

class States {
  final String stateName;
  final String id;
  final int active;
  final int cured;
  final int death;
  final int total;

  States({
    @required this.stateName,
    @required this.id,
    @required this.active,
    @required this.cured,
    @required this.death,
    @required this.total,
  });
}

