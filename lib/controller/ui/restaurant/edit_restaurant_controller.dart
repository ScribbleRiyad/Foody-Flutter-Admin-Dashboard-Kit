import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/my_form_validator.dart';
import 'package:foody/views/my_controller.dart';

class EditRestaurantController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();
  int fullWidthIndex = 0;
  final TickerProvider tickerProvider;

  late TabController fullWidthTabController = TabController(
      length: 3, vsync: tickerProvider, initialIndex: fullWidthIndex);

  EditRestaurantController(this.tickerProvider) {
    fullWidthTabController.addListener(() {
      fullWidthIndex = fullWidthTabController.index;
      update();
    });
  }

  /// Business Detail
  final String _dummyFirstName = "Den";
  final String _dummyLastName = "Joh";
  final String _dummyContactNumber = "+80 654987354";
  final String _dummyPhoneNumber = "+80 65498125";
  final String _dummyEmail = "demo@gmail.com";
  final String _dummyDOB = "11/11/1111";
  final String _dummyCity = "Kitchener";
  final String _dummyCountry = "Canada";
  final String _dummyZipCode = "453424";
  final String _dummyDescription =
      "Hi, I'm Den, it has been the industry's standard dummy text since the 1500s when an unknown printer took a galley of type.";

  /// Restaurant Detail
  final String _dummyCompanyName = "Healthy Feast Corner";
  final String _dummyCompanyType = "Partnership";
  final String _dummyPanCardNumber = "KGX5793RSD";
  final String _dummyFaxNumber = "+1 65 497 321";
  final String _dummyWebsite = "http://healthyfeastcorner.com";

  /// Bank Detail
  final String _dummyBankName = "National Bank of Canada";
  final String _dummyBankBranch = "Alberta";
  final String _dummyAccountHolderName = "Fianna Troves";
  final String _dummyAccountNumber = "378282246310005";
  final String _dummyIFSCCode = "B0FA0MM6205";

  @override
  void onInit() {
    basicValidator.addField('first_name',
        controller: TextEditingController(text: _dummyFirstName));
    basicValidator.addField('last_name',
        controller: TextEditingController(text: _dummyLastName));
    basicValidator.addField('contact_number',
        controller: TextEditingController(text: _dummyContactNumber));
    basicValidator.addField('phone_number',
        controller: TextEditingController(text: _dummyPhoneNumber));
    basicValidator.addField('email',
        controller: TextEditingController(text: _dummyEmail));
    basicValidator.addField('dob',
        controller: TextEditingController(text: _dummyDOB));
    basicValidator.addField('city',
        controller: TextEditingController(text: _dummyCity));
    basicValidator.addField('country',
        controller: TextEditingController(text: _dummyCountry));
    basicValidator.addField('zip_code',
        controller: TextEditingController(text: _dummyZipCode));
    basicValidator.addField('description',
        controller: TextEditingController(text: _dummyDescription));
    basicValidator.addField('company_name',
        controller: TextEditingController(text: _dummyCompanyName));
    basicValidator.addField('company_type',
        controller: TextEditingController(text: _dummyCompanyType));
    basicValidator.addField('pan_card_number',
        controller: TextEditingController(text: _dummyPanCardNumber));
    basicValidator.addField('fax_number',
        controller: TextEditingController(text: _dummyFaxNumber));
    basicValidator.addField('website',
        controller: TextEditingController(text: _dummyWebsite));
    basicValidator.addField('bank_name',
        controller: TextEditingController(text: _dummyBankName));
    basicValidator.addField('bank_branch',
        controller: TextEditingController(text: _dummyBankBranch));
    basicValidator.addField('account_holder_name',
        controller: TextEditingController(text: _dummyAccountHolderName));
    basicValidator.addField('account_number',
        controller: TextEditingController(text: _dummyAccountNumber));
    basicValidator.addField('ifsc_code',
        controller: TextEditingController(text: _dummyIFSCCode));

    super.onInit();
  }
}
