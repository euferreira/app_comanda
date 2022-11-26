import 'package:get/get.dart';

typedef ValidatorFunction = String? Function(String? value);

extension ValidatorFunctionExtension on ValidatorFunction {
  ValidatorFunction required() {
    return (String? value) {
      final result = Validators.required()(value);
      if (result != null) {
        return result;
      }

      return this(value);
    };
  }
}

class Validators {
  static ValidatorFunction required() {
    return (String? value) {
      if (value == null || value == '') return 'Campo obrigatório';

      return null;
    };
  }

  static ValidatorFunction minLength(int length, {String? message}) {
    return (String? value) {
      if (value == null || value.isEmpty) return 'Campo obrigatório';

      if (value.length < length) {
        return message ?? 'Mínimo de $length caracteres';
      }

      return null;
    };
  }

  static ValidatorFunction email() {
    return (String? value) {
      if (value == null || value == '') return 'Campo obrigatório';

      if (!value.isEmail) return 'E-mail inválido';

      return null;
    };
  }

  static ValidatorFunction phone() {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      RegExp regex = new RegExp(r"(\(?\d{2}\)?\s)?(\d{4,5}\-\d{4})");

      if (!regex.hasMatch(value)) return 'Telefone inválido';

      return null;
    };
  }

  static ValidatorFunction cpf({required String cpf}) {
    return (String? value) {
      if (value?.isCpf != true && cpf.isCpf != true) return 'CPF inválido';

      return null;
    };
  }

  static ValidatorFunction passwordStrong() {
    return (String? value) {
      if (value == null || value == '') return 'Campo obrigatório';

      if (value.length < 6) return 'A senha deve conter ao menos 6 caracteres';

      RegExp r =
          new RegExp(r"^(?=.*\d)(?=.*[a-z])(?:([0-9a-zA-Z$*&@#])(?!\1)){6,}$");
      if (!r.hasMatch(value))
        return 'A senha deve conter letras e ao menos um número';

      return null;
    };
  }

  static ValidatorFunction birthday() {
    return (String? value) {
      if (value == null || value.isEmpty) return null;

      final components = value.split("/");
      if (components.length == 3) {
        final day = int.tryParse(components[0]);
        final month = int.tryParse(components[1]);
        final year = int.tryParse(components[2]);
        if (day != null && month != null && year != null) {
          final date = DateTime(year, month, day);
          if (year <= 1900 || year >= DateTime.now().year - 10) {
            return 'Ano inválido';
          }
          if (date.year == year && date.month == month && date.day == day) {
            return null;
          }
        }
      }
      return "Data inválida";
    };
  }

  static String? passwordEqual(String? value, String toVerify) {
    if (value == null || value == '')
      return 'Campo obrigatório';
    else if (value != toVerify) return 'As senhas devem ser iguais';
    return null;
  }
}
