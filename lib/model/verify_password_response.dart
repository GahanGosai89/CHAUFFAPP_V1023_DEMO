import 'package:ways_chauffeur/model/verify_password_response.dart';

class VerifyPasswordResponse {
  VerifyPasswordResponse({
    required this.success,
    required this.token,
    required this.data,
    required this.message,
  });

  late final bool success;
  late final String token;
  late final Data data;
  late final String message;

  VerifyPasswordResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token']??"";
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['token'] = token;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.profile,
    required this.documents,
    required this.cars,
    required this.driverImage,
    required this.ratings,
    this.currentIncomingBooking,
    required this.progress,
    required this.approveStatus,
    required this.isProfileCompleted,
    required this.offlineBooking,
    required this.isLocked,
    required this.createdAt,
    required this.updatedAt,
    required this.displayStatus,
    required this.id,
  });

  late final Profile profile;
  late final Documents documents;
  late final Cars cars;
  late final DriverImage driverImage;
  late final int ratings;
  late final Null currentIncomingBooking;
  late final int progress;
  late final bool approveStatus;
  late final bool isProfileCompleted;
  late final String offlineBooking;
  late final bool isLocked;
  late final String createdAt;
  late final String updatedAt;
  late final String displayStatus;
  late final String id;

  Data.fromJson(Map<String, dynamic> json) {
    profile = Profile.fromJson(json['profile']);
    documents = Documents.fromJson(json['documents']);
    cars = Cars.fromJson(json['cars']);
    driverImage = DriverImage.fromJson(json['driverImage']);
    ratings = json['ratings'];
    currentIncomingBooking = null;
    progress = json['progress'];
    approveStatus = json['approveStatus'];
    isProfileCompleted = json['isProfileCompleted'];
    offlineBooking = json['offlineBooking'];
    isLocked = json['isLocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    displayStatus = json['displayStatus'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['profile'] = profile.toJson();
    _data['documents'] = documents.toJson();
    _data['cars'] = cars.toJson();
    _data['driverImage'] = driverImage.toJson();
    _data['ratings'] = ratings;
    _data['currentIncomingBooking'] = currentIncomingBooking;
    _data['progress'] = progress;
    _data['approveStatus'] = approveStatus;
    _data['isProfileCompleted'] = isProfileCompleted;
    _data['offlineBooking'] = offlineBooking;
    _data['isLocked'] = isLocked;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['displayStatus'] = displayStatus;
    _data['id'] = id;
    return _data;
  }
}

class Profile {
  Profile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.knowledgeTest,
    required this.mobileNumber,
    required this.commission,
    required this.isApproved,
    required this.password,
  });

  late final FirstName firstName;
  late final LastName lastName;
  late final Email email;
  late final KnowledgeTest knowledgeTest;
  late final MobileNumber mobileNumber;
  late final int commission;
  late final bool isApproved;
  late final String password;

  Profile.fromJson(Map<String, dynamic> json) {
    firstName = FirstName.fromJson(json['firstName']);
    lastName = LastName.fromJson(json['lastName']);
    email = Email.fromJson(json['email']);
    knowledgeTest = KnowledgeTest.fromJson(json['knowledgeTest']);
    mobileNumber = MobileNumber.fromJson(json['mobileNumber']);
    commission = json['commission'];
    isApproved = json['isApproved'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstName'] = firstName.toJson();
    _data['lastName'] = lastName.toJson();
    _data['email'] = email.toJson();
    _data['knowledgeTest'] = knowledgeTest.toJson();
    _data['mobileNumber'] = mobileNumber.toJson();
    _data['commission'] = commission;
    _data['isApproved'] = isApproved;
    _data['password'] = password;
    return _data;
  }
}

class FirstName {
  FirstName({
    required this.currentStatus,
    required this.value,
  });

  late final String currentStatus;
  late final String value;

  FirstName.fromJson(Map<String, dynamic> json) {
    currentStatus = json['currentStatus'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentStatus'] = currentStatus;
    _data['value'] = value;
    return _data;
  }
}

class LastName {
  LastName({
    required this.currentStatus,
    required this.value,
  });

  late final String currentStatus;
  late final String value;

  LastName.fromJson(Map<String, dynamic> json) {
    currentStatus = json['currentStatus'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentStatus'] = currentStatus;
    _data['value'] = value;
    return _data;
  }
}

class Email {
  Email({
    required this.currentStatus,
    required this.value,
  });

  late final String currentStatus;
  late final String value;

