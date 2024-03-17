import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_pizza_model.dart';
export 'item_pizza_model.dart';

class ItemPizzaWidget extends StatefulWidget {
  const ItemPizzaWidget({
    super.key,
    required this.name,
    required this.desc,
    required this.price,
    required this.img,
    required this.ref,
  });

  final String? name;
  final String? desc;
  final int? price;
  final String? img;
  final DocumentReference? ref;

  @override
  State<ItemPizzaWidget> createState() => _ItemPizzaWidgetState();
}

class _ItemPizzaWidgetState extends State<ItemPizzaWidget> {
  late ItemPizzaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemPizzaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                      child: Image.network(
                        widget.img!,
                        width: 208.0,
                        height: 208.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.name,
                      '-',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 40.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.desc,
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        FFAppState().addToCart(CartStruct(
                          pizza: widget.ref,
                          price: widget.price,
                          quantity: 1,
                        ));
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Пицца успешно добавлена',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 14.0,
                            ),
                          ),
                          duration: const Duration(milliseconds: 2400),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    },
                    text: 'Добавить в корзину за ${valueOrDefault<String>(
                      widget.price?.toString(),
                      '-',
                    )} р.',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFFFF6803),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToggleIcon(
                  onPressed: () async {
                    setState(
                      () => FFAppState().favorites.contains(widget.ref)
                          ? FFAppState().removeFromFavorites(widget.ref!)
                          : FFAppState().addToFavorites(widget.ref!),
                    );
                  },
                  value: FFAppState().favorites.contains(widget.ref),
                  onIcon: Icon(
                    Icons.favorite,
                    color: FlutterFlowTheme.of(context).error,
                    size: 36.0,
                  ),
                  offIcon: Icon(
                    Icons.favorite_border_rounded,
                    color: FlutterFlowTheme.of(context).error,
                    size: 36.0,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 48.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
