import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
  }) =>
      [ruText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginPage
  {
    'mi0ptr7q': {
      'ru': 'Система  Управления Заявками',
      'en': 'Task management system',
    },
    'a7x6cubj': {
      'ru': 'Авторизация',
      'en': 'Authorization',
    },
    'pnzkzteh': {
      'ru': 'Эл.почта',
      'en': 'Email',
    },
    '1akar5sm': {
      'ru': 'Пароль',
      'en': 'Password',
    },
    'lpr2x7hm': {
      'ru': 'Войти',
      'en': '',
    },
    '8xg1t4be': {
      'ru': 'Home',
      'en': '',
    },
  },
  // UserListPageBak
  {
    '8g12gy1w': {
      'ru': 'Список сотрудников',
      'en': '',
    },
    'qpxhhj2j': {
      'ru': 'Random Name',
      'en': '',
    },
    'd82ogszd': {
      'ru': 'user@randomname.com',
      'en': '',
    },
    'gshfsbu2': {
      'ru': 'Random Name',
      'en': '',
    },
    'llkvacm6': {
      'ru': 'user@randomname.com',
      'en': '',
    },
    'j507mbxr': {
      'ru': 'Random Name',
      'en': '',
    },
    'n7ofnf0h': {
      'ru': 'user@randomname.com',
      'en': '',
    },
    'd0yfv96w': {
      'ru': 'Random Name',
      'en': '',
    },
    '6pxh6d0t': {
      'ru': 'user@randomname.com',
      'en': '',
    },
    'fd44ta9n': {
      'ru': 'Система  Управления Заявками на Сервисное Обслуживание',
      'en': '',
    },
    '4xqra9tm': {
      'ru': 'Home',
      'en': '',
    },
  },
  // TaskListPageBak
  {
    '8ozdabq1': {
      'ru': 'Заявки',
      'en': '',
    },
    'wq27b8rx': {
      'ru': 'Сотрудники',
      'en': '',
    },
    'myvi7uf7': {
      'ru': 'Загрузка',
      'en': '',
    },
    'gb4bzdga': {
      'ru': 'Отчеты',
      'en': '',
    },
    'yc01l3tw': {
      'ru': 'Текущие Заявки',
      'en': '',
    },
    'jm3yxqh2': {
      'ru': '№ пп',
      'en': '',
    },
    'k39uqat1': {
      'ru': 'Дата',
      'en': '',
    },
    '7fze6h8c': {
      'ru': 'Название ТП',
      'en': '',
    },
    'iyzgx9fe': {
      'ru': 'Телефон',
      'en': '',
    },
    'xg5uclko': {
      'ru': 'Вид работ',
      'en': '',
    },
    'wdtoq5vb': {
      'ru': 'ID Терминала',
      'en': '',
    },
    'f2snyw9d': {
      'ru': 'Адрес',
      'en': '',
    },
    'ydrjmuea': {
      'ru': 'Исполнитель',
      'en': '',
    },
    '7deqe9jx': {
      'ru': 'Статус',
      'en': '',
    },
    'rxnwh9z5': {
      'ru': 'Система  Управления Заявками на Сервисное Обслуживание',
      'en': '',
    },
    '748t2gay': {
      'ru': 'Home',
      'en': '',
    },
  },
  // TaskUserListPageBak
  {
    'wkloc1ve': {
      'ru': 'check.io',
      'en': '',
    },
    'eh7m70vr': {
      'ru': 'Andrew D.',
      'en': '',
    },
    'p7y9lp1c': {
      'ru': 'admin@gmail.com',
      'en': '',
    },
    'q5uybjyi': {
      'ru': 'Dashboard',
      'en': '',
    },
    'hlg68y6u': {
      'ru': 'Transactions',
      'en': '',
    },
    'r0u8m6yu': {
      'ru': 'Projects',
      'en': '',
    },
    'swo1k6m0': {
      'ru': 'Users',
      'en': '',
    },
    '1wr6546p': {
      'ru': 'Сегодня',
      'en': '',
    },
    '0ejhj6p8': {
      'ru': 'Мои задания',
      'en': '',
    },
    'z8ihjebu': {
      'ru': '12',
      'en': '',
    },
    'gpu35eoj': {
      'ru': 'Build out a design system in FlutterFlow',
      'en': '',
    },
    'b9wz6f9t': {
      'ru': '16 Jan, 2023',
      'en': '',
    },
    '7xj3w08g': {
      'ru': 'Design System',
      'en': '',
    },
    'nvp5m9dx': {
      'ru': 'Complete 100 Templates',
      'en': '',
    },
    'aif39sxv': {
      'ru': '15 Jan, 2023',
      'en': '',
    },
    'r6r6znbe': {
      'ru': 'FF Development',
      'en': '',
    },
    'ze3jnpbx': {
      'ru': 'Неделя',
      'en': '',
    },
    'k0xmiigd': {
      'ru': 'Due this week',
      'en': '',
    },
    'vcd00ivd': {
      'ru': '12',
      'en': '',
    },
    '9i9m1cbc': {
      'ru': 'Update our command Palette to be more usable.',
      'en': '',
    },
    '6uqdllhe': {
      'ru': '18 Jan, 2023',
      'en': '',
    },
    '6k0woe4x': {
      'ru': 'Product',
      'en': '',
    },
    'zvtv74tq': {
      'ru': 'Build out a design system in FlutterFlow',
      'en': '',
    },
    'otwshttz': {
      'ru': '16 Jan, 2023',
      'en': '',
    },
    '5pn40wka': {
      'ru': 'Design System',
      'en': '',
    },
    'l8fn4xa5': {
      'ru': 'Complete 100 Templates',
      'en': '',
    },
    'laiiazht': {
      'ru': '15 Jan, 2023',
      'en': '',
    },
    'n8woknvl': {
      'ru': 'FF Development',
      'en': '',
    },
    'd7z26zjz': {
      'ru': '2 Недели',
      'en': '',
    },
    '1o1ula0k': {
      'ru': 'Home',
      'en': '',
    },
  },
  // UserAddPage
  {
    'xg8fpfhr': {
      'ru': 'Добавить пользователя',
      'en': '',
    },
    '3kkxh9zw': {
      'ru': '.',
      'en': '',
    },
    'hjg58wft': {
      'ru': 'Email',
      'en': '',
    },
    'qemh1yl9': {
      'ru': 'Password',
      'en': '',
    },
    '4f26n6tu': {
      'ru': 'Создать',
      'en': '',
    },
    '875xp141': {
      'ru': 'Home',
      'en': '',
    },
  },
  // TaskEditPage
  {
    'kybg95d9': {
      'ru': 'Информация о ТСП',
      'en': '',
    },
    'ucbq2o1r': {
      'ru': 'Название ТСП',
      'en': '',
    },
    'r1ywds96': {
      'ru': 'Адрес ТСП',
      'en': '',
    },
    'zkh7vgxp': {
      'ru': 'Телефон',
      'en': '',
    },
    'gne4taaz': {
      'ru': 'Договор эквайринга',
      'en': '',
    },
    'yowhb1nw': {
      'ru': 'Информация об оборудовании',
      'en': '',
    },
    'i9gverpq': {
      'ru': 'Номер РР',
      'en': '',
    },
    'fg5taxos': {
      'ru': 'Модель',
      'en': '',
    },
    'putk2tvr': {
      'ru': 'Номер #2',
      'en': '',
    },
    'mquxr67x': {
      'ru': 'Тип связи',
      'en': '',
    },
    'anndvcau': {
      'ru': 'Причина неисправности',
      'en': '',
    },
    'yyrqn4du': {
      'ru': 'Выполнение',
      'en': '',
    },
    'pjhjmpzu': {
      'ru': 'Вид работ',
      'en': '',
    },
    '0espr69a': {
      'ru': 'CRM ID',
      'en': '',
    },
    'ydno50kj': {
      'ru': 'Статус',
      'en': '',
    },
    '8xm2tw8t': {
      'ru': 'Время завершения',
      'en': '',
    },
    'upst8cya': {
      'ru': 'Это перенос?',
      'en': '',
    },
    'okpa75kk': {
      'ru': 'Исполнитель',
      'en': '',
    },
    'eamhnn8i': {
      'ru': 'Число обучаемых',
      'en': '',
    },
    'grpf1ays': {
      'ru': 'Комментарий исполнителя',
      'en': '',
    },
    'efv7yuba': {
      'ru': 'Внутренний комментарий',
      'en': '',
    },
    'gci9weew': {
      'ru': 'Комментарий по выезду',
      'en': '',
    },
    'zoox7wmg': {
      'ru': 'Комментарий по парковке',
      'en': '',
    },
    'tbucemny': {
      'ru': 'Перенос',
      'en': '',
    },
    'yuu2h0td': {
      'ru': 'Причина переноса',
      'en': '',
    },
    '6268oajh': {
      'ru': 'Комментарий',
      'en': '',
    },
    '1o4qt49j': {
      'ru': 'Дата переноса',
      'en': '',
    },
    'rx8izb3v': {
      'ru': 'Контакт на месте',
      'en': '',
    },
    'z4pxvg0p': {
      'ru': 'Контакт на месте 2',
      'en': '',
    },
  },
  // UserListPage
  {
    '3jfzhvwb': {
      'ru': '№ ',
      'en': '',
    },
    'cywe79wk': {
      'ru': 'Фамилия',
      'en': '',
    },
    'g0msqf6c': {
      'ru': 'Имя',
      'en': '',
    },
    '7yiw4kui': {
      'ru': 'Эл. Почта',
      'en': '',
    },
    'l4n1ejx1': {
      'ru': 'Телефон',
      'en': '',
    },
    'x5nhar9h': {
      'ru': 'Исп.',
      'en': '',
    },
    't6oxbkkv': {
      'ru': 'Адм.',
      'en': '',
    },
    'ymldx3sw': {
      'ru': '',
      'en': '',
    },
    '87t6y9bc': {
      'ru': 'Система  Управления Заявками',
      'en': '',
    },
    'n1qzibtb': {
      'ru': 'Home',
      'en': '',
    },
  },
  // entryPage
  {
    't1nxyqu2': {
      'ru': 'Загружаем приложение...',
      'en': 'Loading...',
    },
    'zee1t70y': {
      'ru': 'TextField',
      'en': '',
    },
    'cehls25v': {
      'ru': 'Главная',
      'en': 'Home',
    },
  },
  // TaskListPage
  {
    'hjrhtxcj': {
      'ru': 'Загрузить',
      'en': '',
    },
    'fl11zizp': {
      'ru': 'Отчёт',
      'en': '',
    },
    'wq0isda1': {
      'ru': 'Выгрузить',
      'en': '',
    },
    'q3ry8b92': {
      'ru': '№',
      'en': '#',
    },
    'kyboxrj8': {
      'ru': 'Название ТП',
      'en': 'TP Name',
    },
    '3bc9159r': {
      'ru': 'Описание',
      'en': 'Mobile',
    },
    'zxmyhhdl': {
      'ru': 'Вид работ',
      'en': 'Task Category',
    },
    'ioqmsljp': {
      'ru': 'ID Терминала',
      'en': 'Terminal ID',
    },
    'rwpnichv': {
      'ru': 'Адрес',
      'en': 'Address',
    },
    'srr1r896': {
      'ru': 'Исполнитель',
      'en': 'Doer',
    },
    'xu4ur9x2': {
      'ru': 'Статус',
      'en': 'Status',
    },
    'eylvyzd2': {
      'ru': 'Система управления заявками',
      'en': 'Tasks and Doers',
    },
    'kcb6b2ry': {
      'ru': 'Главня',
      'en': 'Home',
    },
  },
  // UserEditPage
  {
    '9yn7k3sp': {
      'ru': 'Система  Управления Заявками на Сервисное Обслуживание',
      'en': '',
    },
    'sbkmwvfd': {
      'ru': 'Сотрудник',
      'en': '',
    },
    'pcc7zt5u': {
      'ru': 'Профиль сотрудника',
      'en': '',
    },
    'bu2dg7j5': {
      'ru': 'Имя и Отчество',
      'en': '',
    },
    '747xy92z': {
      'ru': 'Фамилия',
      'en': '',
    },
    'qkj44d8y': {
      'ru': 'Электронная почта',
      'en': '',
    },
    'wfxtgn5v': {
      'ru': 'Мобильный телефон',
      'en': '',
    },
    'b5o2soiy': {
      'ru': 'Цвет',
      'en': '',
    },
    '4ancyzv9': {
      'ru': 'Права в Приложении',
      'en': '',
    },
    'cpsp7muc': {
      'ru': 'Активен',
      'en': '',
    },
    'n5dkqpe8': {
      'ru': 'Загрузка\\Выгрузка',
      'en': '',
    },
    'j6i07i1t': {
      'ru': 'Назначение заявок',
      'en': '',
    },
    'a6cl2k8h': {
      'ru': 'Выполнение заявок',
      'en': '',
    },
    'e89sbmgg': {
      'ru': 'Аудит выполнения',
      'en': '',
    },
    'zei4f0j1': {
      'ru': 'Администрирование',
      'en': '',
    },
  },
  // ReportPageCopy
  {
    'pm7z9l9h': {
      'ru': 'Заявки',
      'en': '',
    },
    '0tp4cfev': {
      'ru': 'Сотрудники',
      'en': '',
    },
    '5w8igeb6': {
      'ru': 'Загрузка',
      'en': '',
    },
    'ijmzo2dy': {
      'ru': 'Отчеты',
      'en': '',
    },
    'hd2hpaho': {
      'ru': 'Выполнено',
      'en': '',
    },
    '6hycovfi': {
      'ru': 'Отчет по работе',
      'en': '',
    },
    'vgiwmx5s': {
      'ru': 'Home',
      'en': '',
    },
  },
  // ReportsPage
  {
    'rh3miqt1': {
      'ru': '1 день',
      'en': '',
    },
    'hnxte6pf': {
      'ru': 'Неделя',
      'en': '',
    },
    'tqvrbkkp': {
      'ru': '2 недели',
      'en': '',
    },
    'ewf463q9': {
      'ru': '№',
      'en': '',
    },
    'nd8aqp71': {
      'ru': 'Дата',
      'en': '',
    },
    '5nqe6a82': {
      'ru': 'Название ТП',
      'en': '',
    },
    'o10ssvxg': {
      'ru': 'Вид работ',
      'en': '',
    },
    '6n3v0ojg': {
      'ru': 'Адрес',
      'en': '',
    },
    'il2nmxzp': {
      'ru': 'Исполнитель',
      'en': '',
    },
    'h7mqfqg4': {
      'ru': 'Комментарий',
      'en': '',
    },
    'bvudjzb3': {
      'ru': 'Выполнено',
      'en': '',
    },
    'xwnip2pw': {
      'ru': 'Не выполнено',
      'en': '',
    },
    'x5g2r2hx': {
      'ru': 'Система управления заявками',
      'en': '',
    },
    '59w7vseq': {
      'ru': 'Home',
      'en': '',
    },
  },
  // ImportPage
  {
    'z3l3bnin': {
      'ru': 'Прочитать',
      'en': '',
    },
    'dr8zgc38': {
      'ru': 'Категория',
      'en': 'Address',
    },
    'gj489ogj': {
      'ru': 'Строка',
      'en': '',
    },
    'en6se2qo': {
      'ru': 'Наименование',
      'en': '',
    },
    'gohvchs6': {
      'ru': 'Адрес',
      'en': 'Task Category',
    },
    'b2u1160v': {
      'ru': 'ID Терминала',
      'en': 'Terminal ID',
    },
    'ufnx8u1o': {
      'ru': 'Описание',
      'en': 'Doer',
    },
    'cj684s3t': {
      'ru': 'Заявки и исполнители',
      'en': 'Tasks and Doers',
    },
    's90h3w7h': {
      'ru': 'Главня',
      'en': 'Home',
    },
  },
  // TestPage
  {
    '7zilf0xp': {
      'ru': 'Прочитать',
      'en': '',
    },
    '59uvht8f': {
      'ru': 'GetId',
      'en': '',
    },
    'l89g6cko': {
      'ru': 'MAX',
      'en': '',
    },
    'hm9zg3xt': {
      'ru': 'ToBase',
      'en': '',
    },
    'e08y0486': {
      'ru': 'ToExcel',
      'en': '',
    },
    '3jasl2up': {
      'ru': 'Select',
      'en': '',
    },
    '3bexmzq7': {
      'ru': 'New import',
      'en': '',
    },
    'a1dre6nj': {
      'ru': 'to CRM',
      'en': '',
    },
    'mf0tsemm': {
      'ru': 'Категория',
      'en': 'Address',
    },
    'kz9cevb2': {
      'ru': 'Строка',
      'en': '',
    },
    'i66hwxqh': {
      'ru': 'Наименование',
      'en': '',
    },
    'yhq9u33k': {
      'ru': 'Адрес',
      'en': 'Task Category',
    },
    'q3ny1m0h': {
      'ru': 'ID Терминала',
      'en': 'Terminal ID',
    },
    'nvfv0rsa': {
      'ru': 'Описание',
      'en': 'Doer',
    },
    'mt9h00tc': {
      'ru': 'ТЕСТИРОВАНИЕ',
      'en': 'Tasks and Doers',
    },
    'h6cg30x8': {
      'ru': 'Главня',
      'en': 'Home',
    },
  },
  // UserTaskEditPage
  {
    '8596afql': {
      'ru': 'Информация о ТСП',
      'en': '',
    },
    'lttea7yv': {
      'ru': 'Название ТСП',
      'en': '',
    },
    '5iavadtc': {
      'ru': 'Адрес ТСП',
      'en': '',
    },
    'wko6co5x': {
      'ru': 'Телефон',
      'en': '',
    },
    'o6pympai': {
      'ru': 'Договор эквайринга',
      'en': '',
    },
    '6qgs0csn': {
      'ru': 'Информация об оборудовании',
      'en': '',
    },
    'mlu906bg': {
      'ru': 'Номер РР',
      'en': '',
    },
    'e420s824': {
      'ru': 'Модель',
      'en': '',
    },
    'zhz925jw': {
      'ru': 'Номер #2',
      'en': '',
    },
    '1n776z7b': {
      'ru': 'Тип связи',
      'en': '',
    },
    'rt35ln2v': {
      'ru': 'Причина неисправности',
      'en': '',
    },
    'wtpqbyut': {
      'ru': 'Выполнение',
      'en': '',
    },
    'uopszla7': {
      'ru': 'Вид работ',
      'en': '',
    },
    'l2vhk9k4': {
      'ru': 'CRM ID',
      'en': '',
    },
    '0bpuqtla': {
      'ru': 'Статус',
      'en': '',
    },
    'dgts325d': {
      'ru': 'Признак переноса',
      'en': '',
    },
    '4c7yivag': {
      'ru': 'Завершить',
      'en': '',
    },
    'wnwvrfui': {
      'ru': 'Перенести',
      'en': '',
    },
    '4k53x1l2': {
      'ru': 'Время завершения',
      'en': '',
    },
    '1ykgmx60': {
      'ru': 'Время, кода статус поменялся на ЗАВЕРШЕНО',
      'en': '',
    },
    'fv9a4ux2': {
      'ru': 'Возобновить',
      'en': '',
    },
    'y0fopdx4': {
      'ru': 'Исполнитель',
      'en': '',
    },
    'xcnu8wf1': {
      'ru': 'Число обучаемых',
      'en': '',
    },
    'f6qrdrxx': {
      'ru': 'Комментарий исполнителя',
      'en': '',
    },
    'etddsg8u': {
      'ru': 'Внутренний комментарий',
      'en': '',
    },
    'vj7037r5': {
      'ru': 'Комментарий к выезду',
      'en': '',
    },
    'ba0rsb7q': {
      'ru': 'Комментарий к парковке',
      'en': '',
    },
    'nfl9fjm0': {
      'ru': 'Перенос',
      'en': '',
    },
    'iptemwzi': {
      'ru': 'Типовая причина переноса',
      'en': '',
    },
    '88d7ye8a': {
      'ru': 'Комментарий к причине переноса',
      'en': '',
    },
    '0bk8ne22': {
      'ru': 'Дата переноса',
      'en': '',
    },
    'o96lfj4q': {
      'ru': 'Контакт на месте',
      'en': '',
    },
    'nq2subo4': {
      'ru': 'Телефон',
      'en': '',
    },
    'okpy7njz': {
      'ru': '',
      'en': '',
    },
    'bejh558x': {
      'ru': '',
      'en': '',
    },
  },
  // UserTaskEditTabs
  {
    'hsv40bmt': {
      'ru': 'АТМ',
      'en': '',
    },
    'dz71yekk': {
      'ru': 'ТСП',
      'en': '',
    },
    'frwlh0hi': {
      'ru': 'Исп',
      'en': '',
    },
    '30x2yxf4': {
      'ru': 'Page Title',
      'en': '',
    },
    '1apz3faj': {
      'ru': 'Home',
      'en': '',
    },
  },
  // UserTaskList
  {
    '5bxdkjbj': {
      'ru': 'CRM',
      'en': '',
    },
    'a6uk0n0k': {
      'ru': 'Контакт',
      'en': '',
    },
    'gxmdahqz': {
      'ru': 'Оборудование',
      'en': '',
    },
    'v460jgpm': {
      'ru': 'Статус',
      'en': '',
    },
    'im28okvn': {
      'ru': 'Адрес',
      'en': '',
    },
    'r0wodekz': {
      'ru': '',
      'en': '',
    },
    'n7a5c0d1': {
      'ru': 'Home',
      'en': '',
    },
  },
  // UserTaskScroll
  {
    'dvysuh50': {
      'ru': 'CRM',
      'en': '',
    },
    'i89uop2v': {
      'ru': 'Контакт',
      'en': '',
    },
    'keyaih9o': {
      'ru': 'Оборудование',
      'en': '',
    },
    '3vz9zx3d': {
      'ru': 'Статус',
      'en': '',
    },
    '1rhvnlea': {
      'ru': 'Адрес',
      'en': '',
    },
    'kjoxw5uw': {
      'ru': '',
      'en': '',
    },
    'ie7a98vh': {
      'ru': 'Home',
      'en': '',
    },
  },
  // TeamPage
  {
    'rku2faxf': {
      'ru': 'Search',
      'en': '',
    },
    'jr3q3fju': {
      'ru': 'Dashboard',
      'en': '',
    },
    'khky5rby': {
      'ru': 'Customers',
      'en': '',
    },
    'oqx6nmgm': {
      'ru': 'Contracts',
      'en': '',
    },
    'm2rdjldv': {
      'ru': 'My Team',
      'en': '',
    },
    'yi84e355': {
      'ru': 'Profile',
      'en': '',
    },
    'n35s23gb': {
      'ru': 'Andrew D.',
      'en': '',
    },
    'ha19vvy1': {
      'ru': 'admin@gmail.com',
      'en': '',
    },
    'crtjaigy': {
      'ru': 'View Profile',
      'en': '',
    },
    'xqr8r92b': {
      'ru': 'My Team',
      'en': '',
    },
    'xt4xvhyz': {
      'ru': 'Member Name',
      'en': '',
    },
    'iinjtbh1': {
      'ru': 'Email',
      'en': '',
    },
    'qboswy40': {
      'ru': 'Last Active',
      'en': '',
    },
    'kylbvq0a': {
      'ru': 'Date Created',
      'en': '',
    },
    'hji0vdrc': {
      'ru': 'Status',
      'en': '',
    },
    'nir29p5d': {
      'ru': 'Alex Smith',
      'en': '',
    },
    '21wt16x4': {
      'ru': 'user@domainname.com',
      'en': '',
    },
    'te015n56': {
      'ru': 'user@domain.com',
      'en': '',
    },
    'cri8wzo4': {
      'ru': 'Contacted',
      'en': '',
    },
    'gixe4c8q': {
      'ru': 'Andrea Rudolph',
      'en': '',
    },
    '4c8xiepn': {
      'ru': 'user@domainname.com',
      'en': '',
    },
    '6t8x5mbg': {
      'ru': 'user@domain.com',
      'en': '',
    },
    'qd51611n': {
      'ru': 'Contacted',
      'en': '',
    },
    'g0drg26s': {
      'ru': 'Andrea Rudolph',
      'en': '',
    },
    '3csxyp8l': {
      'ru': 'user@domainname.com',
      'en': '',
    },
    'l18tq0kj': {
      'ru': 'user@domain.com',
      'en': '',
    },
    'hymfat92': {
      'ru': 'New',
      'en': '',
    },
    'nxulz1g6': {
      'ru': 'Andrea Rudolph',
      'en': '',
    },
    'jqao10vs': {
      'ru': 'user@domainname.com',
      'en': '',
    },
    'e1bga18b': {
      'ru': 'user@domain.com',
      'en': '',
    },
    'dcwr009w': {
      'ru': 'New',
      'en': '',
    },
    '4txkayiq': {
      'ru': 'Andrea Rudolph',
      'en': '',
    },
    '28rpe2e9': {
      'ru': 'user@domainname.com',
      'en': '',
    },
    'n385c0s1': {
      'ru': 'user@domain.com',
      'en': '',
    },
    'ympa7aq1': {
      'ru': 'New',
      'en': '',
    },
    '2gein1nk': {
      'ru': 'Andrea Rudolph',
      'en': '',
    },
    'smhkas1q': {
      'ru': 'user@domainname.com',
      'en': '',
    },
    '8jjs1zsc': {
      'ru': 'user@domain.com',
      'en': '',
    },
    'yjf6ejex': {
      'ru': 'Contacted',
      'en': '',
    },
    '2815dj8a': {
      'ru': 'Dashboard',
      'en': '',
    },
    's5rzp5s8': {
      'ru': '__',
      'en': '',
    },
  },
  // UserTaskListCopy3
  {
    'r6aakq5u': {
      'ru': 'CRM',
      'en': '',
    },
    'xovqonch': {
      'ru': 'Контакт',
      'en': '',
    },
    'mwk2n0w8': {
      'ru': 'Оборудование',
      'en': '',
    },
    '9cm1k02b': {
      'ru': 'Статус',
      'en': '',
    },
    'y9fggvau': {
      'ru': 'Адрес',
      'en': '',
    },
    'vckii02w': {
      'ru': '',
      'en': '',
    },
    'wz76kt5b': {
      'ru': 'Home',
      'en': '',
    },
  },
  // TaskListPageCopy
  {
    'souc12xt': {
      'ru': 'Загрузить',
      'en': '',
    },
    'l8nj4x46': {
      'ru': 'Отчёт',
      'en': '',
    },
    'cmvc1oq0': {
      'ru': 'Выгрузить',
      'en': '',
    },
    'k9erdsgz': {
      'ru': '№',
      'en': '#',
    },
    'y79aq7em': {
      'ru': 'Название ТП',
      'en': 'TP Name',
    },
    'x4yi5tgh': {
      'ru': 'Описание',
      'en': 'Mobile',
    },
    '5nnzs0go': {
      'ru': 'Вид работ',
      'en': 'Task Category',
    },
    'tp63tr7k': {
      'ru': 'ID Терминала',
      'en': 'Terminal ID',
    },
    '5xa9x768': {
      'ru': 'Адрес',
      'en': 'Address',
    },
    'agxcfq89': {
      'ru': 'Исполнитель',
      'en': 'Doer',
    },
    '3pvq14t6': {
      'ru': 'Статус',
      'en': 'Status',
    },
    'r7i0gmbz': {
      'ru': 'Система управления заявками',
      'en': 'Tasks and Doers',
    },
    'mj3jfw1a': {
      'ru': 'Главня',
      'en': 'Home',
    },
  },
  // UserTaskListCopy4
  {
    '48bgqjbg': {
      'ru': 'CRM',
      'en': '',
    },
    '85si6hdy': {
      'ru': 'Контакт',
      'en': '',
    },
    'omosxxsc': {
      'ru': 'Оборудование',
      'en': '',
    },
    'j67hbdjb': {
      'ru': 'Статус',
      'en': '',
    },
    'hq7q6gfr': {
      'ru': 'Адрес',
      'en': '',
    },
    'dtysbgiw': {
      'ru': '',
      'en': '',
    },
    'mhmez0tw': {
      'ru': 'Home',
      'en': '',
    },
  },
  // UserTaskEditPageCopy
  {
    'zla0fk9x': {
      'ru': 'Информация о ТСП',
      'en': '',
    },
    'ppyuf68m': {
      'ru': 'Название ТСП',
      'en': '',
    },
    '1i7cujgt': {
      'ru': 'Адрес ТСП',
      'en': '',
    },
    'iklwmdyb': {
      'ru': 'Телефон',
      'en': '',
    },
    'nc0kfi65': {
      'ru': 'Договор эквайринга',
      'en': '',
    },
    'tqkxfhyg': {
      'ru': 'Информация об оборудовании',
      'en': '',
    },
    '1v55j6vy': {
      'ru': 'Номер РР',
      'en': '',
    },
    '2ltx04sd': {
      'ru': 'Модель',
      'en': '',
    },
    'ayw7mbj9': {
      'ru': 'Номер #2',
      'en': '',
    },
    'lia6xige': {
      'ru': 'Тип связи',
      'en': '',
    },
    '0c6bonnc': {
      'ru': 'Причина неисправности',
      'en': '',
    },
    'kclijzw8': {
      'ru': 'Выполнение',
      'en': '',
    },
    'lur9wh42': {
      'ru': 'Вид работ',
      'en': '',
    },
    'dkh6m7ap': {
      'ru': 'CRM ID',
      'en': '',
    },
    'i7iplyay': {
      'ru': 'Статус',
      'en': '',
    },
    'cnv3ww82': {
      'ru': 'Признак переноса',
      'en': '',
    },
    '60f3vvzk': {
      'ru': 'Завершить',
      'en': '',
    },
    'on2rw5of': {
      'ru': 'Перенести',
      'en': '',
    },
    'bty2vuz3': {
      'ru': 'Время завершения',
      'en': '',
    },
    'zrltfmvi': {
      'ru': 'Время, кода статус поменялся на ЗАВЕРШЕНО',
      'en': '',
    },
    'iw4ttuha': {
      'ru': 'Возобновить',
      'en': '',
    },
    'puvzlknx': {
      'ru': 'Исполнитель',
      'en': '',
    },
    '9bedrpro': {
      'ru': 'Число обучаемых',
      'en': '',
    },
    'jlvm3zgn': {
      'ru': 'Комментарий исполнителя',
      'en': '',
    },
    '84zxjdl4': {
      'ru': 'Внутренний комментарий',
      'en': '',
    },
    'tqjyxxkl': {
      'ru': 'Комментарий к выезду',
      'en': '',
    },
    '6l2pga84': {
      'ru': 'Комментарий к парковке',
      'en': '',
    },
    'yq0b5kjh': {
      'ru': 'Перенос',
      'en': '',
    },
    'zoowvc45': {
      'ru': 'Причина переноса',
      'en': '',
    },
    'cx1mbb0e': {
      'ru': 'Дата переноса',
      'en': '',
    },
    'su7s3xhz': {
      'ru': 'Дата переноса',
      'en': '',
    },
    'kwom8zj7': {
      'ru': 'Контакт на месте',
      'en': '',
    },
    'nb9t7549': {
      'ru': 'Телефон',
      'en': '',
    },
    'pekce1g2': {
      'ru': '',
      'en': '',
    },
    '63rq0qos': {
      'ru': '',
      'en': '',
    },
  },
  // UserTaskEditPageCopy2
  {
    'ppt6h74o': {
      'ru': 'Информация о ТСП',
      'en': '',
    },
    'kejjpd92': {
      'ru': 'Название ТСП',
      'en': '',
    },
    'xhewfv00': {
      'ru': 'Адрес ТСП',
      'en': '',
    },
    'u5rk0njv': {
      'ru': 'Телефон',
      'en': '',
    },
    'nne0etce': {
      'ru': 'Договор эквайринга',
      'en': '',
    },
    '8anxdv9u': {
      'ru': 'Информация об оборудовании',
      'en': '',
    },
    '2xntzkez': {
      'ru': 'Номер РР',
      'en': '',
    },
    '0i5qi3u7': {
      'ru': 'Модель',
      'en': '',
    },
    'edu5paa1': {
      'ru': 'Номер #2',
      'en': '',
    },
    'kegb8mrg': {
      'ru': 'Тип связи',
      'en': '',
    },
    'dmmteww3': {
      'ru': 'Причина неисправности',
      'en': '',
    },
    'bc9ymtx5': {
      'ru': 'Выполнение',
      'en': '',
    },
    '469mrd08': {
      'ru': 'Вид работ',
      'en': '',
    },
    'yzyjzagj': {
      'ru': 'CRM ID',
      'en': '',
    },
    'vgq6yn25': {
      'ru': 'Статус',
      'en': '',
    },
    'zbea844x': {
      'ru': 'Признак переноса',
      'en': '',
    },
    'kmsyejkc': {
      'ru': 'Завершить',
      'en': '',
    },
    'helv91ji': {
      'ru': 'Перенести',
      'en': '',
    },
    'ama39j5c': {
      'ru': 'Время завершения',
      'en': '',
    },
    'zof0542k': {
      'ru': 'Время, кода статус поменялся на ЗАВЕРШЕНО',
      'en': '',
    },
    'znjr2sl6': {
      'ru': 'Возобновить',
      'en': '',
    },
    'smjmxm1o': {
      'ru': 'Исполнитель',
      'en': '',
    },
    'zxam9u4q': {
      'ru': 'Число обучаемых',
      'en': '',
    },
    'o7fh1m0k': {
      'ru': 'Комментарий исполнителя',
      'en': '',
    },
    'c7xpjyur': {
      'ru': 'Внутренний комментарий',
      'en': '',
    },
    'nwcuf1i3': {
      'ru': 'Комментарий к выезду',
      'en': '',
    },
    'ava8agxk': {
      'ru': 'Комментарий к парковке',
      'en': '',
    },
    'baepiuy5': {
      'ru': 'Перенос',
      'en': '',
    },
    'a02ccnlr': {
      'ru': 'Причина переноса',
      'en': '',
    },
    'y5xcjfnx': {
      'ru': 'Причина переноса',
      'en': '',
    },
    '2yqe8c94': {
      'ru': 'Дата переноса',
      'en': '',
    },
    'cl4brznh': {
      'ru': 'Контакт на месте',
      'en': '',
    },
    'iheh3umi': {
      'ru': 'Телефон',
      'en': '',
    },
    'u08wjh7v': {
      'ru': '',
      'en': '',
    },
    '9mvz0zc4': {
      'ru': '',
      'en': '',
    },
  },
  // dropdown_users
  {
    'u4bnu9xu': {
      'ru': 'Исполнитель',
      'en': '',
    },
    '0d23n1sh': {
      'ru': 'Search...',
      'en': '',
    },
    '9qv7qfaf': {
      'ru': 'Option 1',
      'en': '',
    },
    'yeq11uda': {
      'ru': 'Option 2',
      'en': '',
    },
    'uwaym7s6': {
      'ru': 'Option 3',
      'en': '',
    },
  },
  // UserSelectComponent
  {
    'wxnf25kf': {
      'ru': 'Выберите исполнителя',
      'en': '',
    },
    'o5sagby2': {
      'ru': 'Закрыть',
      'en': '',
    },
  },
  // StatusSelectComponent
  {
    'rhanbnju': {
      'ru': 'Выберите статус',
      'en': '',
    },
    'n33tiluc': {
      'ru': 'Требует назначения',
      'en': '',
    },
    'ha7rjf5u': {
      'ru': 'В работе',
      'en': '',
    },
    'poz7q9m0': {
      'ru': 'Выполнено',
      'en': '',
    },
    'dxh3158z': {
      'ru': 'Не выполнено',
      'en': '',
    },
    'n7xwew2w': {
      'ru': 'Не выполнено (перенос)',
      'en': '',
    },
    'faa2yw50': {
      'ru': 'Закрыть',
      'en': '',
    },
  },
  // SideNavigationComponent
  {
    '03dtywdk': {
      'ru': 'Заявки',
      'en': '',
    },
    'gzdpume1': {
      'ru': 'Сотрудники',
      'en': '',
    },
    'n4bkjr93': {
      'ru': 'Отчеты',
      'en': '',
    },
  },
  // ReasonSelectComponent
  {
    'jyxcass3': {
      'ru': 'Выберите причину',
      'en': '',
    },
    'eq24cu7s': {
      'ru': 'По согласованиюс с ТСП',
      'en': '',
    },
    '4k1pk620': {
      'ru': 'Контакт не отвечает',
      'en': '',
    },
    '1qtnf757': {
      'ru': 'Проблема со связью',
      'en': '',
    },
    'ptfbdthf': {
      'ru': 'Отмена по инициативе ТСП',
      'en': '',
    },
    '6zserqz5': {
      'ru': 'Проверка силами ТСП',
      'en': '',
    },
    '7o1hew3v': {
      'ru': 'Не предоставлен доступ',
      'en': '',
    },
    '5echnr8h': {
      'ru': 'По согласованию с Банком',
      'en': '',
    },
    'f6f7uj5p': {
      'ru': 'Закрыть',
      'en': '',
    },
  },
  // DocsInTSPComponent
  {
    'qq2b8f0j': {
      'ru': 'Документы в ТСП',
      'en': '',
    },
    '9g3gw4r8': {
      'ru': 'Да',
      'en': '',
    },
    'rwqer1jf': {
      'ru': 'Нет',
      'en': '',
    },
  },
  // InternaCommentSelectComponent
  {
    '4sof27r3': {
      'ru': 'Выберите комментарий',
      'en': '',
    },
    'ybi5eml3': {
      'ru': 'Выезд',
      'en': '',
    },
    'yzq8l7xi': {
      'ru': 'Замена работающего',
      'en': '',
    },
    'pg63irts': {
      'ru': 'Демонтаж',
      'en': '',
    },
    '84xc6dbs': {
      'ru': 'Закрыть',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'n850na05': {
      'ru': 'Ошибка  авторизации [error]',
      'en': 'Auth error [error]',
    },
    '1yi8uxt1': {
      'ru': '',
      'en': '',
    },
    '8nxhw7dg': {
      'ru': '',
      'en': '',
    },
    '23dqhtdj': {
      'ru': '',
      'en': '',
    },
    '1d3ia14i': {
      'ru': '',
      'en': '',
    },
    '403kfx5c': {
      'ru': '',
      'en': '',
    },
    '1466ilzu': {
      'ru': '',
      'en': '',
    },
    '7wagmpvx': {
      'ru': '',
      'en': '',
    },
    'z82cxvuf': {
      'ru': '',
      'en': '',
    },
    '9u8ag0c9': {
      'ru': '',
      'en': '',
    },
    's2i2sint': {
      'ru': 'Неправильный логин или пароль',
      'en': 'Wrong login name  or password  ',
    },
    'r704s39k': {
      'ru': '',
      'en': '',
    },
    '1ngxqpbm': {
      'ru': '',
      'en': '',
    },
    'z6ni5nzn': {
      'ru': '',
      'en': '',
    },
    'un17aycz': {
      'ru': '',
      'en': '',
    },
    'yuhuby8d': {
      'ru': '',
      'en': '',
    },
    'ytx8fgzk': {
      'ru': '',
      'en': '',
    },
    'ccv5w51n': {
      'ru': '',
      'en': '',
    },
    '260x6py6': {
      'ru': '',
      'en': '',
    },
    'a48jp1zc': {
      'ru': '',
      'en': '',
    },
    '0old6uxj': {
      'ru': '',
      'en': '',
    },
    'yy79euvs': {
      'ru': '',
      'en': '',
    },
    'nn1i7c2t': {
      'ru': '',
      'en': '',
    },
    'gzszoa42': {
      'ru': '',
      'en': '',
    },
    '9y0mim0v': {
      'ru': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
