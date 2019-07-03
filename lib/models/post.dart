class post{
  String title ,content,date_written,featured_image;
  int id ,votes_up,votes_down;
  List<int> voters_up,voters_down;
  String created_at,updated_at;

  post({this.id, this.title, this.content, this.date_written,
      this.featured_image, this.votes_up, this.votes_down, this.voters_up,
      this.voters_down, this.created_at, this.updated_at});

}
