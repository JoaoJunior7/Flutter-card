part of '../card_page/card_page.dart';

class _CustomCard extends StatefulWidget {
  const _CustomCard();

  @override
  State<_CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<_CustomCard> {
  final controller = CardController();

  @override
  void initState() {
    super.initState();
    controller.loadCards();
  }

  @override
  void dispose() {
    controller.loadCards();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 400,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Observer(builder: (_) {
                      // Quando a lista de cards estiver vazia, exibe um texto
                      if (controller.cardList.isEmpty) {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Digite o seu texto'),
                          ],
                        );
                      } else {
                        // Quando a lista de cards não estiver vazia, exibe a lista
                        return ListView.builder(
                          itemCount: controller.cardList.length,
                          itemBuilder: (context, index) {
                            final card = controller.cardList[index];
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(card.text),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Botões de editar e excluir
                                      IconButton(
                                        icon: const Icon(Icons.edit, size: 30,),
                                        onPressed: () {
                                          _editCard(context, controller, card);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.cancel, color: Colors.red, size: 30,),
                                        onPressed: () {
                                          _deleteCard(
                                              context, controller, card);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                // Divisor entre os cards
                                const Divider(),
                              ],
                            );
                          },
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Botão para adicionar um novo card
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 70,
              ),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          onPressed: () {
            _addCard(context, controller);
          },
          child: const Text(
            'Digite o seu texto',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

// Função para adicionar
void _addCard(BuildContext context, CardController controller) async {
  final TextEditingController textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: AlertDialog(
          title: const Text('Adicionar Cartão'),
           content: Form(
            key: formKey,
            child: TextFormField(
              autofocus: true,
              validator: Validatorless.required('Informação obrigatória'),
              controller: textController,
              decoration: const InputDecoration(labelText: 'Digite seu texto'),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  await controller.addCard(textController.text);
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        ),
      );
    },
  );
}

// Função para editar
void _editCard(
    BuildContext context, CardController controller, CardInfo card) async {
  final TextEditingController textController =
      TextEditingController(text: card.text);
      final formKey = GlobalKey<FormState>();

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: AlertDialog(
          title: const Text('Editar Cartão'),
          content: Form(
            key: formKey,
            child: TextFormField(
            validator: Validatorless.required('Informação obrigatória'),
              controller: textController,
              decoration: const InputDecoration(labelText: 'Digite seu texto'),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  await controller.editCard(card.id, textController.text);
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                  
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      );
    },
  );
}

// Função para excluir
void _deleteCard(
    BuildContext context, CardController controller, CardInfo card) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Excluir Cartão'),
        content: const Text('Deseja realmente excluir este cartão?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              await controller.deleteCard(card.id);
              if (!context.mounted) return;
              Navigator.of(context).pop();
            },
            child: const Text('Excluir'),
          ),
        ],
      );
    },
  );
}
