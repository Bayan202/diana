abstract class QrScanState {}

class QrScanInitial extends QrScanState {}

class QrScanInProgress extends QrScanState {}

class QrScanSuccess extends QrScanState {
  final String qrData;

  QrScanSuccess(this.qrData);
}