// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardController on CardControllerBase, Store {
  late final _$cardListAtom =
      Atom(name: 'CardControllerBase.cardList', context: context);

  @override
  ObservableList<CardInfo> get cardList {
    _$cardListAtom.reportRead();
    return super.cardList;
  }

  @override
  set cardList(ObservableList<CardInfo> value) {
    _$cardListAtom.reportWrite(value, super.cardList, () {
      super.cardList = value;
    });
  }

  late final _$addCardAsyncAction =
      AsyncAction('CardControllerBase.addCard', context: context);

  @override
  Future<void> addCard(String text) {
    return _$addCardAsyncAction.run(() => super.addCard(text));
  }

  late final _$editCardAsyncAction =
      AsyncAction('CardControllerBase.editCard', context: context);

  @override
  Future<void> editCard(int id, String text) {
    return _$editCardAsyncAction.run(() => super.editCard(id, text));
  }

  late final _$deleteCardAsyncAction =
      AsyncAction('CardControllerBase.deleteCard', context: context);

  @override
  Future<void> deleteCard(int id) {
    return _$deleteCardAsyncAction.run(() => super.deleteCard(id));
  }

  late final _$loadCardsAsyncAction =
      AsyncAction('CardControllerBase.loadCards', context: context);

  @override
  Future<void> loadCards() {
    return _$loadCardsAsyncAction.run(() => super.loadCards());
  }

  @override
  String toString() {
    return '''
cardList: ${cardList}
    ''';
  }
}
