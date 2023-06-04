# Can You Hear Me
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-3-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

This app is a mobile application designed to help individuals and communities respond to natural disasters in a more organized and efficient manner. The app features five main components: account creation and information sharing, volunteer work, donation system, mapping function, and a watch version of the app with additional features.
# The Sustainable Development Goals
 The Sustainable Development Goals, also known as the Global Goals, are a set of 17 goals established by the United Nations in 2015 to promote sustainable development worldwide. These goals cover a range of topics including poverty, hunger, health, education, gender equality, clean water and sanitation, renewable energy, economic growth, infrastructure, and climate action. Google has committed to supporting the Sustainable Development Goals by leveraging its technology, expertise, and resources to create positive impact around the world. Google works with partners across sectors to address these challenges and create scalable solutions that can help achieve the Sustainable Development Goals.

# Our Goal
<img align="right" src="https://user-images.githubusercontent.com/96688864/226203314-b9405886-cb64-4f4c-8530-415cf32cc957.png" width="180" height="180" />

Our app aligns with Goal 11 of the SDGs, which aims to make cities inclusive, safe, resilient and sustainable. Specifically, we aim to contribute to Target 11.5, which seeks to reduce the adverse effects of natural disasters. This target includes two sub-targets: 
* 11.5.1, which focuses on reducing the number of deaths and injuries caused by natural disasters
* 11.5.2, which aims to mitigate economic losses resulting from natural disasters. 

 
 
# The Meaning Of Our Logo
<img src="https://user-images.githubusercontent.com/124795286/225617516-224729d0-74d3-441b-b651-f0a9dc46fd22.png" width="400" height="400" />


Our team was deeply moved by the heartbreaking photo of the father holding his deceased daughter's hand under the rubble after the recent earthquake in Turkey. It served as a stark reminder of the devastating impact of natural disasters and the importance of taking steps to mitigate their effects. As a tribute to those affected by the earthquake, we chose to incorporate the image of a hand holding in our app logo. Our hope is that it will serve as a reminder of the importance of disaster preparedness and the need for greater efforts to promote safety and resilience in the face of natural disasters.

<img src="https://user-images.githubusercontent.com/124795286/225621788-9abfa25b-7fa4-45fa-9705-6279cc9170c4.png" width="600" height="400" />


# Technologies Used
* Flutter for cross-platform development of the user interface
* Firebase for backend development, including the Firestore database for storing user and location data
* Tensorflow and Tensorflow Lite for building and implementing artificial intelligence features
* Google Maps API for location data!
# Login Page
We have SOS button on our login page as well as on watch version of our app in case of emergency.
<p align="center">
<img width="250"  src="https://user-images.githubusercontent.com/124795286/225636416-aed159db-9f2e-4de4-8e15-d8511e69470e.png">
<img width="250"  src="https://user-images.githubusercontent.com/124795286/225636488-af772f8f-7ffb-4bb6-9602-28bf10ccf039.png">
</p>

# Main Page & Dynamic UI Structure
Our app has user-friendly interface, after you login our simple, easy to use main page will be open.
After the login process, our app is able to collect the current location of the user and compare it with the seismic zone, which is provided by our Firebase database.
When users open the app in an area affected by an earthquake, the "SOS" button takes precedence, providing quick access to emergency resources. On the other hand, if users are not in a seismic zone, the social media page takes center stage, facilitating communication and information sharing among users. To do that, we aim to ensure the utmost inclusivity and reach a larger audience in the event of disasters.

<p align="center">
<img width="250"  src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/7f3bcf4f-5a61-4173-9ceb-6c4fa98983c5.png">

<img width="250"  src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/e9921eaf-922f-445c-813a-dace8a548d3c.png">
</p>

As the home screen changes, so does the navigation bar, as you can see. As a result, this feature allow users to find what they need in our app comfortably.

# Features
* **Account Creation and Information Sharing:** Users can create an account and share crucial information, such as the location of a missing person, with the wider community. This facilitates the dissemination of vital information and supports organized rescue and recovery efforts.
<p align="center">
<img src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/e84d695b-33f2-4e31-b5a9-2d03e673b38d.png" width="250" />
<img width="250"  src="https://user-images.githubusercontent.com/124795286/225681847-4ceed3ce-7191-45c6-a56f-04c1cb596b21.png">
</p>

