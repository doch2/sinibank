class BankTransaction {
  String? _tranDate;
  String? _tranTime;
  String? _inoutType;
  String? _tranType;
  String? _printedContent;
  String? _tranAmount;
  String? _afterBalanceAmount;
  String? _branchName;

  String? get tranDate => _tranDate;
  String? get tranTime => _tranTime;
  String? get inoutType => _inoutType;
  String? get tranType => _tranType;
  String? get printedContent => _printedContent;
  String? get tranAmount => _tranAmount;
  String? get afterBalanceAmount => _afterBalanceAmount;
  String? get branchName => _branchName;

  BankTransaction({
    required String? tranDate,
    required String? tranTime,
    required String? inoutType,
    required String? tranType,
    required String? printedContent,
    required String? tranAmount,
    required String? afterBalanceAmount,
    required String? branchName
  }){
    _tranDate = tranDate;
    _tranTime = tranTime;
    _inoutType = inoutType;
    _tranType = tranType;
    _printedContent = printedContent;
    _tranAmount = tranAmount;
    _afterBalanceAmount = afterBalanceAmount;
    _branchName = branchName;
  }

  BankTransaction.fromJson(dynamic json) {
    _tranDate = json['tran_date'];
    _tranTime = json['tran_time'];
    _inoutType = json['inout_type'];
    _tranType = json['tran_type'];
    _printedContent = json['printed_content'];
    _tranAmount = json['tran_amt'];
    _afterBalanceAmount = json['after_balance_amt'];
    _branchName = json['branch_name'];
  }

}