class User {
  final String firstName;
  final String ID;
  final String Ticketdate;
  final String Tickettype;

  const User({
    required this.firstName,
    required this.ID,
    required this.Ticketdate,
    required this.Tickettype,
  });

  User copy({
    String? firstName,
    String? ID,
    String? Ticketdate,
    String? Tickettype,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        ID: ID ?? this.ID,
        Ticketdate: Ticketdate ?? this.Ticketdate,
        Tickettype: Tickettype ?? this.Tickettype,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          ID == other.ID &&
          Ticketdate == other.Ticketdate &&
          Tickettype == other.Tickettype;

  @override
  int get hashCode =>
      firstName.hashCode ^
      ID.hashCode ^
      Ticketdate.hashCode ^
      Tickettype.hashCode;
}
