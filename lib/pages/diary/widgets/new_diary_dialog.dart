import 'package:flutter/material.dart';

import '../diary_store.dart';

class NewDiaryDialog extends StatefulWidget {
  final DiaryStore diaryController;

  NewDiaryDialog(this.diaryController);

  @override
  _NewDiaryDialogState createState() => _NewDiaryDialogState();
}

class _NewDiaryDialogState extends State<NewDiaryDialog> {
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Novo Diario',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Titulo',
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              minLines: 2,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descrição',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  textColor: Colors.red,
                  child: Text('Cancelar'),
                ),
                RaisedButton(
                  onPressed: () {
                    widget.diaryController.addDiary(
                      _titleController.text,
                      _descriptionController.text,
                    );
                    Navigator.pop(context);
                  },
                  color: Colors.blueAccent,
                  colorBrightness: Brightness.dark,
                  child: Text('Salvar'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
