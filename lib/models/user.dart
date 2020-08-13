class User {
    String userName;
    int age;
    String profileImgUrl;

    User(this.userName, this.age, this.profileImgUrl);

    User.defaultValue({this.userName = "", this.age = 0, this.profileImgUrl = ""});
}
