import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo/helpers/format_field.dart';
import 'package:xlo/models/filter_model.dart';

class PriceRangeField extends StatelessWidget {

  final Filter filter;

  const PriceRangeField({Key key, this.filter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Min'
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              // ignore: deprecated_member_use
              WhitelistingTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: false),
            ],
            initialValue: filter.minPrice?.toString(),
            onSaved: (s){
              if(s.isEmpty)
                filter.minPrice = null;
              else
                filter.minPrice = int.tryParse(getSanitizedText(s));
            },
            validator: (s){
              if(s.isNotEmpty && int.tryParse(getSanitizedText(s)) == null)
                return 'Utilize valores validos';
              return null;
            },
          ),
          ),
          const SizedBox(width: 10,),
          Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Max'
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              // ignore: deprecated_member_use
              WhitelistingTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: false),
            ],
            initialValue: filter.maxPrice?.toString(),
            onSaved: (s){
              if(s.isEmpty)
                filter.maxPrice = null;
              else
                filter.maxPrice = int.tryParse(getSanitizedText(s));
            },
            validator: (s){
              if(s.isNotEmpty && int.tryParse(getSanitizedText(s)) == null)
                return 'Utilize valores validos';
              return null;
            },
          ),
          )
      ],
    );
  }
}