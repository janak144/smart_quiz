import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_quiz/theme/theme.dart';

class AddQuizScreen extends StatefulWidget {
  final String? categoryId;
  const AddQuizScreen({super.key, this.categoryId});

  @override
  State<AddQuizScreen> createState() => _AddQuizScreenState();
}

class QuestionFormItem {
  final TextEditingController questionController;
  final List<TextEditingController> optionControllers;
  int correctOptionIndex;

  QuestionFormItem({
    required this.questionController,
    required this.optionControllers,
    required this.correctOptionIndex,
  });
  void dispose() {
    questionController.dispose();
    optionControllers.forEach((element) {
      element.dispose();
    });
  }
}

class _AddQuizScreenState extends State<AddQuizScreen> {
  final _fromKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _timeLimitController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;
  String? _selectedCategoryId;
  List<QuestionFormItem> _questionsItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedCategoryId = widget.categoryId;
    _addQuestion();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _timeLimitController.dispose();
    for (var item in _questionsItems) {
      item.dispose();
    }
    super.dispose();
  }

  void _addQuestion() {
    setState(() {
      _questionsItems.add(
        QuestionFormItem(
          questionController: TextEditingController(),
          optionControllers: List.generate(4, (_) => TextEditingController()),
          correctOptionIndex: 0,
        ),
      );
    });
  }

  //2:24:30
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        title: Text("Add Quiz Question"),
      ),
    );
  }
}
