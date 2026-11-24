# News App

A Flutter app that shows news headlines and local weather from public APIs.

## Features
- Top headlines by category (NewsAPI `top-headlines`)
- Explore and search articles (NewsAPI `everything`, with sorting)
- Weather screen using OpenWeatherMap current weather by latitude and longitude
- Splash and start screens

## Tech stack
Flutter, Dart, flutter_bloc (Cubit), Dio, Dartz, flutter_screenutil, flutter_svg, intl

## Run it
1. Get your own API keys from [NewsAPI](https://newsapi.org) and [OpenWeatherMap](https://openweathermap.org/api).
2. Copy `env.example.json` to `env.json` and fill in the keys. `env.json` is git-ignored.
3. Run:
```
flutter pub get
flutter run --dart-define-from-file=env.json
```