We have incorporated **language support** to cater to diverse language preferences. By offering multiple language options, we ensure that individuals from various linguistic backgrounds can easily navigate and engage with our app. This expansion of language support has significantly broadened the app's usability and made it more accessible to a wider user base. For now, our app supports *Turkish, English and Arabic* languages.

<p align="center">
<img width="250"  src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/d534efa6-e3e7-40db-867b-f097d134c97e.png">
<img width="250"  src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/ba500009-c106-46bf-b539-679653d46c9c.png">
<img width="250"  src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/5a03a34f-0cce-4719-b5c4-5045b35338a8.png">
</p>

According to the order of importance of the topic to be reported, only the location of the user is allowed to be shared in order to prevent possible fake sharing for the priority subject("debris building or need"). For other external subject/s ("missing person"), the user can select and report different locations on the map.

<p align="center">
<img width="250"  src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/79e5fd88-0e1b-4f8e-a25b-4098e388aa20.png">
<img width="250"  src="https://user-images.githubusercontent.com/124795286/225683098-78196717-260e-4fb3-bc0f-d0aafab9c98b.png">
</p>

* **Volunteer Work:** The app provides a platform for individuals to locate nearby opportunities for volunteer work. By enabling users to easily identify and participate in local volunteer work, the app encourages community involvement in disaster response efforts. This filter allows users to see other volunteer work in different cities.

<p align="center">
<img src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/9c5c86da-10f6-4dd8-b0ec-72ab07ba5a5b.gif" width="250" />
</p>


* **Donation System:** The app features a donation system that facilitates monetary donations and blood donations to organizations supporting earthquake relief efforts. 

<p align="center">
<img width="250"  src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/3ea0c757-5a99-4b83-8927-75e23b200932.png">
</p>


The AI system is designed to avoid issues observed in previous disaster relief efforts where donated items were not useful, such as the inclusion of cocktail dresses or high heels. 

<p align="center">
<img width="250"  src="https://user-images.githubusercontent.com/124795286/225634885-002bec6e-0063-4fea-9e3c-5b775b0b3b5e.png">
<img width="250"  src="https://user-images.githubusercontent.com/124795286/225634996-f12e502d-a0f8-4374-a9b6-0423772fd19a.png">
<img width="250"  src="https://user-images.githubusercontent.com/124795286/225635089-91b249ae-0987-49dd-bcd1-3e0b01294829.png">
</p>
After the box is ready, user can easily just call the authorized and the box will be taken from the address.

<p align="center">
<img src="https://user-images.githubusercontent.com/124795286/225635179-543dcaa7-d462-40a6-8774-3b5f3913deb4.png" width="250"  />
</p>
When an users wants to donate blood, our app shows the nearest locations. Since we do not have this data yet, the user is directed to the official website of Kızılay in order to increase the usability. The feature can be added to the interface by providing the data.

<p align="center">
<img src="https://user-images.githubusercontent.com/124795286/225626687-b4a0ed36-984e-4f00-9f71-49d95c638812.png" width="250"  />
</p>
Also we enabled users to donate money easily. 
Users can donate by sending an SMS if they wish. (Since we set our app to send sms to AFAD, users can actually donate. Be carefull and donate please :) )

<p align="center">
<img src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/283c9286-e25c-45a5-a849-3d5201bd70b7.png" width="250"  />
<img src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/04ed4206-ce0c-4038-bc2c-1bca042459ea.png" width="250"  />
</p>




* **Mapping Function:** The app includes a mapping function that allows users to identify buildings that have collapsed during the earthquake. By providing this information, the app supports the safety of individuals and emergency responders by indicating areas that should be avoided. This function is integrated with social media and functions by enabling users to select their location, which is subsequently marked on the map. This process is achieved automatically, allowing users to seamlessly share their location with others on the platform. 

<p align="center">
<img src="https://user-images.githubusercontent.com/124795286/225626943-38332c3e-9e36-479b-aa4d-f4ab2da26997.png" width="250" />
</p>

The green marks are places of shelters for earthquake victims.

<p align="center">
<img src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/1f3ecbad-6669-459e-a1be-dcd315582f3b.png" width="250" />
</p>

* **Watch Version of the App:** As part of our app's efforts to reduce the adverse effects of natural disasters, including the recent earthquake, we plan to incorporate a watch version of the app with additional features. This watch version includes an SOS button that can be used by individuals who may be trapped under debris after an earthquake.

