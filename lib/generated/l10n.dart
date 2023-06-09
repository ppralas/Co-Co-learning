// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Pozdrav brate`
  String get hello {
    return Intl.message(
      'Pozdrav brate',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Odabir razreda`
  String get subject_select {
    return Intl.message(
      'Odabir razreda',
      name: 'subject_select',
      desc: '',
      args: [],
    );
  }

  /// `Lekcija`
  String get lesson {
    return Intl.message(
      'Lekcija',
      name: 'lesson',
      desc: '',
      args: [],
    );
  }

  /// `Dodaj lekciju`
  String get lesson_add {
    return Intl.message(
      'Dodaj lekciju',
      name: 'lesson_add',
      desc: '',
      args: [],
    );
  }

  /// `Unesite ime lekcije`
  String get lesson_name {
    return Intl.message(
      'Unesite ime lekcije',
      name: 'lesson_name',
      desc: '',
      args: [],
    );
  }

  /// `Dizajner lekcija`
  String get lesson_designer {
    return Intl.message(
      'Dizajner lekcija',
      name: 'lesson_designer',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Podlekcija`
  String get sublesson {
    return Intl.message(
      'Podlekcija',
      name: 'sublesson',
      desc: '',
      args: [],
    );
  }

  /// `Ime podlekcije`
  String get sublesson_name {
    return Intl.message(
      'Ime podlekcije',
      name: 'sublesson_name',
      desc: '',
      args: [],
    );
  }

  /// `Dodaj podlekciju`
  String get add_sublesson {
    return Intl.message(
      'Dodaj podlekciju',
      name: 'add_sublesson',
      desc: '',
      args: [],
    );
  }

  /// `Odabir razreda`
  String get grade {
    return Intl.message(
      'Odabir razreda',
      name: 'grade',
      desc: '',
      args: [],
    );
  }

  /// `Predmet`
  String get subject {
    return Intl.message(
      'Predmet',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Oh, ne!`
  String get oh_no {
    return Intl.message(
      'Oh, ne!',
      name: 'oh_no',
      desc: '',
      args: [],
    );
  }

  /// `POKRENI`
  String get start_app {
    return Intl.message(
      'POKRENI',
      name: 'start_app',
      desc: '',
      args: [],
    );
  }

  /// `Unesite prvo ime`
  String get first_student_name {
    return Intl.message(
      'Unesite prvo ime',
      name: 'first_student_name',
      desc: '',
      args: [],
    );
  }

  /// `Unesite drugo ime`
  String get second_studnet_name {
    return Intl.message(
      'Unesite drugo ime',
      name: 'second_studnet_name',
      desc: '',
      args: [],
    );
  }

  /// `Unesite trece ime`
  String get third_studnet_name {
    return Intl.message(
      'Unesite trece ime',
      name: 'third_studnet_name',
      desc: '',
      args: [],
    );
  }

  /// `Unesite cetvrto ime`
  String get forth_student_name {
    return Intl.message(
      'Unesite cetvrto ime',
      name: 'forth_student_name',
      desc: '',
      args: [],
    );
  }

  /// `Dobrodošli u CoCo aplikaciju`
  String get welcome_title {
    return Intl.message(
      'Dobrodošli u CoCo aplikaciju',
      name: 'welcome_title',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error occurred`
  String get unkown_error {
    return Intl.message(
      'Unknown error occurred',
      name: 'unkown_error',
      desc: '',
      args: [],
    );
  }

  /// `BOK!`
  String get hi_message {
    return Intl.message(
      'BOK!',
      name: 'hi_message',
      desc: '',
      args: [],
    );
  }

  /// `Bok,`
  String get hi {
    return Intl.message(
      'Bok,',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `Nešto je pošlo po krivu,\npostavke nisu dohvaćene!`
  String get error_screen_message {
    return Intl.message(
      'Nešto je pošlo po krivu,\npostavke nisu dohvaćene!',
      name: 'error_screen_message',
      desc: '',
      args: [],
    );
  }

  /// `Ponovo dohvati`
  String get get_again {
    return Intl.message(
      'Ponovo dohvati',
      name: 'get_again',
      desc: '',
      args: [],
    );
  }

  /// `Rotiraj ekran ako ti ne odgovara, te potvrdi klikom na kvačicu!`
  String get rotate_screen {
    return Intl.message(
      'Rotiraj ekran ako ti ne odgovara, te potvrdi klikom na kvačicu!',
      name: 'rotate_screen',
      desc: '',
      args: [],
    );
  }

  /// `Unutar sljedećih 10 minuta: Odaberi riječi u koje možeš ubaciti slovo č.`
  String get task_description {
    return Intl.message(
      'Unutar sljedećih 10 minuta: Odaberi riječi u koje možeš ubaciti slovo č.',
      name: 'task_description',
      desc: '',
      args: [],
    );
  }

  /// `Greska`
  String get something_wrong {
    return Intl.message(
      'Greska',
      name: 'something_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Dobrodošli`
  String get welcome {
    return Intl.message(
      'Dobrodošli',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Prvo ime`
  String get first_name {
    return Intl.message(
      'Prvo ime',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Drugo ime`
  String get second_name {
    return Intl.message(
      'Drugo ime',
      name: 'second_name',
      desc: '',
      args: [],
    );
  }

  /// `Treće ime`
  String get third_name {
    return Intl.message(
      'Treće ime',
      name: 'third_name',
      desc: '',
      args: [],
    );
  }

  /// `Četvrto ime`
  String get forth_name {
    return Intl.message(
      'Četvrto ime',
      name: 'forth_name',
      desc: '',
      args: [],
    );
  }

  /// `Potvrdi`
  String get confirm {
    return Intl.message(
      'Potvrdi',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'hr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
