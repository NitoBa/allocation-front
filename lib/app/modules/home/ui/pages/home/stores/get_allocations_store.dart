import 'package:rx_notifier/rx_notifier.dart';

import '../../../../domain/entities/allocation_item_entity.dart';
import '../../../../domain/usecases/get_allocations.dart';

enum GetAllocationState {
  idle,
  loading,
  sucess,
  empty,
  error,
}

class GetAllocationsStore {
  final IGetAllocations _usecase;
  List<AllocationItemEntity> allocations = [];
  var _state = RxNotifier<GetAllocationState>(GetAllocationState.idle);
  GetAllocationState get state => _state.value;
  String errorMessage = '';

  GetAllocationsStore(this._usecase);

  Future<void> call() async {
    _state.value = GetAllocationState.loading;

    final result = await _usecase();

    result.fold((l) {
      _state.value = GetAllocationState.error;
      errorMessage = l.message;
    }, (r) {
      if (r.isEmpty) {
        _state.value = GetAllocationState.empty;
        return;
      }
      _state.value = GetAllocationState.sucess;
      allocations = r;
    });
  }
}
