class ValidationPhoneNumber {
   static String cleanPhoneNumber(String number) {
    if (number == null || number.isEmpty) {
      return null;
    }

    List<String> validators = ['+', ' ', '(', ')', '-', '.'];

    List<String> splitList = number.split('');
    for (int i = 0; i < splitList.length; i++) {
      if (validators.contains(splitList[i])) {
        splitList[i] = '';
      }
    }

    String numberResult = splitList.join();

    if (!RegExp(r'[0-9]*').hasMatch(numberResult)) {
      return null;
    }

    if (numberResult.length == 11 && numberResult.startsWith('1')) {
      numberResult = numberResult.substring(1);
      return numberResult;
    }

    if (numberResult.length != 10) {
      return null;
    }

    if (['0', '1'].contains(numberResult[0]) ||
        ['0', '1'].contains(numberResult[3])) {
      return null;
    }
    return numberResult;
  }
}