  Email.fromJson(Map<String, dynamic> json) {
    currentStatus = json['currentStatus'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentStatus'] = currentStatus;
    _data['value'] = value;
    return _data;
  }
}

class KnowledgeTest {
  KnowledgeTest({
    required this.currentStatus,
    required this.value,
  });

  late final String currentStatus;
  late final String value;

  KnowledgeTest.fromJson(Map<String, dynamic> json) {
    currentStatus = json['currentStatus'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentStatus'] = currentStatus;
    _data['value'] = value;
    return _data;
  }
}

class MobileNumber {
  MobileNumber({
    required this.currentStatus,
    required this.value,
  });

  late final String currentStatus;
  late final String value;

  MobileNumber.fromJson(Map<String, dynamic> json) {
    currentStatus = json['currentStatus'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentStatus'] = currentStatus;
    _data['value'] = value;
    return _data;
  }
}

class Documents {
  Documents({
    required this.NINCardImage,
    required this.homeAddress,
    required this.DVLACodeImage,
    required this.DVLAECounterpart,
    required this.payment,
    required this.PHDL,
    required this.bankLetter,
    required this.liscenceAuthority,
    required this.isApproved,
  });

  late final NINCardImages NINCardImage;
  late final HomeAddress homeAddress;
  late final DVLACodeImages DVLACodeImage;
  late final DVLAECounterparts DVLAECounterpart;
  late final Payment payment;
  late final PHDLs PHDL;
  late final BankLetter bankLetter;
  late final String liscenceAuthority;
  late final bool isApproved;

  Documents.fromJson(Map<String, dynamic> json) {
    NINCardImage = NINCardImages.fromJson(json['NINCardImage']);
    homeAddress = HomeAddress.fromJson(json['homeAddress']);
    DVLACodeImage = DVLACodeImages.fromJson(json['DVLACodeImage']);
    DVLAECounterpart = DVLAECounterparts.fromJson(json['DVLAECounterpart']);
    payment = Payment.fromJson(json['payment']);
    PHDL = PHDLs.fromJson(json['PHDL']);
    bankLetter = BankLetter.fromJson(json['bankLetter']);
    liscenceAuthority = json['liscenceAuthority'];
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['NINCardImage'] = NINCardImage.toJson();
    _data['homeAddress'] = homeAddress.toJson();
    _data['DVLACodeImage'] = DVLACodeImage.toJson();
    _data['DVLAECounterpart'] = DVLAECounterpart.toJson();
    _data['payment'] = payment.toJson();
    _data['PHDL'] = PHDL.toJson();
    _data['bankLetter'] = bankLetter.toJson();
    _data['liscenceAuthority'] = liscenceAuthority;
    _data['isApproved'] = isApproved;
    return _data;
  }
}

class NINCardImages {
  NINCardImages({
    required this.url,
    required this.isSentMonthly,
    required this.isSentWeek,
    required this.isSentDay,
    required this.isSentExpired,
    required this.isAdminSentThreeDays,
    required this.currentStatus,
    required this.docValue,
    required this.label,
    required this.expiration,
  });

  late final String url;
  late final bool isSentMonthly;
  late final bool isSentWeek;
  late final bool isSentDay;
  late final bool isSentExpired;
  late final bool isAdminSentThreeDays;
  late final String currentStatus;
  late final String docValue;
  late final String label;
  late final String expiration;

  NINCardImages.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    isSentMonthly = json['isSentMonthly'];
    isSentWeek = json['isSentWeek'];
    isSentDay = json['isSentDay'];
    isSentExpired = json['isSentExpired'];
    isAdminSentThreeDays = json['isAdminSentThreeDays'];
    currentStatus = json['currentStatus'];
    docValue = json['docValue'];
    label = json['label'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['isSentMonthly'] = isSentMonthly;
    _data['isSentWeek'] = isSentWeek;
    _data['isSentDay'] = isSentDay;
    _data['isSentExpired'] = isSentExpired;
    _data['isAdminSentThreeDays'] = isAdminSentThreeDays;
    _data['currentStatus'] = currentStatus;
    _data['docValue'] = docValue;
    _data['label'] = label;
    _data['expiration'] = expiration;
    return _data;
  }
}

class HomeAddress {
  HomeAddress({
    required this.docValue,
    required this.label,
    required this.currentStatus,
  });

  late final String docValue;
  late final String label;
  late final String currentStatus;

