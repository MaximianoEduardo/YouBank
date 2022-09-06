import 'package:youbank/common/service.dart';
import 'package:youbank/models/user_models.dart';

class Repository {
  Future getuser() async {
    try {
      final response = await HttpService.getRequest();

      if (response.statusCode == 200) {
        final result = userFromMap(response.body);

        return result;
      }
    } catch (e) {
      rethrow;
    }
  }
}
