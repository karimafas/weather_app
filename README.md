# weather_app

A Flutter app to view the weather in a number of UK cities.

### Setup ⚙️

There are a few steps to follow before being able to compile the app:

1. I built the app using Flutter version 3.13.2, so make sure use this version too in order to compile without errors.
2. Create an .env file in the `assets/env` directory, then add the `SPACE_DEVS_TOKEN` variable with the value indicated in the README.md at the top level of the project. This will allow you to perform > 15 requests per hour to the Space Devs server.

### Features 🚀

- View the weather in a range of UK cities.
- Tap on a city to expand it and view more weather forecast details.
- Back on the initial screen, tap on the button on the bottom-right of the screen to change the app colour theme.

### Architecture and design 🏛️

I used BloC as the state management solution for this app.

I decided to use a partially modularised design, abstracting the repository which performs data fetching into its own Dart package. This ensures good separation of concerns, and also will make it easier in future to swap the data provider with a different API while minimising drastic changes to the main application code.
As a result of this decision, some other services which are shared between the app and the external packages have been abstracted into their own packages (http_service, logger_service).

The app's folder structure is quite straightforward, with reusable files in the `common` folder, and feature-specific files in the `features` folder. Each feature is split into `view` and `bloc` folders to contain UI and business logic.

I made use of dependency injection using the `get_it` package. Every single service is instantiated as a singleton at startup, and then injected into classes where required. This made testing a breeze, and ensured a consistent and reliable way to access services throughout the app.

I implemented a strict analysis_options file, similar to the one in the official Flutter repo, to ensure high coding standards and consistency across the project.

### Testing 🧪

The app features plenty of unit and widget tests. Packages have their own tests too.

To run tests, go to the desired folder and execute:

```sh
flutter test
```