<p align="center">
<img width="250"  src="https://user-images.githubusercontent.com/124795286/225680457-9f24ba3c-494b-4a5d-9ec0-bd829313ddfd.png">
<img width="250"  src="https://user-images.githubusercontent.com/124795286/225680538-a8e7c135-cefc-48e7-a9f0-a1daf7f9c7a1.png">
</p>

In order to pair the smart watch with the phone, it is necessary to open the login screen on the watch and the "add device" page on the phone. Then, if your device is already properly paired with your phone, your phone will be ready to send a "connection key". After sending the "connection key", refresh the login page that is open on the smartwatch. After all the requirements are met, they will all appear ticked. All that remains is to log in.

This system allows you to run the "Can You Hear Me" application on your smart device without being constantly dependent on your phone and to send a sos call in case of emergency.

<p align="center">
<img width="250"  src="https://user-images.githubusercontent.com/96688864/226194667-324b02fa-2667-47d9-a7ac-e9d6390378c3.gif">
<img width="250"  src="https://user-images.githubusercontent.com/96688864/226194679-5b385789-39af-44ee-ad46-80be9eeab0d1.gif">
</p>

* **Explore Page:** Our app features an "Explore" page that provides users with crucial information regarding earthquakes. This page serves as a platform for users to easily access educational resources on earthquake preparedness and response, as well as learn more about the nature of earthquakes themselves.

<p align="center">
<img width="250"  src="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/assets/96688864/10f9f2c9-890f-45d6-8c1e-0877957cc798.png">
<img width="250"  src="https://user-images.githubusercontent.com/124795286/225629135-dcd8ffdc-0a74-4690-a251-244620e8b9d9.png">
</p>

# Structure

<img align="left" src="https://user-images.githubusercontent.com/96688864/227571519-6c977e0d-b92d-4d29-b1f2-84f33fa2f5b2.png" width="344" height="182" />

Since, our app is a **cross platform app**, which is written with Flutter. Each platform does not require a separate application for itself. We can run the same code on Android/~~IOS~~ phones and WatchOS smart watches. The app firstly checks whether the device is a phone or a smart watch by comparing the height of the screen of the current device and then, directs to it's required artifacts. Thanks to Flutter, this feature helps us to create solutions for current problems, to develop an app for all platforms in a short time with less effort, and helps us to increase our efficiency.

> **Note**
> <details>
> <summary> Permissions </summary>
> Our app will ask you for permission as it needs location and camera access. However, please always enable location and camera permissions for the application to avoid any problems and for the application to work properly.
> <img align="center" src="https://user-images.githubusercontent.com/96688864/227787718-75a88872-bc10-4ada-b052-1e4e7bb8dc1b.png" width="344" height="145"/>
> </details> 
 
 
> **Note**
> <details>
> <summary> Minor Bugs </summary>
> Be confident while running our source code on your machine, if you are dealing with any bug, it might be a minor stuff, just keep running the code. If you don't have any issues with version embeding about flutter, you are able to analyze our project easly.
> </details>

# How To Run/Test The App?

## Download APK

[DOWNLOAD LINK](https://drive.google.com/uc?export=download&id=12sJsdhsoWxTHxO_xWD_g7l6LGmLv5rVw)

You can download our apk from link (recomended - new version) or from apk_app (previous version) folder in our repo. 
Please use **Android**.

## RUN

You can run the code directly in your emulator or edge device. 
Please make sure you are using **Android** 

# Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/AlperenOvak"><img src="https://avatars.githubusercontent.com/u/96688864?v=4?s=100" width="100px;" alt="Alperen OVAK"/><br /><sub><b>Alperen OVAK</b></sub></a><br /><a href="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/commits?author=AlperenOvak" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/mcantimurcan"><img src="https://avatars.githubusercontent.com/u/108149301?v=4?s=100" width="100px;" alt="Mithat Can Timurcan"/><br /><sub><b>Mithat Can Timurcan</b></sub></a><br /><a href="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/commits?author=mcantimurcan" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/shevsahin"><img src="https://avatars.githubusercontent.com/u/124795286?v=4?s=100" width="100px;" alt="shevsahin"/><br /><sub><b>shevsahin</b></sub></a><br /><a href="https://github.com/Google-Solution-Challenge-Metu/CanYouHearMe/commits?author=shevsahin" title="Design">💻</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
