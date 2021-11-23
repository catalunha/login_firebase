import 'en_US/en_us.dart';
import 'pt_BR/pt_br.dart';

abstract class AppTranslations {
  static Map<String, Map<String, String>> translations = {
    'pt_BR': ptBr,
    'en_US': enUs,
  };
}
