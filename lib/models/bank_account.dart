class BankAccount {
  String? _fintechUseNum;
  String? _accountAlias;
  String? _bankCodeStd;
  String? _bankCodeSub;
  String? _bankName;
  String? _accountNumMasked;
  String? _accountHolderName;
  String? _accountHolderType;
  String? _accountType;

  String? get fintechUserNum => _fintechUseNum;
  String? get accountAlias => _accountAlias;
  String? get bankCodeStd => _bankCodeStd;
  String? get bankCodeSub => _bankCodeSub;
  String? get bankName => _bankName;
  String? get accountNumMasked => _accountNumMasked;
  String? get accountHolderName => _accountHolderName;
  String? get accountHolderType => _accountHolderType;
  String? get accountType => _accountType;


  BankAccount({
    String? fintechUserNum,
    String? accountAlias,
    String? bankCodeStd,
    String? bankCodeSub,
    String? bankName,
    String? accountNumMasked,
    String? accountHolderName,
    String? accountHolderType,
    String? accountType,
  }){
    _fintechUseNum = fintechUserNum;
    _accountAlias = accountAlias;
    _bankCodeStd = bankCodeStd;
    _bankName = bankName;
    _accountNumMasked = accountNumMasked;
    _accountHolderName = accountHolderName;
    _accountHolderType = accountHolderType;
    _accountType = accountType;
  }

  BankAccount.fromJson(dynamic json) {
    _fintechUseNum = json['fintech_use_num'];
    _accountAlias = json['account_alias'];
    _bankCodeStd = json['bank_code_std'];
    _bankCodeSub = json['bank_code_sub'];
    _bankName = json['bank_name'];
    _accountNumMasked = json['account_num_masked'];
    _accountHolderName = json['account_holder_name'];
    _accountHolderType = json['account_holder_type'];
    _accountType = json['acount_type'];
  }

}