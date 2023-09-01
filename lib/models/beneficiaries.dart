class Beneficiary {
  const Beneficiary(
      {required this.bpId,
      required this.beneficiaryName,
      required this.accountNumber,
      this.limit = 0.0});

  final String bpId;
  final String beneficiaryName;
  final String accountNumber;
  final double limit;
}
