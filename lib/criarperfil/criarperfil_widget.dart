import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CriarperfilWidget extends StatefulWidget {
  const CriarperfilWidget({Key? key}) : super(key: key);

  @override
  _CriarperfilWidgetState createState() => _CriarperfilWidgetState();
}

class _CriarperfilWidgetState extends State<CriarperfilWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? yourNameController;
  TextEditingController? yourTellController;
  TextEditingController? cityController;
  String? stateValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    cityController = TextEditingController();
    yourNameController = TextEditingController();
    yourTellController = TextEditingController();
  }

  @override
  void dispose() {
    cityController?.dispose();
    yourNameController?.dispose();
    yourTellController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(0xFFFFF8F8),
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 50,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Color(0xFF100A0A),
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            'Voltar',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                    child: Text(
                      'Page Title',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 2,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      final selectedMedia = await selectMedia(
                        imageQuality: 60,
                        mediaSource: MediaSource.photoGallery,
                        multiImage: false,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        setState(() => isMediaUploading = true);
                        var downloadUrls = <String>[];
                        try {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          isMediaUploading = false;
                        }
                        if (downloadUrls.length == selectedMedia.length) {
                          setState(() => uploadedFileUrl = downloadUrls.first);
                          showUploadMessage(context, 'Success!');
                        } else {
                          setState(() {});
                          showUploadMessage(context, 'Failed to upload media');
                          return;
                        }
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFDBE2E7),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            '',
                          ).image,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: Container(
                          width: 90,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            valueOrDefault<String>(
                              uploadedFileUrl,
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/senac-7rgs0x/assets/t16s2vfhuxwp/add_final.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: yourNameController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Seu nome',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintStyle: FlutterFlowTheme.of(context).bodyText2,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).bord,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).bord,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: null,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: yourTellController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'digite seu telefone',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintStyle: FlutterFlowTheme.of(context).bodyText2,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).bord,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).bord,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                maxLines: null,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: cityController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'sua cidade',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintStyle: FlutterFlowTheme.of(context).bodyText2,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).bord,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).bord,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
                maxLines: null,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: FlutterFlowDropDown<String>(
                initialOption: stateValue ??= 'Estado',
                options: [
                  'Estado',
                  'São Paulo',
                  'Rio de Janeiro',
                  'Sergipe',
                  '',
                  ''
                ],
                onChanged: (val) => setState(() => stateValue = val),
                width: double.infinity,
                height: 56,
                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF57636C),
                    ),
                hintText: 'Select State',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 15,
                ),
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 2,
                borderColor: FlutterFlowTheme.of(context).bord,
                borderWidth: 2,
                borderRadius: 8,
                margin: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                hidesUnderline: true,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.05),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Save Changes',
                  options: FFButtonOptions(
                    width: 270,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
