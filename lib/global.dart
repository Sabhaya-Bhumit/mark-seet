import 'package:flutter/material.dart';
import 'package:vivve_2/student_detail.dart';

class global {
  static List<Student> all_students = [];
  static int page = 0;
  static List<TextEditingController> mark = [];
  static int like = 0;
  static List<List<TextEditingController>> mark2 = [
    [],
  ];
  static List<List<TextEditingController>> subject_add = [
    [],
  ];
}
