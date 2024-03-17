import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'order_page_widget.dart' show OrderPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OrderPageModel extends FlutterFlowModel<OrderPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for streetField widget.
  FocusNode? streetFieldFocusNode;
  TextEditingController? streetFieldController;
  String? Function(BuildContext, String?)? streetFieldControllerValidator;
  // State field(s) for houseField widget.
  FocusNode? houseFieldFocusNode;
  TextEditingController? houseFieldController;
  String? Function(BuildContext, String?)? houseFieldControllerValidator;
  // State field(s) for roomField widget.
  FocusNode? roomFieldFocusNode;
  TextEditingController? roomFieldController;
  String? Function(BuildContext, String?)? roomFieldControllerValidator;
  // State field(s) for phoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldController;
  final phoneFieldMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneFieldControllerValidator;
  // State field(s) for commentField widget.
  FocusNode? commentFieldFocusNode;
  TextEditingController? commentFieldController;
  String? Function(BuildContext, String?)? commentFieldControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    streetFieldFocusNode?.dispose();
    streetFieldController?.dispose();

    houseFieldFocusNode?.dispose();
    houseFieldController?.dispose();

    roomFieldFocusNode?.dispose();
    roomFieldController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldController?.dispose();

    commentFieldFocusNode?.dispose();
    commentFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
