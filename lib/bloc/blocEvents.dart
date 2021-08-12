import 'package:equatable/equatable.dart';

abstract class DataEvents extends Equatable {
  const DataEvents();
  @override
  List<Object?> get props => [];
}

class StartEvent extends DataEvents {}
