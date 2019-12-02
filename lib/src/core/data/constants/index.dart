library tyba.core.data.constants;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part './view_state.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final Firestore db = Firestore.instance;
final String appIcons = 'https://b.zmtcdn.com/images/search_tokens/app_icons/';

final recommendedCities = [
  {
    "id": 290,
    "name": "New Orleans, LA",
    "country_name": "United States",
    "country_flag_url":
        "https://b.zmtcdn.com/images/countries/flags/country_216.png",
  },
  {
    "id": 280,
    "name": "New York City, NY",
    "country_name": "United States",
    "country_flag_url":
        "https://b.zmtcdn.com/images/countries/flags/country_216.png",
  },
  {
    "id": 291,
    "name": "Miami, FL",
    "country_name": "United States",
    "country_flag_url":
        "https://b.zmtcdn.com/images/countries/flags/country_216.png",
  },
  {
    "id": 289,
    "name": "Boston, MA",
    "country_name": "United States",
    "country_flag_url":
        "https://b.zmtcdn.com/images/countries/flags/country_216.png",
  },
  {
    "id": 6120,
    "name": "Mexico, ME",
    "country_name": "United States",
    "country_flag_url":
        "https://b.zmtcdn.com/images/countries/flags/country_216.png",
  }
];
