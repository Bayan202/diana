import 'package:flutter_bloc/flutter_bloc.dart';
import 'qrscan_event.dart';
import 'qrscan_state.dart';

class QrScanBloc extends Bloc<QrScanEvent, QrScanState> {
  QrScanBloc() : super(QrScanInitial()) {
    on<QrScanRequested>(_onQrScanRequested);
    on<QrScanCompleted>(_onQrScanCompleted);
  }

  void _onQrScanRequested(QrScanRequested event, Emitter<QrScanState> emit) {
    emit(QrScanInitial());
  }

  void _onQrScanCompleted(QrScanCompleted event, Emitter<QrScanState> emit) {
    emit(QrScanSuccess(event.qrData));
  }
}