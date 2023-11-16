import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/card_info.dart';
part 'card_controller.g.dart';

class CardController = CardControllerBase with _$CardController;

abstract class CardControllerBase with Store {

  // Lista de cards
  @observable
  ObservableList<CardInfo> cardList = <CardInfo>[].asObservable();

  // Lógica para adicionar um card
  @action
  Future<void> addCard(String text) async {
    final prefs = await SharedPreferences.getInstance();
    final cardId = prefs.getInt('cardId') ?? 0;
    final newCard = CardInfo(id: cardId, text: text,);
    cardList.add(newCard);
    await prefs.setInt('cardId', cardId + 1);
    await prefs.setStringList(
        'cardList', cardList.map((e) => e.toJson()).toList());
  }

  // Lógica para editar um card
  @action
  Future<void> editCard(int id, String text) async {
    final prefs = await SharedPreferences.getInstance();
    final index = cardList.indexWhere((element) => element.id == id);
    if (index >= 0 && index < cardList.length) {
      cardList[index] = cardList[index].copyWith(text: text);
      await prefs.setStringList(
          'cardList', cardList.map((e) => e.toJson()).toList());
    }
  }

  // Lógica para excluir um card
  @action
  Future<void> deleteCard(int id) async {
    final prefs = await SharedPreferences.getInstance();
    cardList.removeWhere((element) => element.id == id);
    await prefs.setStringList(
        'cardList', cardList.map((e) => e.toJson()).toList());
  }

  // Lógica para carregar os cards
  @action
  Future<void> loadCards() async {
    final prefs = await SharedPreferences.getInstance();
    final cardListJson = prefs.getStringList('cardList') ?? [];
    cardList =
        cardListJson.map((e) => CardInfo.fromJson(e)).toList().asObservable();
  }
}
