import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter Email',
          'internet_exception':
              "We're unable to show results.\nPlease check your data\nconnection.",
          'general_exception':
              "We're unable to process your request.\nPlease try again."
        },
        'ur_PK': {
          'email_hint': 'ای میل درج کریں۔',
        },
      };
}
