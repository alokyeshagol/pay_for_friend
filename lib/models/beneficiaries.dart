class Beneficiary {
  const Beneficiary(
      {required this.bpId,
      required this.beneficiaryName,
      required this.accountNumber,
      required this.limit});

  final String bpId;
  final String beneficiaryName;
  final String accountNumber;
  final double limit;
}