  HomeAddress.fromJson(Map<String, dynamic> json) {
    docValue = json['docValue'];
    label = json['label'];
    currentStatus = json['currentStatus'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['docValue'] = docValue;
    _data['label'] = label;
    _data['currentStatus'] = currentStatus;
    return _data;
  }
}

class DVLACodeImages {
  DVLACodeImages({
    required this.isAdminSentExpired,
    required this.url,
    required this.isSentMonthly,
    required this.isSentWeek,
    required this.isSentDay,
    required this.isSentExpired,
    required this.isAdminSentThreeDays,
    required this.currentStatus,
    required this.docValue,
    required this.label,
    required this.expiration,
  });

  late final bool isAdminSentExpired;
  late final String url;
  late final bool isSentMonthly;
  late final bool isSentWeek;
  late final bool isSentDay;
  late final bool isSentExpired;
  late final bool isAdminSentThreeDays;
  late final String currentStatus;
  late final String docValue;
  late final String label;
  late final String expiration;

  DVLACodeImages.fromJson(Map<String, dynamic> json) {
    isAdminSentExpired = json['isAdminSentExpired'];
    url = json['url'];
    isSentMonthly = json['isSentMonthly'];
    isSentWeek = json['isSentWeek'];
    isSentDay = json['isSentDay'];
    isSentExpired = json['isSentExpired'];
    isAdminSentThreeDays = json['isAdminSentThreeDays'];
    currentStatus = json['currentStatus'];
    docValue = json['docValue'];
    label = json['label'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isAdminSentExpired'] = isAdminSentExpired;
    _data['url'] = url;
    _data['isSentMonthly'] = isSentMonthly;
    _data['isSentWeek'] = isSentWeek;
    _data['isSentDay'] = isSentDay;
    _data['isSentExpired'] = isSentExpired;
    _data['isAdminSentThreeDays'] = isAdminSentThreeDays;
    _data['currentStatus'] = currentStatus;
    _data['docValue'] = docValue;
    _data['label'] = label;
    _data['expiration'] = expiration;
    return _data;
  }
}

class DVLAECounterparts {
  DVLAECounterparts({
    required this.isAdminSentExpired,
    required this.url,
    required this.isSentMonthly,
    required this.isSentWeek,
    required this.isSentDay,
    required this.isSentExpired,
    required this.isAdminSentThreeDays,
    required this.currentStatus,
    required this.docValue,
    required this.label,
    required this.expiration,
  });

  late final bool isAdminSentExpired;
  late final String url;
  late final bool isSentMonthly;
  late final bool isSentWeek;
  late final bool isSentDay;
  late final bool isSentExpired;
  late final bool isAdminSentThreeDays;
  late final String currentStatus;
  late final String docValue;
  late final String label;
  late final String expiration;

  DVLAECounterparts.fromJson(Map<String, dynamic> json) {
    isAdminSentExpired = json['isAdminSentExpired'];
    url = json['url'];
    isSentMonthly = json['isSentMonthly'];
    isSentWeek = json['isSentWeek'];
    isSentDay = json['isSentDay'];
    isSentExpired = json['isSentExpired'];
    isAdminSentThreeDays = json['isAdminSentThreeDays'];
    currentStatus = json['currentStatus'];
    docValue = json['docValue'];
    label = json['label'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isAdminSentExpired'] = isAdminSentExpired;
    _data['url'] = url;
    _data['isSentMonthly'] = isSentMonthly;
    _data['isSentWeek'] = isSentWeek;
    _data['isSentDay'] = isSentDay;
    _data['isSentExpired'] = isSentExpired;
    _data['isAdminSentThreeDays'] = isAdminSentThreeDays;
    _data['currentStatus'] = currentStatus;
    _data['docValue'] = docValue;
    _data['label'] = label;
    _data['expiration'] = expiration;
    return _data;
  }
}

class Payment {
  Payment({
    required this.label,
    required this.name,
    required this.dob,
    required this.address,
    required this.city,
    required this.postcode,
    required this.bank,
    required this.sortCode,
    required this.accountNumber,
    required this.currentStatus,
    required this.updatedAt,
  });

  late final String label;
  late final String name;
  late final String dob;
  late final String address;
  late final String city;
  late final String postcode;
  late final String bank;
  late final String sortCode;
  late final String accountNumber;
  late final String currentStatus;
  late final String updatedAt;

