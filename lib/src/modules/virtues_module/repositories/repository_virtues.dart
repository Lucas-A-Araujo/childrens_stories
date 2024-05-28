import 'package:childrens_stories/src/modules/virtues_module/repositories/api/virtues_api.dart';

class RepositoryVirtues {
  final VirtuesApi _virtuesApi = VirtuesApi();

  getVirtues() => _virtuesApi.getVirtues();
}
