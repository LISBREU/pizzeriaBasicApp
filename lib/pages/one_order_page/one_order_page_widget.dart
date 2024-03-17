import '/backend/backend.dart';
import '/components/order_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'one_order_page_model.dart';
export 'one_order_page_model.dart';

class OneOrderPageWidget extends StatefulWidget {
  const OneOrderPageWidget({
    super.key,
    required this.order,
  });

  final DocumentReference? order;

  @override
  State<OneOrderPageWidget> createState() => _OneOrderPageWidgetState();
}

class _OneOrderPageWidgetState extends State<OneOrderPageWidget> {
  late OneOrderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneOrderPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrderRecord>(
      stream: OrderRecord.getDocument(widget.order!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final oneOrderPageOrderRecord = snapshot.data!;
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
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
                    child: Text(
                      'Мой Заказ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final pizzas = oneOrderPageOrderRecord.cart.toList();
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(pizzas.length, (pizzasIndex) {
                            final pizzasItem = pizzas[pizzasIndex];
                            return StreamBuilder<PizzaRecord>(
                              stream:
                                  PizzaRecord.getDocument(pizzasItem.pizza!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final containerPizzaRecord = snapshot.data!;
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: OrderItemWidget(
                                    key: Key(
                                        'Keyi0s_${pizzasIndex}_of_${pizzas.length}'),
                                    name: containerPizzaRecord.name,
                                    desc: containerPizzaRecord.description,
                                    price: pizzasItem.price,
                                    img: containerPizzaRecord.img,
                                    pizzaValue: pizzasItem.quantity,
                                  ),
                                );
                              },
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Сумма: ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '${functions.summPizza(oneOrderPageOrderRecord.cart.toList()).toString()}р.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFF3C3C3C),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
