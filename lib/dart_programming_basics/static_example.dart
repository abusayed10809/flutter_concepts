class User {
  String name;

  static int userCount = 0;

  User(this.name) {
    userCount++;
  }
}

_showUserCount() {
  print(User.userCount);

  User u1 = User("Rahim");
  User u2 = User("Karim");
  User u3 = User("Sumon");

  print(User.userCount);
}

void main() {
  _showUserCount();

  print(User.userCount);

  User u4 = User("Pintu");

  print(User.userCount);
}
