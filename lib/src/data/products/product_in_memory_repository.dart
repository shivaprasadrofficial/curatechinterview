import 'dart:convert';

import 'package:cura_tech/src/domain/products/product.dart';
import 'package:cura_tech/src/domain/products/product_repository.dart';

const products = '''[
  {
    "id": "1",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600085129/cropped/mu5bahqxfrp28cut6que.jpg",
    "title": "Dolo 650",
    "price": 26.13
  },
  {
    "id": "2",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600085229/cropped/wifp2vvwa08pvwgv2iex.jpg",
    "title": "Calpol 650",
    "price": 27.05
  },
  {
    "id": "3",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600102613/cropped/unzou61aunhaxx9egjjp.jpg",
    "title": "Pyrigesic 650",
    "price": 17.45
  },
  {
    "id": "4",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600084828/cropped/dtofgenowsr6qvddyewx.jpg",
    "title": "P 650",
    "price": 17.14
  },
  {
    "id": "5",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600091746/cropped/pk2m3qgtbf3ew0wozsmx.jpg",
    "title": "Paracip 650",
    "price": 17.42
  },
  {
    "id": "6",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600140636/cropped/yvcsl6mcrektaznzfq3m.jpg",
    "title": "Pacimol 650",
    "price": 26.13
  },
  {
    "id": "7",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600160524/cropped/aozvorrglym55xxtxphl.jpg",
    "title": "Dolopar 650",
    "price": 26.14
  },
  {
    "id": "8",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600196584/cropped/yphty48rakp9tpv7zuxx.jpg",
    "title": "Sumo L 650",
    "price": 25.35
  },
  {
    "id": "9",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600148583/cropped/aphcdvrsng7m2p6rf4at.jpg",
    "title": "Auxipar 650",
    "price": 17.84
  },
  {
    "id": "10",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600082265/cropped/fvehus3guz9aspoqpma1.jpg",
    "title": "Cetrizine ",
    "price": 15.90
  },
  {
    "id": "11",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600082913/cropped/vl3kxion1sm0hceui05s.jpg",
    "title": "CZ 3",
    "price": 16.75
  },
  {
    "id": "12",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600071463/cropped/zu5bir6okjywrm4ymezg.jpg",
    "title": "Avil NU 10",
    "price": 14.50
  },
  {
    "id": "13",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600084213/cropped/ebql55l1cjgcgbjwl33e.jpg",
    "title": "Alerid",
    "price": 14.94
  },
  {
    "id": "14",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600082292/cropped/mprphsdumbrfrhfgfd9i.jpg",
    "title": "Okacet",
    "price": 19.84
  },
  {
    "id": "15",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600082291/cropped/kbroxohh8pa7bzjzrate.jpg",
    "title": "Cetcip",
    "price": 19.00
  },
  {
    "id": "16",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600082291/cropped/q1fhjdwem91ntwrvtlk7.jpg",
    "title": "Zyncet",
    "price": 17.06
  },
  {
    "id": "17",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600082291/cropped/bej6snydmjk5eamwk3oi.jpg",
    "title": "Incid-L",
    "price": 16.52
  },
  {
    "id": "18",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_120,h_120/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/v1600140878/cropped/fnozi0qiirwbhy0oiwbo.jpg",
    "title": "Renerve Plus Softgel",
    "price": 273.50
  },
  {
    "id": "19",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_120,h_120/a_ignore,w_120,h_120,c_fit,q_auto,f_auto/v1600106337/cropped/qobapoufwcjwdzkqdqw1.jpg",
    "title": "Bevon",
    "price": 93.50
  },
  {
    "id": "20",
    "image":
    "https://res.cloudinary.com/du8msdgbj/image/upload/l_watermark_346,w_120,h_120/a_ignore,w_120,h_120,c_fit,q_auto,f_auto/v1600086252/cropped/klzxtt9nc2a0og9xgnqu.jpg",
    "title": "Bio-D3 Plus",
    "price": 93.50
  }
]''';

class ProductInMemoryRepository implements ProductRepository {
  @override
  Future<List<Product>> get() async {
    return Future.delayed(
        const Duration(seconds: 2), () => _parse(jsonDecode(products)));
  }

  List<Product> _parse(List<dynamic> json) {
    return json.map((jsonItem) => _parseProducts(jsonItem)).toList();
  }

  Product _parseProducts(Map<String, dynamic> json) {
    return Product(json['id'], json['image'], json['title'], json['price']);
  }
}
