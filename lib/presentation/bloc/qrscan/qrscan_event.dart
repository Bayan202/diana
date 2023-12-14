abstract class QrScanEvent {}

class QrScanRequested extends QrScanEvent {}

class QrScanCompleted extends QrScanEvent {
  final String qrData;

  QrScanCompleted(this.qrData);
}