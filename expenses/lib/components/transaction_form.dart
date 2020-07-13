import 'package:expenses/components/adapative_datepicker.dart';
import 'package:expenses/components/adaptativeButtom.dart';
import 'package:expenses/components/adaptativeText.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  //Selecionar datas
  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) => pickedDate == null
          ? null
          : setState(() => _selectedDate = pickedDate),
    ); //then serve para instanciar a data selecionada
    print('tudo foi executado');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            AdaptativeText(
              controller: _titleController,
              label: 'Título',
              submit: (_) => _submitForm(),
            ),
            AdaptativeText(
              controller: _valueController,
              label: 'Valor R\$',
              submit: (_) => _submitForm(),
              keyboard: TextInputType.numberWithOptions(decimal: true),
            ),
            // TextField(
            //   controller: _titleController,
            //   onSubmitted: (_) => _submitForm(),
            //   decoration: InputDecoration(
            //     labelText: 'Título',
            //   ),
            // ),
            // TextField(
            //   controller: _valueController,
            //   keyboardType: TextInputType.numberWithOptions(decimal: true),
            //   onSubmitted: (_) => _submitForm(),
            //   decoration: InputDecoration(
            //     labelText: 'Valor R\$',
            //   ),
            // ),
            // Container(
            //   height: 70,
            //   child: Row(
            //     children: <Widget>[
            //       Text(
            //         _selectedDate == null
            //             ? 'Nenhuma data selecionada'
            //             : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
            //       ),
            //       FlatButton(
            //         textColor: Theme.of(context).primaryColor,
            //         child: Text(
            //           'Selecionar data',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         onPressed: _showDatePicker,
            //       )
            //     ],
            //   ),
            // ),

            AdaptativeDatePicker(
              selectedDate: _selectedDate,
              onDateChange: (newDate) => setState(() => _selectedDate = newDate),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AdaptativeButtom(
                  label: 'Nova Transação',
                  onPressed: _submitForm,
                ),
                // RaisedButton(
                //   child: Text('Nova Transação'),
                //   color: Theme.of(context).primaryColor,
                //   // textColor: Colors.white,
                //   textColor: Theme.of(context).textTheme.button.color,
                //   onPressed: _submitForm,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
