import 'package:rx_notifier/rx_notifier.dart';

import '../../../../domain/entities/project_resume_entity.dart';
import '../../../../domain/usecases/get_projects_resume.dart';

enum GetProjectResumeState {
  idle,
  loading,
  sucess,
  empty,
  error,
}

class GetProjectResumeStore {
  final IGetProjectResumes _usecase;
  List<ProjectResumeEntity> projectResumes = [];
  var _state = RxNotifier<GetProjectResumeState>(GetProjectResumeState.idle);
  GetProjectResumeState get state => _state.value;
  String errorMessage = '';

  GetProjectResumeStore(this._usecase);

  Future<void> call() async {
    _state.value = GetProjectResumeState.loading;

    final result = await _usecase();

    result.fold((l) {
      _state.value = GetProjectResumeState.error;
      errorMessage = l.message;
    }, (r) {
      if (r.isEmpty) {
        _state.value = GetProjectResumeState.empty;
        return;
      }
      _state.value = GetProjectResumeState.sucess;
      projectResumes = r;
    });
  }
}
