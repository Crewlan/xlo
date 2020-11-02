class AddressModel {

  String place;
  String district;
  String city;
  String postalCode;
  String federalUnit;

  AddressModel({
    this.place,
    this.district,
    this.city,
    this.postalCode,
    this.federalUnit
  });

  @override
  String toString() {
    return '$place, $district, $city, $postalCode, $federalUnit';
  }
}