import '/backend/backend.dart';
import '/components/favorite_item_widget.dart';
import '/components/item_pizza_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_page_model.dart';
export 'favorite_page_model.dart';

class FavoritePageWidget extends StatefulWidget {
  const FavoritePageWidget({super.key});

  @override
  State<FavoritePageWidget> createState() => _FavoritePageWidgetState();
}

class _FavoritePageWidgetState extends State<FavoritePageWidget> {
  late FavoritePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: true,
            title: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/AppBar.png',
                width: 93.0,
                height: 30.0,
                fit: BoxFit.cover,
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 16.0),
                child: Text(
                  'Избранное',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: const Color(0xFF3C3C3C),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              if (!(FFAppState().favorites.isNotEmpty))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Ничего нет',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final favorites = FFAppState().favorites.toList();
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(favorites.length, (favoritesIndex) {
                        final favoritesItem = favorites[favoritesIndex];
                        return Container(
                          decoration: const BoxDecoration(),
                          child: StreamBuilder<PizzaRecord>(
                            stream: PizzaRecord.getDocument(favoritesItem),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final favoriteItemPizzaRecord = snapshot.data!;
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.9,
                                            child: ItemPizzaWidget(
                                              name:
                                                  favoriteItemPizzaRecord.name,
                                              desc: favoriteItemPizzaRecord
                                                  .description,
                                              price:
                                                  favoriteItemPizzaRecord.price,
                                              img: favoriteItemPizzaRecord.img,
                                              ref: favoriteItemPizzaRecord
                                                  .reference,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: FavoriteItemWidget(
                                  key: Key(
                                      'Keyxfr_${favoritesIndex}_of_${favorites.length}'),
                                  name: favoriteItemPizzaRecord.name,
                                  desc: favoriteItemPizzaRecord.description,
                                  price: favoriteItemPizzaRecord.price,
                                  img: favoriteItemPizzaRecord.img,
                                  ref: favoriteItemPizzaRecord.reference,
                                ),
                              );
                            },
                          ),
                        );
                      }).divide(const SizedBox(height: 16.0)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
