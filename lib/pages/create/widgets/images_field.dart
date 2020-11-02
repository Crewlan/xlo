import 'package:flutter/material.dart';
import 'package:xlo/pages/create/widgets/image_source_sheet.dart';

class ImageField extends StatelessWidget {

  final FormFieldSetter<List> onSaved;
  final List initalValue;

  const ImageField({this.onSaved, this.initalValue});


  @override
  Widget build(BuildContext context) {
    return FormField<List>(
      initialValue: initalValue,
      onSaved: onSaved,
      validator: (images){
        if(images.isEmpty)
          return 'Campo obrigatorio';
        return null;
      },
      builder: (state) {
        return Column(
          children: [
            Container(
              color: Colors.grey[200],
              height: 140,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.value.length + 1,
                  itemBuilder: (context, index) {
                    if (index == state.value.length)
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => ImageSourceSheet(
                                (image){
                                  if(image != null)
                                    state.didChange(state.value..add(image));
                                  Navigator.of(context).pop();
                                }
                              )
                              );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 16, bottom: 16),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 52,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Text(
                                  '+ inserir',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    return GestureDetector(
                      onTap: (){
                        showDialog(context: context, 
                        builder: (context) => Dialog(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.file(state.value[index]),
                              FlatButton(
                                onPressed: (){
                                  state.didChange(state.value..removeAt(index));
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Excluir'),
                                textColor: Colors.red,
                                )
                            ],
                          ),
                        ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                              left: 16, top: 16, bottom: 16),
                        child: CircleAvatar(
                          radius: 52,
                          backgroundImage: FileImage(state.value[index]),
                        ),
                      ),
                    );
                  }),
            ),
            if(state.hasError)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  state.errorText,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
