import '/flutter_flow/flutter_flow_util.dart';
import 'reg_page_widget.dart' show RegPageWidget;
import 'package:flutter/material.dart';

class RegPageModel extends FlutterFlowModel<RegPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldController;
  String? Function(BuildContext, String?)? phoneFieldControllerValidator;
  // State field(s) for PassField widget.
  FocusNode? passFieldFocusNode;
  TextEditingController? passFieldController;
  late bool passFieldVisibility;
  String? Function(BuildContext, String?)? passFieldControllerValidator;
  // State field(s) for ConfirmPassField widget.
  FocusNode? confirmPassFieldFocusNode;
  TextEditingController? confirmPassFieldController;
  late bool confirmPassFieldVisibility;
  String? Function(BuildContext, String?)? confirmPassFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passFieldVisibility = false;
    confirmPassFieldVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldController?.dispose();

    passFieldFocusNode?.dispose();
    passFieldController?.dispose();

    confirmPassFieldFocusNode?.dispose();
    confirmPassFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
