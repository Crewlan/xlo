import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {

  final Function(File) onImageSelected;

  const ImageSourceSheet(this.onImageSelected);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: (){},
      builder: (context){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlatButton(
              onPressed: () async{
                // ignore: deprecated_member_use
                final File image = await ImagePicker.pickImage(source: ImageSource.camera);
                onImageSelected(image);
              },
              child: const Text('Camera')),
              FlatButton(
              onPressed: () async{
                 // ignore: deprecated_member_use
                final File image = await ImagePicker.pickImage(source: ImageSource.gallery);
                onImageSelected(image);
              },
              child: const Text('Galeria'))
          ],
        );
      },
    );
  }
}