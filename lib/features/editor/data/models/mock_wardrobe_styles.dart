import 'wardrobe_style_model.dart';

class MockWardrobeStyles {
  static final List<WardrobeStyleModel> styles = _rawJson
      .map((json) => WardrobeStyleModel.fromJson(json))
      .toList();

  static const List<Map<String, dynamic>> _rawJson = [
    {
        "id": "146",
        "style": "Partywear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/99a2bab7555e4c02b2ebd630af649e6c_女_Partywear08_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/791dee29282c4a8295c1cc26bdbfd476_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "17433"
    },
    {
        "id": "199",
        "style": "Gothics",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/2904dac27edf4ce38484d2c43070fb55.png",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/fb293a3f0902440e9ae2edb7cef78793.png",
        "hot": true,
        "showFirst": true,
        "usageCount": "6335"
    },
    {
        "id": "114",
        "style": "Gothics",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/c1f15aad0cc742a69c1c87df372b6b0f.png",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/6ad1eb362c0b448cbb7899f982bd94b3.png",
        "hot": true,
        "showFirst": false,
        "usageCount": "9258"
    },
    {
        "id": "145",
        "style": "Partywear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/87b26961ca5d4718b0b5cf211c688c36_女_Partywear07_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/ab4249d588944076aa46a58593d199ba_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "12347"
    },
    {
        "id": "147",
        "style": "Sportswear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/bd10f012c9fd4906bda97f765e085b3c_女_Sportswear01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/8488a1094eee420cbe8e8b0110a68861_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2682"
    },
    {
        "id": "74",
        "style": "Beachwear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/a9a07f23594f43cfaf048c9ec1b64c36_女_Beachwear04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/126115385a7b47c4870fab89505dc225_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "28197"
    },
    {
        "id": "110",
        "style": "Gothics",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/304122b19d6c47538e839cf13f06fd7b.png",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/fc2ce069c73b41dba537a9f936d00c31.png",
        "hot": true,
        "showFirst": false,
        "usageCount": "10530"
    },
    {
        "id": "115",
        "style": "Gothics",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/d58db5387d91457ea776ad98f98cca0b.png",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/64409581e7c34357b68b88502386571b.png",
        "hot": true,
        "showFirst": false,
        "usageCount": "7553"
    },
    {
        "id": "184",
        "style": "Y3K",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/4b70b0f142db4461890cab3d315a9cb7_女_Y3K01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/637652b070e740ffaefa52d77a153c9a_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1535"
    },
    {
        "id": "198",
        "style": "Partywear",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/930f6015a60744f587eee538679d607a.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2553"
    },
    {
        "id": "197",
        "style": "Wedding",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/54346aa04cd24518988be3ac823df85a_男_Wedding03.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": true,
        "showFirst": true,
        "usageCount": "14270"
    },
    {
        "id": "134",
        "style": "Hippie",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/318c92501a1742559bd33103b5640ad7_女_Hippie02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/6b67feb1fd204f2392e102b1400937b6_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3690"
    },
    {
        "id": "195",
        "style": "Partywear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/b817c4b80c94455b9bfdf169ef4cf031_男_Partywear06.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "3945"
    },
    {
        "id": "117",
        "style": "Him",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/52a08099945243d09f7ea07c4b613386_男_Him01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/da02b5ef90144bb48eeb7a910b5f198e_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2812"
    },
    {
        "id": "167",
        "style": "Tops",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/394f70d566704905a7932744bea1c2ff_女_Tops10_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/fad8f18fdc7f4728ba268d2e3e923e59_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3456"
    },
    {
        "id": "98",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/04b17db7c60c4ef7a09112df13bb70ec_女_Dress10_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/ffb3433ea14f4202b0c8523789517f7f_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3340"
    },
    {
        "id": "171",
        "style": "Wedding",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/4931cc5f2e16490db38c8a37db782f40_女_Wedding03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/cdb66a7f4c5a48739791def97670b658_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2457"
    },
    {
        "id": "86",
        "style": "Business",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/5edf68c2b17b48768cddf94dcf83e395_女_Business03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/9470e269dbce4d5a83401f834ff7f7bc_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3373"
    },
    {
        "id": "9",
        "style": "Daily",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F1-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "848"
    },
    {
        "id": "10",
        "style": "Daily",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F2-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4049"
    },
    {
        "id": "11",
        "style": "Daily",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F3-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3510"
    },
    {
        "id": "12",
        "style": "Daily",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F4-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1445"
    },
    {
        "id": "13",
        "style": "Daily",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F5-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2910"
    },
    {
        "id": "14",
        "style": "Daily",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F6-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1539"
    },
    {
        "id": "18",
        "style": "Daily",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F1-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "8876"
    },
    {
        "id": "19",
        "style": "Daily",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F2-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3110"
    },
    {
        "id": "20",
        "style": "Daily",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F3-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3757"
    },
    {
        "id": "21",
        "style": "Daily",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F4-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3557"
    },
    {
        "id": "22",
        "style": "Daily",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F5-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "7111"
    },
    {
        "id": "23",
        "style": "Daily",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F6-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "11879"
    },
    {
        "id": "24",
        "style": "Daily",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F7-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2813"
    },
    {
        "id": "25",
        "style": "Daily",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F8-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1596"
    },
    {
        "id": "26",
        "style": "Daily",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdaily%2F9-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "5438"
    },
    {
        "id": "34",
        "style": "Festival",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Ffestival%2F1-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1187"
    },
    {
        "id": "35",
        "style": "Festival",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Ffestival%2F2-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1941"
    },
    {
        "id": "36",
        "style": "Festival",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Ffestival%2F3-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "9010"
    },
    {
        "id": "37",
        "style": "Festival",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Ffestival%2F4-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "6284"
    },
    {
        "id": "38",
        "style": "Festival",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Ffestival%2F1-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "467"
    },
    {
        "id": "39",
        "style": "Festival",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Ffestival%2F2-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "216"
    },
    {
        "id": "40",
        "style": "Festival",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Ffestival%2F3-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "518"
    },
    {
        "id": "41",
        "style": "Festival",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Ffestival%2F4-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1187"
    },
    {
        "id": "42",
        "style": "Festival",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Ffestival%2F5-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1310"
    },
    {
        "id": "43",
        "style": "K-pop",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fk-pop%2F1-ub-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4254"
    },
    {
        "id": "44",
        "style": "K-pop",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fk-pop%2F2-ub-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1611"
    },
    {
        "id": "45",
        "style": "K-pop",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fk-pop%2F3-ub-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1285"
    },
    {
        "id": "46",
        "style": "K-pop",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fk-pop%2F4-ub-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4812"
    },
    {
        "id": "47",
        "style": "K-pop",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fk-pop%2F5-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1872"
    },
    {
        "id": "48",
        "style": "K-pop",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fk-pop%2F6-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3908"
    },
    {
        "id": "49",
        "style": "K-pop",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fk-pop%2F1-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "756"
    },
    {
        "id": "50",
        "style": "K-pop",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fk-pop%2F2-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1928"
    },
    {
        "id": "51",
        "style": "K-pop",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fk-pop%2F3-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "439"
    },
    {
        "id": "52",
        "style": "K-pop",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fk-pop%2F4-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "316"
    },
    {
        "id": "80",
        "style": "Business",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/bc0646a4d2b740299b5091c052a110dc_男_Business03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/3cf0c25d84754339970c006aa14e8b70_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "16057"
    },
    {
        "id": "72",
        "style": "Beachwear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/d3230994e5cf43098fa0b4c274f24780_女_Beachwear02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/d7bc652903364851b2947c6315939302_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "132615"
    },
    {
        "id": "82",
        "style": "Business",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c7856c03d78d44fba1849b3734beccd2_男_Business02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/2dae11e75ed942029cda612263e264e7_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4653"
    },
    {
        "id": "85",
        "style": "Business",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c5ddf11935094df69e18bc6fd1222b14_女_Business04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/ed9c33cc373747a0a791176d17cb008a_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "9847"
    },
    {
        "id": "173",
        "style": "Wedding",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/878919499f5d47d5a3277b54da343761_女_Wedding05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/6c3a901557d14ed49cf7e108993599dd_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3884"
    },
    {
        "id": "175",
        "style": "Wedding",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/9e11051d86d34893bb7c2e07282a4735_男_Wedding01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/ea3476c229134b1fb2878dd1bd7d87cb_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "5608"
    },
    {
        "id": "170",
        "style": "Wedding",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/88909f9f3311415ebf395f6a0347e80b_女_Wedding02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/47fdaf95e32e4c189a9da3d34c576aa6_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3501"
    },
    {
        "id": "176",
        "style": "Wedding",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/03eaec0efd304067802e779a0882f941_男_Wedding02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/8729d88072274ff985f425b75e6f5df7_男模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "21281"
    },
    {
        "id": "1",
        "style": "Business",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fbusiness%2F1-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2109"
    },
    {
        "id": "2",
        "style": "Business",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fbusiness%2F2-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "8437"
    },
    {
        "id": "3",
        "style": "Business",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fbusiness%2F3-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "9083"
    },
    {
        "id": "4",
        "style": "Business",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fbusiness%2F4-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2917"
    },
    {
        "id": "5",
        "style": "Business",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fbusiness%2F1-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1584"
    },
    {
        "id": "6",
        "style": "Business",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fbusiness%2F2-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "6340"
    },
    {
        "id": "7",
        "style": "Business",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fbusiness%2F3-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2113"
    },
    {
        "id": "53",
        "style": "Wedding",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fwedding%2F1-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1104"
    },
    {
        "id": "60",
        "style": "Wedding",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fwedding%2F3-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2386"
    },
    {
        "id": "61",
        "style": "Wedding",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fwedding%2F4-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2211"
    },
    {
        "id": "64",
        "style": "Beachwear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/17ecfffa2bc244fc8f0c5cc15e4665b3_男_Beachwear01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0dd5f8d04282475d98fa14ae592a4316_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2868"
    },
    {
        "id": "65",
        "style": "Beachwear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/8526af947b06486195feefe9e953c330_男_Beachwear02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/72abc47a1514435497df37deaddc2d66_男模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "11171"
    },
    {
        "id": "67",
        "style": "Beachwear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/e6cf565debf04d77a6b194f54608575f_男_Beachwear04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/4bad75170dde40a493d823e69b2886d6_男模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "10912"
    },
    {
        "id": "71",
        "style": "Beachwear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/d586f8267ff74358a53267c5ebcabbfb_女_Beachwear01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/e5ecbf151bc443108278ae4d14a5e45d_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "7830"
    },
    {
        "id": "73",
        "style": "Beachwear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/60960d99258c40f4a10300f74aa8b340_女_Beachwear03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/968d3b5f814a455ba13471ac265bb2ee_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "61966"
    },
    {
        "id": "75",
        "style": "Beachwear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/247e22de32db407dbba98150e55695c2_女_Beachwear05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/af1c38ec964749609dbaf90aa087b16c_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "17322"
    },
    {
        "id": "76",
        "style": "Beachwear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/871fa23b6794407ea3a589b0426fc8af_女_Beachwear06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/92732ac67bdc4a88824acdd8518361bd_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "9978"
    },
    {
        "id": "77",
        "style": "Business",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/74ca8d04ff0845b4aa6869c79b6040d8_男_Business05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/81d9ea4db958491ea0b0a61ca84a879b_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3433"
    },
    {
        "id": "79",
        "style": "Business",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0a15a046bb8643d981e239532a3980d5_男_Business04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/9e0b92b5dca540409ae148ace99c1e8c_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "12105"
    },
    {
        "id": "81",
        "style": "Business",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/76594b76cb424fe0bee5912743fc4410_男_Business01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/dc448a8be8884a9580546f59f384c009_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "8337"
    },
    {
        "id": "83",
        "style": "Business",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/f95674b95db54cc288ae7cdeb3bf806d_女_Business05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c5c7008123cd48d0a4a72771784df6e7_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1793"
    },
    {
        "id": "84",
        "style": "Business",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/97d26780cbc6435aa672c8612bfc0d28_女_Business06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/64d021e7757749189f61b568dde58d9e_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1835"
    },
    {
        "id": "87",
        "style": "Business",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/e9ac90848eee40d9941d608b3c13b839_女_Business01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/b761ec7f700546a1ab5a4973632c9389_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2472"
    },
    {
        "id": "88",
        "style": "Business",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/bf19463c4c8c4f0a9e39f154a98dd402_女_Business02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/a00bb52a9fae484cbd7d1728a8e44127_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1768"
    },
    {
        "id": "89",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/cd44df910eba47068c94dc77759d658b_女_Dress01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/80a4e3049a6c408a9dfb0faad926ab3a_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4590"
    },
    {
        "id": "90",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/5b2d8b287c454441befa57fc52cca081_女_Dress02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/e3918b2c2ade4918b0fbb8bbf2f58c12_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "8699"
    },
    {
        "id": "91",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/94e59066cd17459f946b5d1cc19af9c6_女_Dress03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0f374f86ae1f455aa522d23fa25eaa07_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4452"
    },
    {
        "id": "92",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/767a4c315c2048d58efc9d076dbaa72e_女_Dress04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/50c35c4254e1461f952584f088e635b9_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "8814"
    },
    {
        "id": "93",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/145a0ad409004abf9c0da253be36614d_女_Dress05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/945b7c32fb2f4ea28bca6e733e274bf1_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "5795"
    },
    {
        "id": "94",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/dda76ec81b1649a4a75d196b52ecaaaf_女_Dress06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/f3ec02a001c844eb97c7d8d3a5135e93_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3954"
    },
    {
        "id": "95",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/a768e6075ad7471b876cdc5e0b0c7899_女_Dress07_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/193b5ba1a41f459a80f7eaa3870c751d_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "6799"
    },
    {
        "id": "96",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/6e04b38051f341dbb756c0be6eba6542_女_Dress08_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/dcd5168e637f4c298ba18b34458e17c8_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4519"
    },
    {
        "id": "97",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/8f51eecc3a194deba93cc0daa39fca00_女_Dress09_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/81feac242fd84d0a99f2d4c6f1112ceb_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1218"
    },
    {
        "id": "99",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/06dec04ebd144d97816dc4f23a488c9d_女_Dress11_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/1bab2a0e39b245539e9b0cc7d67fe71e_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1027"
    },
    {
        "id": "100",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0e49cc1eb4d54d93ade682264905dfc0_女_Dress12_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/fd6171f47840465a87d24184edb5d0a0_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1335"
    },
    {
        "id": "101",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/31eca8b14a7c437b910a54db6c069a5a_女_Dress13_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/90b4a634cbc64ddfb8ea87c3b54b190a_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2120"
    },
    {
        "id": "102",
        "style": "Gothics",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/8b99eceb5c7a4b1ba24a1dacd27085cf_男_Gothics01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/59a36b55c3de4dd69ad7e96ac2b5e6f5_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1394"
    },
    {
        "id": "103",
        "style": "Gothics",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/1bb4f971f3cd45d1a9bd84f240baeac8_男_Gothics03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/f0fe7369b8744885aea628a64f9b5532_男模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "12341"
    },
    {
        "id": "104",
        "style": "Gothics",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/a7d9ed24885246c699ab548075c7137f_男_Gothics02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/2403af8dacf6456e8a14b20134b1e254_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "942"
    },
    {
        "id": "105",
        "style": "Gothics",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/3a04c275c2e04a36a38b6eba8624a3f8_男_Gothics04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/9d73655c5364460897ffc6321a5d9d50_男模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "4769"
    },
    {
        "id": "106",
        "style": "Gothics",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/34b9eb0a101d46cd8c28cfbdf5febadd_男_Gothics05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/fc2e25462f47469fbcbaee598d13d959_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1696"
    },
    {
        "id": "107",
        "style": "Gothics",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/2f65d90f74d0447db28af52d7980480c_男_Gothics06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0f7d35f90d78453b848d1b5cbe954558_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1533"
    },
    {
        "id": "108",
        "style": "Gothics",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/3a174d3fa8074551b24c53c947e4d45b.png",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/c8d9cfa558d5419a81286ad2d35c952a.png",
        "hot": false,
        "showFirst": false,
        "usageCount": "4782"
    },
    {
        "id": "109",
        "style": "Gothics",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/b7fb64c5d859464fa33943780a521a8e.png",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/9f80891fc54845cdbff9b7e86c18f966.png",
        "hot": false,
        "showFirst": false,
        "usageCount": "2990"
    },
    {
        "id": "111",
        "style": "Gothics",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/c3e691e87c5b4de299b6540b558d33fd.png",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/ac19fc78a2724137826854d6bb83f343.png",
        "hot": true,
        "showFirst": false,
        "usageCount": "4099"
    },
    {
        "id": "112",
        "style": "Gothics",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/94dc321926cf425b8f7db52c8a69b0a3.png",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/c84f3fc5977c4d09bf5c826cfd8afe09.png",
        "hot": true,
        "showFirst": false,
        "usageCount": "2948"
    },
    {
        "id": "113",
        "style": "Gothics",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/390119c0988c43c9bb15fbeb898b981f.png",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/501a6a4c22f44081b8aa12698455ff8d.png",
        "hot": true,
        "showFirst": false,
        "usageCount": "3731"
    },
    {
        "id": "118",
        "style": "Him",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/606db5f34e1340c19fbb4b84dd2a9613_男_Him02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/147dab1b97cb45bb8ad72d5bf9110ea5_男模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "16654"
    },
    {
        "id": "119",
        "style": "Him",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/732b0e21d52c47acb4ec9a628451107b_男_Him03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/d362466caced44d4823b92c2c0064657_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2829"
    },
    {
        "id": "120",
        "style": "Him",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/dd010ef3a24c4d26a8e7d0a211394134_男_Him04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/143d717bf3914fff90be620997870753_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2146"
    },
    {
        "id": "121",
        "style": "Him",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0096895421bc44fc825160025f10ae39_男_Him05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/7e8b40ed41cc4684a0789882ba9d0e70_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "7700"
    },
    {
        "id": "122",
        "style": "Him",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0a18af177f404cb290403a8ff0e9f08b_男_Him06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/41a83b8df41e49618a9b2a2b5a1f92f0_男模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "21779"
    },
    {
        "id": "123",
        "style": "Him",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/59d3e8f6405f4257b3222ab5d69cae32_男_Him07_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/a81095b2119b4b71b036a669dca9a5a7_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "9794"
    },
    {
        "id": "124",
        "style": "Him",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/7aa33b18fa2e416a9e506e189d6355b7_男_Him08_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/45125036d3484e88a2b2ef82f7d659dd_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1184"
    },
    {
        "id": "125",
        "style": "Hippie",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/de69ff2c495340a39453ae64b10fb3a7_男_Hippie01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/49078ef92f8645989562d14825b9fb4d_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "732"
    },
    {
        "id": "126",
        "style": "Hippie",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/e4c5cd08dc1f490785b820c26e3c203e_男_Hippie02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/7ee68dd0c3c44100ab9dfd348cfe478c_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "284"
    },
    {
        "id": "127",
        "style": "Hippie",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/56f019300fae49ec9fca70045b75a326_男_Hippie03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/da7c922c3e644770aa875755ffd40970_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1112"
    },
    {
        "id": "128",
        "style": "Hippie",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/34864704fc7b43ffb688a3db500664dd_男_Hippie04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/724851ed231b470aa3f147214882cf3d_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "709"
    },
    {
        "id": "129",
        "style": "Hippie",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/4823525129e94ce7a23afd27bff6bfee_男_Hippie05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/685ba51c8fd24aca8431c513cf1f6372_男模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "3711"
    },
    {
        "id": "130",
        "style": "Hippie",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/aca173f01f924f7e82a7dcace3a2a7f7_男_Hippie06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c3656c170d6245279b211616e98afedf_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1139"
    },
    {
        "id": "131",
        "style": "Hippie",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/3f95f751003743a28ee42b66e9c5cdd8_男_Hippie07_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/4d35a2fc53b8436dac40d5c51a4d7f61_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1156"
    },
    {
        "id": "132",
        "style": "Hippie",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/8c0155f106834dbdbc6ef775bff8697e_男_Hippie08_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/6e1def1f4a4f474892f82341579e1b5f_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "960"
    },
    {
        "id": "135",
        "style": "Hippie",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/db8edba113df4263a5a8f7ff239df2f3_女_Hippie03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/4add798469e241cf926e13017e8fc3de_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2818"
    },
    {
        "id": "136",
        "style": "Hippie",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/eae728c0e1b34ba79da26af96af8c73a_女_Hippie04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/827819474ce948b2bf683f22eb2fea42_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "7946"
    },
    {
        "id": "137",
        "style": "Hippie",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c81913b5a01949c69bf71775987c97af_女_Hippie05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/9c6cd924a8b043069d5dbff0b0dfbd97_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "5184"
    },
    {
        "id": "138",
        "style": "Hippie",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/ee10cedba0684a2da8093eca1552e0a7_女_Hippie06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/dd4641a7658a4a88abf03f6615eee739_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "5351"
    },
    {
        "id": "139",
        "style": "Partywear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/970e653fa51b42a08631381dce25a882_女_Partywear01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c689c581311b46648ad28735f14dd1db_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "29865"
    },
    {
        "id": "140",
        "style": "Partywear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/62b7c55ae13941edaf13e631a838ad1e_女_Partywear02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/8933e089dffd4554b40cb8b42a7566f2_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4486"
    },
    {
        "id": "141",
        "style": "Partywear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/8d971064945d4681af59688442c75829_女_Partywear03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/101cabb0964643cdbee74d2c98b38097_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "6845"
    },
    {
        "id": "142",
        "style": "Partywear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/e8550d7dac1649eb8edcaf3334f66cd6_女_Partywear04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/5a5a10a759bd425cbdf1399295d81bd5_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "24488"
    },
    {
        "id": "143",
        "style": "Partywear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/d42bb83c443f4fd184249071c7c9ad41_女_Partywear05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/272302e5cfb7439fbb56d0d8ab9e0df8_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1736"
    },
    {
        "id": "144",
        "style": "Partywear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/f523003606ba4643a1bd8c27a4b82cf0_女_Partywear06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/ec71649b71d64a26bcfd4e36aab6fc3d_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4158"
    },
    {
        "id": "148",
        "style": "Sportswear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/365f24091db94b3f8a36ddef8d613e61_女_Sportswear02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/09ff53e5ad504a0ba5062e83cfc03341_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "8280"
    },
    {
        "id": "149",
        "style": "Sportswear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/d5f4eccad94f4355ab031efd73a33814_女_Sportswear03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/e0c0335af825436799d0b1ae781598cd_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "15708"
    },
    {
        "id": "150",
        "style": "Sportswear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c9ab84e9e9744b31a752bd90bf5bc620_女_Sportswear04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/b4414f61617b4748a9c6381148b05997_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "14688"
    },
    {
        "id": "151",
        "style": "Sportswear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c9b4b4e0a09a47c08c5bc3069b43d56d_女_Sportswear05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c68edbf2910b439bbcc52e075d894856_女模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "15786"
    },
    {
        "id": "152",
        "style": "Sportswear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/be82cb2db7cc46dbaac7773c019ed09f_女_Sportswear06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/fe09cd49152f40e6a9ed38e5fcecc6c4_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3617"
    },
    {
        "id": "153",
        "style": "Sportswear",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/5b0337d06f7046848202ca57c57514ca_女_Sportswear07_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/3d017abbcb0a4890a6d93bf8cbf88318_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "5772"
    },
    {
        "id": "154",
        "style": "Sportswear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/e6cec85f703a4b9584db769ad31c1c55_男_Sportswear01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/63b82892b83a40ed802bc7716011a1c0_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "5086"
    },
    {
        "id": "155",
        "style": "Sportswear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/2184ab2872334211bd26078d559bf808_男_Sportswear02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/27bd6629a9df428db49481a656d7ca37_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1843"
    },
    {
        "id": "156",
        "style": "Sportswear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/3ddeb1ca758344a5ab303107dbc4f7d6_男_Sportswear03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/509da147a09a4c08963d6e15982ca7b6_男模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "7606"
    },
    {
        "id": "157",
        "style": "Sportswear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/b5fc4f1531fd44259237130bd0a977bb_男_Sportswear04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/98861db459e24a77b895ad5abed10265_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "7613"
    },
    {
        "id": "158",
        "style": "Tops",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/d9db296054e649ea94a1d2f0735f2ee0_女_Tops01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/e81184d4602c4874b0930c4cbae9c966_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3244"
    },
    {
        "id": "159",
        "style": "Tops",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/965b3988e9f74b64b78f777ae40574b7_女_Tops02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/4baa4112051d41fca7841fe04f5bb0cd_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "10547"
    },
    {
        "id": "160",
        "style": "Tops",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/8dc7351d56f14f70967c14f86fb8a510_女_Tops03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/edb19dc8e20f4bb7821f77e5a10e3341_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2232"
    },
    {
        "id": "161",
        "style": "Tops",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/04cfe5de30ab4f94a38f0a8b2a941c3f_女_Tops04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/926b469b289e41c9a5ae1ae7de6d687c_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3164"
    },
    {
        "id": "162",
        "style": "Tops",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/3725eb4a3fe44ceabf597b6460ff7be5_女_Tops05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/69f1080ab74e45ec843b06943e2dd28c_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1567"
    },
    {
        "id": "163",
        "style": "Tops",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/765e78b198e94766aa290b5d725fcdec_女_Tops06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0ed68a97cff64f8e8e8e47e278944049_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2581"
    },
    {
        "id": "164",
        "style": "Tops",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/cda9d57d6bc94c22a2a032c4c9bd729e_女_Tops07_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/e4cad527510a4ab0989e9294139bc2ef_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "5707"
    },
    {
        "id": "165",
        "style": "Tops",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0c237474386d40cbb3b8f77dd592ca1c_女_Tops08_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/d9e11652220b40e7b4eef0cc54b18024_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3158"
    },
    {
        "id": "166",
        "style": "Tops",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0cb112d698ff49048e00d8fed91d2f90_女_Tops09_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c613895bcefd43019ce0974aa32302ed_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2057"
    },
    {
        "id": "168",
        "style": "Tops",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/d987896208284bbcbe899e8006a91608_女_Tops11_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/32eb81e9f23947c3a7906a690c5839c8_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1937"
    },
    {
        "id": "169",
        "style": "Wedding",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c15799cdb1d94e7c85c4f537c84e2cc0_女_Wedding01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/936de08fcfcb4cd2b4b51eeb976a61f2_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "735"
    },
    {
        "id": "172",
        "style": "Wedding",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/8a791e3a859d4894af60e7f1329b3188_女_Wedding04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/5ba2b94b023a4b748587502f09cdd0ae_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4411"
    },
    {
        "id": "174",
        "style": "Wedding",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/71f7366fd89a4200ad575a90f6b5a000_女_Wedding06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/b885562d70c948e2b04648061ac44190_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1457"
    },
    {
        "id": "177",
        "style": "Y3K",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/25ddc454ec6d45e1870edbe9c4fac177_男_Y3K02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/962a2e0d8b5e482c9ff58015599bb417_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1734"
    },
    {
        "id": "178",
        "style": "Y3K",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/880fa67a8800497a8d3b24cdd0c68584_男_Y3K04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0a1c200bdbfa446c932fd01e504c3d4c_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "745"
    },
    {
        "id": "179",
        "style": "Y3K",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/295689583c8247d698f0b027a16b811a_男_Y3K07_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/4f7674b9d2d447f39efa50aeadae65d4_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "368"
    },
    {
        "id": "180",
        "style": "Y3K",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/d121a7e97c42468e97e0cc0a1707b58a_男_Y3K05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/b99c1b5f14c4415586eab14a40fc90cf_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1387"
    },
    {
        "id": "182",
        "style": "Y3K",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/3932c38bc87446a68e8171ec948b4455_男_Y3K03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/6892d3ce440e4a388b4a6c520a1502ca_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1328"
    },
    {
        "id": "183",
        "style": "Y3K",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/acff7b9b8e344d648b95a31b618fbcd8_男_Y3K01_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c4e9bf69e9dc4ec296f962acf13a09fa_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "351"
    },
    {
        "id": "185",
        "style": "Y3K",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c38845fdf20542d39136dc2ba9077793_女_Y3K02_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/92541843fff14c14bf65640b3d05d118_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1033"
    },
    {
        "id": "186",
        "style": "Y3K",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/5f27d050b582405685c07672a92590ae_女_Y3K03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/948646c090e94aacba813b1408eac420_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3684"
    },
    {
        "id": "187",
        "style": "Y3K",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/b9c061145e2c43dfb79c9d5d42c13767_女_Y3K04_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/4135c1872e6e45528bfe903b1425c44f_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4213"
    },
    {
        "id": "190",
        "style": "Partywear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/1dbc306052f04423bfcbf9fc181ba7f7_男_Partywear06-1.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3623"
    },
    {
        "id": "191",
        "style": "Partywear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/efca9ab310154c1f9034c5b59dca01b9_男_Partywear02.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2983"
    },
    {
        "id": "192",
        "style": "Partywear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/632965f10f994c31bbe60aa776c086bc_男_Partywear04.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2237"
    },
    {
        "id": "193",
        "style": "Partywear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/8d2da3ba5bd046568d208b94e1f8bd63_男_Partywear05.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2255"
    },
    {
        "id": "194",
        "style": "Partywear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/c6f0984010894729890c17ddadf94247_男_Partywear03.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1493"
    },
    {
        "id": "196",
        "style": "Business",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/fe5fac06aed44293a592ee79fbbaf55e_男_Business06.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1284"
    },
    {
        "id": "66",
        "style": "Beachwear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/f715142ea8d04a60924fdb819fa02159_男_Beachwear03_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/426ef8a99c2a4509a56335d0ac166859_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1910"
    },
    {
        "id": "68",
        "style": "Beachwear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/0a16c08a5403453d949cc96ff6bf5f95_男_Beachwear05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/d89a88b2037e434ea27e7d0252db32cd_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1610"
    },
    {
        "id": "70",
        "style": "Beachwear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/9b638477311a4716af4dde988a2f225c_男_Beachwear07_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/ebd721ab15f14265bef7076937f0398d_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2087"
    },
    {
        "id": "69",
        "style": "Beachwear",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/9e3b7c80a6654caaadc5d0b125dc7b91_男_Beachwear06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/9755715cf38e48c1a9ffc89b1738515f_男模特.webp",
        "hot": true,
        "showFirst": false,
        "usageCount": "12250"
    },
    {
        "id": "188",
        "style": "Y3K",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/86da6844136f4ce7b25d0fd1d47abf7c_女_Y3K05_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/dcb64f11f67747fbadc1c05f7710d2f4_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "883"
    },
    {
        "id": "189",
        "style": "Y3K",
        "gender": "Woman",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/623b0210f26942978f27c5a6e24b7a74_女_Y3K06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/278589cfbc9b4257b71f248c3e18db9f_女模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "4969"
    },
    {
        "id": "181",
        "style": "Y3K",
        "gender": "Man",
        "displayUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/80d0275773154a509711ceb48a0e89b5_男_Y3K06_1x.webp",
        "beforeUrl": "https://static.aiease.ai/aieaseExample/aiWardrobe/f2f1e71205254eefbc1ecbdfd6f82d2b_男模特.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "464"
    },
    {
        "id": "27",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdress%2F1-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1214"
    },
    {
        "id": "28",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdress%2F2-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "991"
    },
    {
        "id": "29",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdress%2F3-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1189"
    },
    {
        "id": "30",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdress%2F4-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "592"
    },
    {
        "id": "31",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdress%2F5-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "3195"
    },
    {
        "id": "32",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdress%2F6-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1092"
    },
    {
        "id": "33",
        "style": "Dress",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fdress%2F7-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2973"
    },
    {
        "id": "54",
        "style": "Wedding",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fwedding%2F2-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "671"
    },
    {
        "id": "55",
        "style": "Wedding",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fwedding%2F3-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "821"
    },
    {
        "id": "56",
        "style": "Wedding",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fwedding%2F4-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1586"
    },
    {
        "id": "57",
        "style": "Wedding",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fwedding%2F5-dress-f.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-f.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "1966"
    },
    {
        "id": "59",
        "style": "Wedding",
        "gender": "Man",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fwedding%2F2-dress-m.webp",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample%2FaiWardrobe%2Fmodel-m.webp",
        "hot": false,
        "showFirst": false,
        "usageCount": "2653"
    },
    {
        "id": "116",
        "style": "Gothics",
        "gender": "Woman",
        "displayUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/e21ab46b49f24afb8b17c448291fd8ea.png",
        "beforeUrl": "https://pub-static.aiease.ai/aieaseExample/aiWardrobe/516e13309fa44b56b7b171ac225119e3.png",
        "hot": true,
        "showFirst": false,
        "usageCount": "10354"
    }
  ];
}
