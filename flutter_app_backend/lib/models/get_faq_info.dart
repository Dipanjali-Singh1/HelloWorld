class FAQInfo{
  int id;
  String about_content;
  String title;
  String description;
  String created_at;
  String img;
  String author;

  FAQInfo(String img,int id, String about_content, String title, String description, String created_at, String author){
    this.id=id;
    this.about_content=about_content;
    this.description=description;
    this.title=title;
    this.created_at=created_at;
    this.img=img;
    this.author=author;
  }

  FAQInfo.fromJson(Map json)
          :id=json['id'],
          author=json['author'],
          about_content=json['about_content'],
          description=json['description'],
          title=json['title'],
          created_at=json['created_at'],
          img=json['img'];
  Map toJson(){
    return {
      'id':id,
      'about_content':about_content,
      'title':title,
      'description':description,
      'created_at':created_at,
      'img':img,
      'author':author,
    };
  }

}