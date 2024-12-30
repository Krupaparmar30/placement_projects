class ProModalOne {
  late int userId, id;
  late String title;
  late bool completed;

  ProModalOne(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory ProModalOne.fromJson(Map m1) {
    return ProModalOne(
        userId: m1['userId'],
        id: m1['id'],
        title: m1['title'],
        completed: m1['completed']);
  }
}
