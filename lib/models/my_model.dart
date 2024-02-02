class MyModel {
    int code;
    String msg;
    MyData data;

    MyModel({
        required this.code,
        required this.msg,
        required this.data,
    });

    factory MyModel.fromJson(Map<String, dynamic> json) => MyModel(
        code: json["code"],
        msg: json["msg"],
        data: MyData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data.toJson(),
    };
}

class MyData {
    List<MenuFallow> menuFallow;

    MyData({
        required this.menuFallow,
    });

    factory MyData.fromJson(Map<String, dynamic> json) => MyData(
        menuFallow: List<MenuFallow>.from(json["menu_fallow"].map((x) => MenuFallow.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "menu_fallow": List<dynamic>.from(menuFallow.map((x) => x.toJson())),
    };
}

class MenuFallow {
    String name;
    String url;

    MenuFallow({
        required this.name,
        required this.url,
    });

    factory MenuFallow.fromJson(Map<String, dynamic> json) => MenuFallow(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}