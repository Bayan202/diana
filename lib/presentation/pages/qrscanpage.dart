import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/generate/generated/locale_keys.g.dart';
import 'package:flutter_project/presentation/bloc/qrscan/qrscan_bloc.dart';
import 'package:flutter_project/presentation/bloc/qrscan/qrscan_event.dart';
import 'package:flutter_project/presentation/bloc/qrscan/qrscan_state.dart';
import 'package:flutter_project/presentation/pages/qrpage.dart';
import 'package:flutter_project/utils/const/const.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      BlocProvider.of<QrScanBloc>(context).add(QrScanCompleted(scanData.code ?? "Нет данных"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => QrScanBloc(),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: FlowerColors.primaryColor,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 250,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: FlowerColors.secondaryColor, backgroundColor: FlowerColors.primaryColor,
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ), 
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GeneratePage()),
                );
              },
              child: Text(LocaleKeys.Generation.tr()),
            ),
            Expanded(
              flex: 1,
              child: BlocBuilder<QrScanBloc, QrScanState>(
                builder: (context, state) {
                  if (state is QrScanSuccess) {
                    return Center(
                      child: Text(
                        'Результат сканирования: ${state.qrData}',
                        style: TextStyle(color: FlowerColors.primaryColor, fontSize: 16),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        LocaleKeys.Scan.tr(),
                        style: TextStyle(color: FlowerColors.appColor, fontSize: 16),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}