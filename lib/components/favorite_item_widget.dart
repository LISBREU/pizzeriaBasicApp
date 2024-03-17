import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_item_model.dart';
export 'favorite_item_model.dart';

class FavoriteItemWidget extends StatefulWidget {
  const FavoriteItemWidget({
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
  State<FavoriteItemWidget> createState() => _FavoriteItemWidgetState();
}

class _FavoriteItemWidgetState extends State<FavoriteItemWidget> {
  late FavoriteItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteItemModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.img!,
                width: 160.0,
                height: 160.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.name,
                      '-',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget.desc,
                    '-',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: const Color(0x5B5B5B5B),
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0x65EE8B60),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              18.0, 9.0, 18.0, 9.0),
                          child: Text(
                            '${valueOrDefault<String>(
                              widget.price?.toString(),
                              '-',
                            )} р.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 12.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    ToggleIcon(
                      onPressed: () async {
                        setState(
                          () => FFAppState().favorites.contains(widget.ref)
                              ? FFAppState().removeFromFavorites(widget.ref!)
                              : FFAppState().addToFavorites(widget.ref!),
                        );
                        FFAppState().update(() {});
                      },
                      value: FFAppState().favorites.contains(widget.ref),
                      onIcon: Icon(
                        Icons.favorite,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                      offIcon: Icon(
                        Icons.favorite_border_rounded,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
