import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'banner_item_model.dart';
export 'banner_item_model.dart';

class BannerItemWidget extends StatefulWidget {
  const BannerItemWidget({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<BannerItemWidget> createState() => _BannerItemWidgetState();
}

class _BannerItemWidgetState extends State<BannerItemWidget> {
  late BannerItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BannerItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.url!,
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.8,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(1.0, -1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 0.0,
              borderWidth: 0.0,
              buttonSize: 48.0,
              icon: Icon(
                Icons.close_sharp,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 30.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
