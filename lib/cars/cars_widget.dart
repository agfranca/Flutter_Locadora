import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CarsWidget extends StatefulWidget {
  const CarsWidget({Key? key}) : super(key: key);

  @override
  _CarsWidgetState createState() => _CarsWidgetState();
}

class _CarsWidgetState extends State<CarsWidget> {
  PagingController<DocumentSnapshot?, CarrosRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Carros',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                            child: PagedListView<DocumentSnapshot<Object?>?,
                                CarrosRecord>(
                              pagingController: () {
                                final Query<Object?> Function(Query<Object?>)
                                    queryBuilder =
                                    (carrosRecord) => carrosRecord;
                                if (_pagingController != null) {
                                  final query =
                                      queryBuilder(CarrosRecord.collection);
                                  if (query != _pagingQuery) {
                                    // The query has changed
                                    _pagingQuery = query;
                                    _streamSubscriptions
                                        .forEach((s) => s?.cancel());
                                    _streamSubscriptions.clear();
                                    _pagingController!.refresh();
                                  }
                                  return _pagingController!;
                                }

                                _pagingController =
                                    PagingController(firstPageKey: null);
                                _pagingQuery =
                                    queryBuilder(CarrosRecord.collection);
                                _pagingController!
                                    .addPageRequestListener((nextPageMarker) {
                                  queryCarrosRecordPage(
                                    queryBuilder: (carrosRecord) =>
                                        carrosRecord,
                                    nextPageMarker: nextPageMarker,
                                    pageSize: 25,
                                    isStream: true,
                                  ).then((page) {
                                    _pagingController!.appendPage(
                                      page.data,
                                      page.nextPageMarker,
                                    );
                                    final streamSubscription =
                                        page.dataStream?.listen((data) {
                                      final itemIndexes = _pagingController!
                                          .itemList!
                                          .asMap()
                                          .map((k, v) =>
                                              MapEntry(v.reference.id, k));
                                      data.forEach((item) {
                                        final index =
                                            itemIndexes[item.reference.id];
                                        final items =
                                            _pagingController!.itemList!;
                                        if (index != null) {
                                          items.replaceRange(
                                              index, index + 1, [item]);
                                          _pagingController!.itemList = {
                                            for (var item in items)
                                              item.reference: item
                                          }.values.toList();
                                        }
                                      });
                                      setState(() {});
                                    });
                                    _streamSubscriptions
                                        .add(streamSubscription);
                                  });
                                });
                                return _pagingController!;
                              }(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              builderDelegate:
                                  PagedChildBuilderDelegate<CarrosRecord>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                ),

                                itemBuilder: (context, _, listViewIndex) {
                                  final listViewCarrosRecord =
                                      _pagingController!
                                          .itemList![listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 5, 20),
                                    child: Container(
                                      height: 230,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x33000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(12.56, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SelectionArea(
                                                          child: Text(
                                                        listViewCarrosRecord
                                                            .group!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                      )),
                                                      SelectionArea(
                                                          child: Text(
                                                        listViewCarrosRecord
                                                            .name!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      )),
                                                      Container(
                                                        width: 260,
                                                        height: 170,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.contain,
                                                            image:
                                                                Image.network(
                                                              listViewCarrosRecord
                                                                  .imgCar!,
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: Icon(
                                                    Icons.info_outline,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    size: 30,
                                                  ),
                                                  onPressed: () async {
                                                    if (FFAppState().abri1) {
                                                      setState(() =>
                                                          FFAppState().abri1 =
                                                              false);
                                                      return;
                                                    } else {
                                                      setState(() =>
                                                          FFAppState().abri1 =
                                                              true);
                                                      return;
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (FFAppState().abri1)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.84, 0.69),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Container(
                                                    width: 290,
                                                    height: 160,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 5, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            3,
                                                                            0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/mudanca-de-marcha.ico',
                                                                      width: 24,
                                                                      height:
                                                                          22,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    'Cambio',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              16,
                                                                        ),
                                                                  )),
                                                                ],
                                                              ),
                                                              SelectionArea(
                                                                  child: Text(
                                                                listViewCarrosRecord
                                                                    .cambio!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 5, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            3,
                                                                            0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .people_alt,
                                                                      color: Colors
                                                                          .black,
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    'Capacidade',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              16,
                                                                        ),
                                                                  )),
                                                                ],
                                                              ),
                                                              SelectionArea(
                                                                  child: Text(
                                                                listViewCarrosRecord
                                                                    .capacidade!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 5, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            3,
                                                                            0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/mala-de-viagem.png',
                                                                      width: 22,
                                                                      height:
                                                                          22,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    'Bagagem',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              16,
                                                                        ),
                                                                  )),
                                                                ],
                                                              ),
                                                              SelectionArea(
                                                                  child: Text(
                                                                listViewCarrosRecord
                                                                    .bagagem!
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 5, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            3,
                                                                            0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/abs-light.png',
                                                                      width: 28,
                                                                      height:
                                                                          28,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    'ABS',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  )),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
