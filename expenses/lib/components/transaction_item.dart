
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class transactionItem extends StatelessWidget {
  const transactionItem({
    Key key,
    @required this.tr,
    @required this.delete,
  }) : super(key: key);

  final Transaction tr;
  final void Function(String p1) delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(
                child: Text('R\$ ${tr.value}'),
              ),
            ),
          ),
          title: Text(
            tr.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            DateFormat('d MMM y').format(tr.date),
          ),
          trailing: MediaQuery.of(context).size.width > 480
              ? FlatButton.icon(
                  onPressed: () => delete(tr.id),
                  icon: const Icon(Icons.delete),
                  label: const Text('Excluir'),
                  textColor: Theme.of(context).errorColor,
                )
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => delete(tr.id),
                )),
    );
  }
}