  Payment.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    name = json['name'];
    dob = json['dob'];
    address = json['address'];
    city = json['city'];
    postcode = json['postcode'];
    bank = json['bank'];
    sortCode = json['sortCode'];
    accountNumber = json['accountNumber'];
    currentStatus = json['currentStatus'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['label'] = label;
    _data['name'] = name;
    _data['dob'] = dob;
    _data['address'] = address;
    _data['city'] = city;
    _data['postcode'] = postcode;
    _data['bank'] = bank;
    _data['sortCode'] = sortCode;
    _data['accountNumber'] = accountNumber;
    _data['currentStatus'] = currentStatus;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class PHDLs {
  PHDLs({
    required this.isAdminSentExpired,
    required this.url,
    required this.isSentMonthly,
    required this.isSentWeek,
    required this.isSentDay,
    required this.isSentExpired,
    required this.isAdminSentThreeDays,
    required this.currentStatus,
    required this.docValue,
    required this.label,
    required this.expiration,
  });

  late final bool isAdminSentExpired;
  late final String url;
  late final bool isSentMonthly;
  late final bool isSentWeek;
  late final bool isSentDay;
  late final bool isSentExpired;
  late final bool isAdminSentThreeDays;
  late final String currentStatus;
  late final String docValue;
  late final String label;
  late final String expiration;

  PHDLs.fromJson(Map<String, dynamic> json) {
    isAdminSentExpired = json['isAdminSentExpired'];
    url = json['url'];
    isSentMonthly = json['isSentMonthly'];
    isSentWeek = json['isSentWeek'];
    isSentDay = json['isSentDay'];
    isSentExpired = json['isSentExpired'];
    isAdminSentThreeDays = json['isAdminSentThreeDays'];
    currentStatus = json['currentStatus'];
    docValue = json['docValue'];
    label = json['label'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isAdminSentExpired'] = isAdminSentExpired;
    _data['url'] = url;
    _data['isSentMonthly'] = isSentMonthly;
    _data['isSentWeek'] = isSentWeek;
    _data['isSentDay'] = isSentDay;
    _data['isSentExpired'] = isSentExpired;
    _data['isAdminSentThreeDays'] = isAdminSentThreeDays;
    _data['currentStatus'] = currentStatus;
    _data['docValue'] = docValue;
    _data['label'] = label;
    _data['expiration'] = expiration;
    return _data;
  }
}

class BankLetter {
  BankLetter({
    required this.label,
    required this.url,
    required this.currentStatus,
    required this.updatedAt,
  });

  late final String label;
  late final String url;
  late final String currentStatus;
  late final String updatedAt;

  BankLetter.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    url = json['url'];
    currentStatus = json['currentStatus'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['label'] = label;
    _data['url'] = url;
    _data['currentStatus'] = currentStatus;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Cars {
  Cars({
    required this.carDetails,
    required this.V5CImage,
    required this.insuranceImage,
    required this.MOTCertificateImage,
    required this.PHVL,
    required this.isApproved,
  });

  late final CarDetails carDetails;
  late final V5CImages V5CImage;
  late final InsuranceImage insuranceImage;
  late final MOTCertificateImages MOTCertificateImage;
  late final PHVLs PHVL;
  late final bool isApproved;

  Cars.fromJson(Map<String, dynamic> json) {
    carDetails = CarDetails.fromJson(json['carDetails']);
    V5CImage = V5CImages.fromJson(json['V5CImage']);
    insuranceImage = InsuranceImage.fromJson(json['insuranceImage']);
    MOTCertificateImage =
        MOTCertificateImages.fromJson(json['MOTCertificateImage']);
    PHVL = PHVLs.fromJson(json['PHVL']);
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['carDetails'] = carDetails.toJson();
    _data['V5CImage'] = V5CImage.toJson();
    _data['insuranceImage'] = insuranceImage.toJson();
    _data['MOTCertificateImage'] = MOTCertificateImage.toJson();
    _data['PHVL'] = PHVL.toJson();
    _data['isApproved'] = isApproved;
    return _data;
  }
}

class CarDetails {
  CarDetails({
    required this.carRegistrationNumber,
    required this.year,
    required this.carColor,
    required this.carModel,
    required this.vehicle,
    required this.classAssigned,
  });

  late final CarRegistrationNumber carRegistrationNumber;
  late final String year;
  late final String carColor;
  late final String carModel;
  late final String vehicle;
  late final String classAssigned;

  CarDetails.fromJson(Map<String, dynamic> json) {
    carRegistrationNumber =
        CarRegistrationNumber.fromJson(json['carRegistrationNumber']);
    year = json['year'];
    carColor = json['carColor'];
    carModel = json['carModel'];
    vehicle = json['vehicle'];
    classAssigned = json['classAssigned'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['carRegistrationNumber'] = carRegistrationNumber.toJson();
    _data['year'] = year;
    _data['carColor'] = carColor;
    _data['carModel'] = carModel;
    _data['vehicle'] = vehicle;
    _data['classAssigned'] = classAssigned;
    return _data;
  }
}

class CarRegistrationNumber {
  CarRegistrationNumber({
    required this.url,
    required this.isSentMonthly,
    required this.isSentWeek,
    required this.isSentDay,
    required this.isSentExpired,
    required this.isAdminSentThreeDays,
    required this.currentStatus,
    required this.docValue,
    required this.expiration,
  });

  late final String url;
  late final bool isSentMonthly;
  late final bool isSentWeek;
  late final bool isSentDay;
  late final bool isSentExpired;
  late final bool isAdminSentThreeDays;
  late final String currentStatus;
  late final String docValue;
  late final String expiration;

  CarRegistrationNumber.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    isSentMonthly = json['isSentMonthly'];
    isSentWeek = json['isSentWeek'];
    isSentDay = json['isSentDay'];
    isSentExpired = json['isSentExpired'];
    isAdminSentThreeDays = json['isAdminSentThreeDays'];
    currentStatus = json['currentStatus'];
    docValue = json['docValue'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['isSentMonthly'] = isSentMonthly;
    _data['isSentWeek'] = isSentWeek;
    _data['isSentDay'] = isSentDay;
    _data['isSentExpired'] = isSentExpired;
    _data['isAdminSentThreeDays'] = isAdminSentThreeDays;
    _data['currentStatus'] = currentStatus;
    _data['docValue'] = docValue;
    _data['expiration'] = expiration;
    return _data;
  }
}

class V5CImages {
  V5CImages({
    required this.isAdminSentExpired,
    required this.url,
    required this.isSentMonthly,
    required this.isSentWeek,
    required this.isSentDay,
    required this.isSentExpired,
    required this.isAdminSentThreeDays,
    required this.currentStatus,
    required this.docValue,
    required this.label,
    required this.expiration,
  });

  late final bool isAdminSentExpired;
  late final String url;
  late final bool isSentMonthly;
  late final bool isSentWeek;
  late final bool isSentDay;
  late final bool isSentExpired;
  late final bool isAdminSentThreeDays;
  late final String currentStatus;
  late final String docValue;
  late final String label;
  late final String expiration;

  V5CImages.fromJson(Map<String, dynamic> json) {
    isAdminSentExpired = json['isAdminSentExpired'];
    url = json['url'];
    isSentMonthly = json['isSentMonthly'];
    isSentWeek = json['isSentWeek'];
    isSentDay = json['isSentDay'];
    isSentExpired = json['isSentExpired'];
    isAdminSentThreeDays = json['isAdminSentThreeDays'];
    currentStatus = json['currentStatus'];
    docValue = json['docValue'];
    label = json['label'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isAdminSentExpired'] = isAdminSentExpired;
    _data['url'] = url;
    _data['isSentMonthly'] = isSentMonthly;
    _data['isSentWeek'] = isSentWeek;
    _data['isSentDay'] = isSentDay;
    _data['isSentExpired'] = isSentExpired;
    _data['isAdminSentThreeDays'] = isAdminSentThreeDays;
    _data['currentStatus'] = currentStatus;
    _data['docValue'] = docValue;
    _data['label'] = label;
    _data['expiration'] = expiration;
    return _data;
  }
}

class InsuranceImage {
  InsuranceImage({
    required this.isAdminSentExpired,
    required this.url,
    required this.isSentMonthly,
    required this.isSentWeek,
    required this.isSentDay,
    required this.isSentExpired,
    required this.isAdminSentThreeDays,
    required this.currentStatus,
    required this.docValue,
    required this.label,
    required this.expiration,
  });

  late final bool isAdminSentExpired;
  late final String url;
  late final bool isSentMonthly;
  late final bool isSentWeek;
  late final bool isSentDay;
  late final bool isSentExpired;
  late final bool isAdminSentThreeDays;
  late final String currentStatus;
  late final String docValue;
  late final String label;
  late final String expiration;

  InsuranceImage.fromJson(Map<String, dynamic> json) {
    isAdminSentExpired = json['isAdminSentExpired'];
    url = json['url'];
    isSentMonthly = json['isSentMonthly'];
    isSentWeek = json['isSentWeek'];
    isSentDay = json['isSentDay'];
    isSentExpired = json['isSentExpired'];
    isAdminSentThreeDays = json['isAdminSentThreeDays'];
    currentStatus = json['currentStatus'];
    docValue = json['docValue'];
    label = json['label'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isAdminSentExpired'] = isAdminSentExpired;
    _data['url'] = url;
    _data['isSentMonthly'] = isSentMonthly;
    _data['isSentWeek'] = isSentWeek;
    _data['isSentDay'] = isSentDay;
    _data['isSentExpired'] = isSentExpired;
    _data['isAdminSentThreeDays'] = isAdminSentThreeDays;
    _data['currentStatus'] = currentStatus;
    _data['docValue'] = docValue;
    _data['label'] = label;
    _data['expiration'] = expiration;
    return _data;
  }
}

class MOTCertificateImages {
  MOTCertificateImages({
    required this.isAdminSentExpired,
    required this.url,
    required this.isSentMonthly,
    required this.isSentWeek,
    required this.isSentDay,
    required this.isSentExpired,
    required this.isAdminSentThreeDays,
    required this.currentStatus,
    required this.docValue,
    required this.label,
    required this.expiration,
  });

  late final bool isAdminSentExpired;
  late final String url;
  late final bool isSentMonthly;
  late final bool isSentWeek;
  late final bool isSentDay;
  late final bool isSentExpired;
  late final bool isAdminSentThreeDays;
  late final String currentStatus;
  late final String docValue;
  late final String label;
  late final String expiration;

  MOTCertificateImages.fromJson(Map<String, dynamic> json) {
    isAdminSentExpired = json['isAdminSentExpired'];
    url = json['url'];
    isSentMonthly = json['isSentMonthly'];
    isSentWeek = json['isSentWeek'];
    isSentDay = json['isSentDay'];
    isSentExpired = json['isSentExpired'];
    isAdminSentThreeDays = json['isAdminSentThreeDays'];
    currentStatus = json['currentStatus'];
    docValue = json['docValue'];
    label = json['label'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isAdminSentExpired'] = isAdminSentExpired;
    _data['url'] = url;
    _data['isSentMonthly'] = isSentMonthly;
    _data['isSentWeek'] = isSentWeek;
    _data['isSentDay'] = isSentDay;
    _data['isSentExpired'] = isSentExpired;
    _data['isAdminSentThreeDays'] = isAdminSentThreeDays;
    _data['currentStatus'] = currentStatus;
    _data['docValue'] = docValue;
    _data['label'] = label;
    _data['expiration'] = expiration;
    return _data;
  }
}

class PHVLs {
  PHVLs({
    required this.isAdminSentExpired,
    required this.url,
    required this.isSentMonthly,
    required this.isSentWeek,
    required this.isSentDay,
    required this.isSentExpired,
    required this.isAdminSentThreeDays,
    required this.currentStatus,
    required this.docValue,
    required this.label,
    required this.expiration,
  });

  late final bool isAdminSentExpired;
  late final String url;
  late final bool isSentMonthly;
  late final bool isSentWeek;
  late final bool isSentDay;
  late final bool isSentExpired;
  late final bool isAdminSentThreeDays;
  late final String currentStatus;
  late final String docValue;
  late final String label;
  late final String expiration;

  PHVLs.fromJson(Map<String, dynamic> json) {
    isAdminSentExpired = json['isAdminSentExpired'];
    url = json['url'];
    isSentMonthly = json['isSentMonthly'];
    isSentWeek = json['isSentWeek'];
    isSentDay = json['isSentDay'];
    isSentExpired = json['isSentExpired'];
    isAdminSentThreeDays = json['isAdminSentThreeDays'];
    currentStatus = json['currentStatus'];
    docValue = json['docValue'];
    label = json['label'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isAdminSentExpired'] = isAdminSentExpired;
    _data['url'] = url;
    _data['isSentMonthly'] = isSentMonthly;
    _data['isSentWeek'] = isSentWeek;
    _data['isSentDay'] = isSentDay;
    _data['isSentExpired'] = isSentExpired;
    _data['isAdminSentThreeDays'] = isAdminSentThreeDays;
    _data['currentStatus'] = currentStatus;
    _data['docValue'] = docValue;
    _data['label'] = label;
    _data['expiration'] = expiration;
    return _data;
  }
}

class DriverImage {
  DriverImage({
    required this.url,
    required this.expiration,
  });

  late final String url;
  late final String expiration;

  DriverImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['expiration'] = expiration;
    return _data;
  }
}
