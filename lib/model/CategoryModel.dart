/// status : true
/// message : "Success"
/// data : [{"id":1,"title":"blanditiis","description":"Veniam aperiam ipsum aut at et omnis voluptatem. Voluptatem voluptatem nam cum nesciunt recusandae porro. Voluptate autem sint et eaque sint quis sint.","image":"https://picsum.photos/640/480/?84617","visible":0,"products_count":6},{"id":2,"title":"est","description":"Deleniti eos harum sed iusto iusto cumque. Commodi ratione eius accusantium ut sunt. Pariatur sit ex ex et sequi et. Hic amet nemo provident excepturi nihil suscipit totam. Est vero voluptate eius.","image":"https://picsum.photos/640/480/?48190","visible":1,"products_count":3},{"id":3,"title":"dolorum","description":"Repudiandae aut soluta saepe vitae ut pariatur dolorem aut. Aut nihil nobis voluptatem. Expedita perferendis voluptatibus maiores maxime harum commodi. Repudiandae reprehenderit dolor voluptatem molestiae. Accusamus et aliquam libero distinctio.","image":"https://picsum.photos/640/480/?89751","visible":1,"products_count":10},{"id":4,"title":"sunt","description":"Deleniti nostrum nam quisquam dolorum. Rem aperiam esse facilis qui molestias. Et soluta sint et minus iste facilis.","image":"https://picsum.photos/640/480/?19455","visible":0,"products_count":3},{"id":5,"title":"facere","description":"Vero consequatur ipsum dolor soluta consequatur debitis. Iste quia et et non. Qui autem architecto et mollitia veniam eum. Qui eveniet aliquid aliquid deleniti.","image":"https://picsum.photos/640/480/?41038","visible":0,"products_count":3},{"id":6,"title":"omnis","description":"Molestiae pariatur qui quo accusantium animi sit. Est molestias est quasi delectus voluptas consequuntur autem.","image":"https://picsum.photos/640/480/?47790","visible":1,"products_count":5},{"id":7,"title":"omnis","description":"Nesciunt maxime nobis sequi unde corrupti unde. Tempore minus quas aut quia rerum alias libero culpa. Nihil hic vitae repellat aut eaque qui. Exercitationem et quia itaque autem explicabo itaque dolorum iusto. Odio et mollitia est rem est explicabo.","image":"https://picsum.photos/640/480/?82876","visible":0,"products_count":7},{"id":8,"title":"officia","description":"Aut alias fugit quia itaque numquam aut. Sint exercitationem porro maxime mollitia eum deleniti et eaque.","image":"https://picsum.photos/640/480/?13185","visible":1,"products_count":6},{"id":9,"title":"laboriosam","description":"Aut officiis recusandae sunt sunt ut nemo. Pariatur eum sit error aliquam ullam aliquam. Maiores reiciendis numquam porro enim nulla impedit rem. Quia rem sit itaque.","image":"https://picsum.photos/640/480/?45773","visible":1,"products_count":4},{"id":10,"title":"ut","description":"Modi ducimus consequuntur est ratione. Mollitia non voluptatem nihil doloribus. Est dolorum aspernatur hic minus.","image":"https://picsum.photos/640/480/?12819","visible":1,"products_count":5},{"id":11,"title":"pariatur","description":"Et tempore sapiente quod molestiae quia eaque rem doloremque. Aspernatur et ducimus illo consequuntur beatae consequatur cupiditate. Ut id aut quia debitis aut laborum.","image":"https://picsum.photos/640/480/?12423","visible":1,"products_count":2},{"id":12,"title":"dignissimos","description":"Quae sed alias quia exercitationem. Sit deserunt aperiam dignissimos blanditiis et provident. Omnis repellat fuga quae sunt minima voluptatem quibusdam.","image":"https://picsum.photos/640/480/?33587","visible":0,"products_count":4},{"id":13,"title":"sit","description":"Eos dolor dolores vel laudantium. Soluta error dolorem eius alias laborum autem. Modi quam et sed quia rerum. Repellendus eos dolorum et nostrum. Possimus distinctio quia excepturi voluptatum.","image":"https://picsum.photos/640/480/?36780","visible":1,"products_count":5},{"id":14,"title":"repudiandae","description":"Quas maiores molestiae cum beatae rerum quis. Aut eligendi expedita dolores quis. Quibusdam repellendus accusamus nemo nisi.","image":"https://picsum.photos/640/480/?67301","visible":0,"products_count":5},{"id":15,"title":"rerum","description":"Exercitationem pariatur distinctio rerum eos aperiam vitae ut in. Totam eos neque eum voluptatem. At quae eos id voluptatem. Sunt ipsam vel voluptatum non sit. Odio et rerum magni cumque.","image":"https://picsum.photos/640/480/?52287","visible":0,"products_count":9}]

class CategoryModel {
  CategoryModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  CategoryModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
CategoryModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => CategoryModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// title : "blanditiis"
/// description : "Veniam aperiam ipsum aut at et omnis voluptatem. Voluptatem voluptatem nam cum nesciunt recusandae porro. Voluptate autem sint et eaque sint quis sint."
/// image : "https://picsum.photos/640/480/?84617"
/// visible : 0
/// products_count : 6

class Data {
  Data({
      num? id, 
      String? title, 
      String? description, 
      String? image, 
      num? visible, 
      num? productsCount,}){
    _id = id;
    _title = title;
    _description = description;
    _image = image;
    _visible = visible;
    _productsCount = productsCount;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _image = json['image'];
    _visible = json['visible'];
    _productsCount = json['products_count'];
  }
  num? _id;
  String? _title;
  String? _description;
  String? _image;
  num? _visible;
  num? _productsCount;
Data copyWith({  num? id,
  String? title,
  String? description,
  String? image,
  num? visible,
  num? productsCount,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  image: image ?? _image,
  visible: visible ?? _visible,
  productsCount: productsCount ?? _productsCount,
);
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get image => _image;
  num? get visible => _visible;
  num? get productsCount => _productsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['image'] = _image;
    map['visible'] = _visible;
    map['products_count'] = _productsCount;
    return map;
  }

}