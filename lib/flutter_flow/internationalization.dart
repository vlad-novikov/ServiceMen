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
    'cnza6boz': {
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
    'if9u43hz': {
      'ru': 'Заявка',
      'en': '',
    },
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
    'yowhb1nw': {
      'ru': 'Информация об оборудовании',
      'en': '',
    },
    'i9gverpq': {
      'ru': 'Номер РР',
      'en': '',
    },
    'gne4taaz': {
      'ru': 'Договор эквайринга',
      'en': '',
    },
    'putk2tvr': {
      'ru': 'Тип связи',
      'en': '',
    },
    '0dli5mna': {
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
    'okpa75kk': {
      'ru': 'Исполнитель',
      'en': '',
    },
    '6l92lupm': {
      'ru': 'Комментарий исполнителя',
      'en': '',
    },
    'ydno50kj': {
      'ru': 'Статус',
      'en': '',
    },
    'ukz984qh': {
      'ru': 'Документы в ТСП',
      'en': '',
    },
    '7sn3rmqc': {
      'ru': 'Число обучаемых',
      'en': '',
    },
    'tbucemny': {
      'ru': 'Перенос',
      'en': '',
    },
    'w3xkl8bo': {
      'ru': 'Причина переноса',
      'en': '',
    },
    '35zykl8t': {
      'ru': 'Контакт по переносу',
      'en': '',
    },
    '913idvl5': {
      'ru': 'Дата переноса',
      'en': '',
    },
    '8cvq83ql': {
      'ru': 'Выйти',
      'en': '',
    },
    '1wp44xee': {
      'ru': 'Сохранить и выйти',
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
    'izfirosd': {
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
  // UserTaskListPage
  {
    '49kntp36': {
      'ru': 'Заявки',
      'en': '',
    },
    'eu449v1j': {
      'ru': 'Сотрудники',
      'en': '',
    },
    'w42olvt8': {
      'ru': 'Загрузка',
      'en': '',
    },
    '5wvoafto': {
      'ru': 'Отчеты',
      'en': '',
    },
    '8trc8c7s': {
      'ru': '№',
      'en': '',
    },
    'uc9e8l0p': {
      'ru': 'Дата',
      'en': '',
    },
    'wtvifokn': {
      'ru': 'Название ТП',
      'en': '',
    },
    'xd4rec8r': {
      'ru': 'Телефон',
      'en': '',
    },
    'q610qwth': {
      'ru': 'Вид работ',
      'en': '',
    },
    'tm6j846z': {
      'ru': 'ID Терминала',
      'en': '',
    },
    'x7q2tda4': {
      'ru': 'Адрес',
      'en': '',
    },
    'gas429yt': {
      'ru': 'Статус',
      'en': '',
    },
    'q19xp77y': {
      'ru': 'Мои заявки',
      'en': '',
    },
    '7chmj9xz': {
      'ru': 'Home',
      'en': '',
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
    '181nonad': {
      'ru': 'Выйти',
      'en': '',
    },
    'ioyc0ohw': {
      'ru': 'Сохранить и выйти',
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
  // DateFilterComponent
  {
    'gvzroegk': {
      'ru': 'На дату: ',
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
    'l89k8tok': {
      'ru': 'Загрузка',
      'en': '',
    },
    'n4bkjr93': {
      'ru': 'Отчеты',
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
