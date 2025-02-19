import 'package:flutter/material.dart';
import 'package:xlo/models/filter_model.dart';

class VendorTypeField extends StatelessWidget {

 final FormFieldSetter<int> onSaved;
  final int initialValue;

  const VendorTypeField({Key key, this.onSaved, this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state){
        return Row(
          children: [
            GestureDetector(
              onTap: (){
                if(state.value & VENDOR_TYPE_PARTICULAR != 0){
                  if(state.value & VENDOR_TYPE_PROFESSIONAL != 0)
                    state.didChange(state.value & ~VENDOR_TYPE_PARTICULAR);
                  else
                     state.didChange(VENDOR_TYPE_PROFESSIONAL);
                } else {
                  state.didChange(state.value | VENDOR_TYPE_PARTICULAR);
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width/3,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value & VENDOR_TYPE_PARTICULAR != 0 ? Colors.transparent : Colors.grey
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: state.value & VENDOR_TYPE_PARTICULAR != 0  ? Colors.blue : Colors.transparent
                ),
                alignment: Alignment.center,
                child: Text('Particular', style: TextStyle(
                  color: state.value & VENDOR_TYPE_PARTICULAR != 0  ? Colors.white : Colors.black
                ),),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: (){
                if(state.value & VENDOR_TYPE_PROFESSIONAL != 0){
                  if(state.value & VENDOR_TYPE_PARTICULAR != 0)
                    state.didChange(state.value & ~VENDOR_TYPE_PROFESSIONAL);
                  else
                     state.didChange(VENDOR_TYPE_PARTICULAR);
                } else {
                  state.didChange(state.value | VENDOR_TYPE_PROFESSIONAL);
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width/3,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value & VENDOR_TYPE_PROFESSIONAL != 0  ? Colors.transparent : Colors.grey
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: state.value & VENDOR_TYPE_PROFESSIONAL != 0  ? Colors.blue : Colors.transparent
                ),
                alignment: Alignment.center,
                child: Text('Profissional', style: TextStyle(
                  color: state.value & VENDOR_TYPE_PROFESSIONAL != 0  ? Colors.white : Colors.black
                ),),
              ),
            ),
          ],
        );
      },
    );
  }
}