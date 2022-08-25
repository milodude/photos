# Photos Unsplash - API_Integration
Challenge made in Flutter

## ===== Dev Instructions =====

1. Clone the repo
2. In the command line run
     ```
     flutter pub get.
     ```
3. Open an emulator. Youcan use either flutter's, android studio's or your own cellphone connected to the pc
4. In the command line run, 
    ```
    flutter run
    ```
5. If you want a faster run of the application you may run it in the web browser by executing the next command line,
    ```
    flutter run -d chrome
    ```
5. The application will build and install in your emulator, web browser or device. Remember if you have more than one connected the user interface will ask you to choose one.
6. Enjoy it!


## ===== Inside the app, main functionalities =====

Once the app is up and running you will get to the landing page directly where it will display photographs that are available at unsplash site through their API. Clicking in any of the photos will lead you to the photograph details.
 
In the photograph details page you will see the photograph in full length an will show you the user who took that picture, his profile name and a section called 'view more' which will send you to the user's profile.

At the user's prfile page you will see his profile image along his bio or profile description. Below that you will be able to see all o f the photographs that user uploaded to the platform. You can always click in any of the photos and it wll pop up a modal sheet with a carousel in it displaying all photographs in the same place without the need of scrolling up or down.

Each time you want to go back, you may click in the upper left icon(a circled cross).

## ===== Good practices =====
Here I'm listing all the good practices used in this project in order to facilitate an example for developers on how to implement certain functionalities in a Flutter application. If they helped you with your own project do not forget to upvote(star) the repo, will mean a lot to me!  

1. BLOC pattern
2. Flutter_modular to manage routing. This also gives you the ability to apply beautiful transitions.
3. Testing.
4. DI using get_it package
5. API integration
6. Constants usage to avoid magic strings
7. Clean aruitecture by Uncle Bob(feature based)