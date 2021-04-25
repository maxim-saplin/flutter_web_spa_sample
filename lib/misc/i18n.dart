import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations.byLocale('en') +
      {
        'ru': {
// Master Page
          'Logout': 'Выход',
          'CV Search': 'Поиск',
          'CVs': 'Резюме',
          'Snapshots': 'Снепшоты',
          'Glossary': 'Глоссарий',
          'Analytics': 'Аналитика',
//CV List
          'Create CV': 'Создать резюме',
          'Create CV for candidate': 'Резюме для кандидата',
          'Upload CV': 'Загрузить резюме',
          'Loading\n': 'Загрузка\n',
//Pagination
          'Page size: ': 'Размер страницы: ',
          'Total: %s': 'Всего: %s',
//Column titles
          'Person': 'Имя',
          'Position': 'Позиция',
          'AD User': 'Пользователь AD',
          'Department': 'Департамент',
          'Division': 'Попдразделение',
          'Master CV': 'Основное',
          'Check': 'Проверка',
          'Created': 'Cоздано',
          'Last Modification': 'Изменено',
          'Travel': 'Поездки',
          'Shared': 'Доступ',
// Column settings
          'Choose visible columns (': 'Видимые колонки (',
// other
          '(Select all)': '(Выбрать всё)',
          '(Deselect all)': '(Снять выделение)'
        }
      };

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);
}
