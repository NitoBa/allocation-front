import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String get baseUrl => env['BASE_URL'] ?? "";
  static Map<String, String> get avatarUsers => {
        "Bruno Alves":
            "https://cdn.discordapp.com/avatars/287257435830353922/83c0e4c7831bac03f128826a315b907a.png?size=128",
        "Fabiano Santana":
            "https://cdn.discordapp.com/avatars/373874655334760458/e6be08b37d0369f7e54c6b1d99cf33ff.png?size=128",
        "Lucas Machado":
            "https://cdn.discordapp.com/avatars/173826954087104512/17651d5c4be5e85b7c89ed5e4ca6fc3b.png?size=128",
        "Renee Vella":
            "https://cdn.discordapp.com/avatars/788044070801899541/014d5a3498302ec242cb31a3233047c7.png?size=128",
        "Alexandre Tolstenko":
            "https://cdn.discordapp.com/avatars/288037716157923329/bc83ff2fb5887cabed2310db7e901f6d.png?size=128",
        "Guilherme Simeao":
            "https://discord.com/assets/1f0bfc0865d324c2587920a7d80c609b.png",
        "Dan Almeida":
            "https://cdn.discordapp.com/avatars/675320726185705513/3d9cc958c52ccb3e6399decce4b1a445.png?size=128",
        "Camille Hughes":
            "https://cdn.discordapp.com/avatars/239149135519809536/fefc2d6154246becfaa05c815c4a98c4.png?size=128",
        "Thiago Ataide":
            "https://cdn.discordapp.com/avatars/227975163369619456/b0ad97c59c101aa17fa2a815beed9402.png?size=128",
        "Taigo":
            "https://cdn.discordapp.com/avatars/227975163369619456/b0ad97c59c101aa17fa2a815beed9402.png?size=128",
        "Luciano Lemgruber":
            "https://cdn.discordapp.com/avatars/125180222306910208/de888cd5836e6b374ae290cea3180773.png?size=128",
        "Sywrah Gabriella":
            "https://cdn.discordapp.com/avatars/383062725254709248/58b544f03c9145963c7af86c18b314ab.png?size=128",
        "Germano Gomes":
            "https://discord.com/assets/1f0bfc0865d324c2587920a7d80c609b.png",
      };

  static String get avatarUrlGeneric =>
      "https://discord.com/assets/1f0bfc0865d324c2587920a7d80c609b.png";
  static List<String> get devs => [
        "Bruno Alves",
        "Fabiano Santana",
        "Lucas Machado",
        "Renee Vella",
        "Alexandre Tolstenko",
        "Guilherme Simeao",
        "Dan Almeida",
        "Camille Hughes",
        "Thiago Ataide",
        "Luciano Lemgruber",
        "Sywrah Gabriella",
        "Germano Gomes",
      ];

  static List<String> get projects => [
        "Artbit",
        "GPS",
        "Viralcure",
        "Kiron",
        "Mabloc",
        "BBS",
        "Management",
        "SthormSite",
        "Node",
        "SemeieAIdeia"
      ];

  static List<String> get hours => [
        "1 horas",
        "2 horas",
        "3 horas",
        "4 horas",
        "5 horas",
        "6 horas",
        "7 horas",
        "8 horas",
      ];
}
