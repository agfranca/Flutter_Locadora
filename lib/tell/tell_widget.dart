import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class TellWidget extends StatefulWidget {
  const TellWidget({Key? key}) : super(key: key);

  @override
  _TellWidgetState createState() => _TellWidgetState();
}

class _TellWidgetState extends State<TellWidget> with TickerProviderStateMixin {
  TextEditingController? phoneNumberController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    phoneNumberController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Phone Sign In',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                  child: Text(
                    'Type in your phone number below to register.',
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
            child: TextFormField(
              controller: phoneNumberController,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Your Phone Number',
                labelStyle: FlutterFlowTheme.of(context).bodyText2,
                hintText: 'Please enter a valid number...',
                hintStyle: FlutterFlowTheme.of(context).bodyText2,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF0F1113),
                  ),
              maxLines: null,
              keyboardType: TextInputType.phone,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                final phoneNumberVal = phoneNumberController!.text;
                if (phoneNumberVal == null ||
                    phoneNumberVal.isEmpty ||
                    !phoneNumberVal.startsWith('+')) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Phone Number is required and has to start with +.'),
                    ),
                  );
                  return;
                }
                await beginPhoneAuth(
                  context: context,
                  phoneNumber: phoneNumberVal,
                  onCodeSent: () async {
                    context.goNamedAuth('tellconfirm', mounted);
                  },
                );
              },
              text: 'Sign In with Phone',
              options: FFButtonOptions(
                width: 230,
                height: 50,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                elevation: 3,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
