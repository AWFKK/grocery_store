import 'package:flutter/material.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const kPrimaryColor = Color(0xFFFF7643);
const myAppName = "App Name";

const kDefaultPaddin = 20.0;

const defaultDuration = Duration(milliseconds: 250);

//All Api placed in this class.
//Just replace with existing base url here.
class APIS {

  //Base Url
  static var baseurl = "https://api.redline-pay.com/api/";

  //Sub Url
  static var subUrl  = "auth/";
  static var subUrlUser  = "user/";
  static var subUrlTransfer  = "money_transfer/";
  static var subUrlTransaction  = "transaction/";
  static var subUrlDeposit = "deposit/";





  //Services
  static var login = baseurl + subUrl + "login";
  static var register = baseurl + subUrl + "register";
  static var opt = baseurl + subUrl + "otp";
  static var wallets = baseurl + subUrl + "wallets";
  static var profile = baseurl + "me";
  static var updateProfile = baseurl + subUrlUser + "update";
  static var updateAvatar = baseurl + subUrlUser + "update/avatar";
  static var sendMoney = baseurl + subUrlTransfer + "send";
  static var exchange = baseurl + "exchange";
  static var transaction = baseurl + subUrlTransaction + "transactions";
  static var depositMethod = baseurl + subUrlDeposit + "deposit_methods";

  static var availableCurrencies = baseurl + "get_available_currencies";
  static var exchangeRate = baseurl + "get_exchange_rate";




// static const curr = '\$';
//var curr = '£';
// static const curr = ''';
}