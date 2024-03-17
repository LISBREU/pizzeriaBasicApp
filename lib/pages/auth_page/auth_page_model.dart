import '/flutter_flow/flutter_flow_util.dart';
import 'auth_page_widget.dart' show AuthPageWidget;
import 'package:flutter/material.dart';

class AuthPageModel extends FlutterFlowModel<AuthPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  // State field(s) for PassField widget.
  FocusNode? passFieldFocusNode;
  TextEditingController? passFieldController;
  late bool passFieldVisibility;
  String? Function(BuildContext, String?)? passFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passFieldVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();

    passFieldFocusNode?.dispose();
    passFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
