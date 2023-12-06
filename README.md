# COESampleApp
This project will provide you the best practices to follow while using **MVVM** architecture.

## MVVM Project Structure and Organization:
Creating a well-organized folder structure is essential for maintaining a clean and scalable iOS app project.
A good folder structure can improve collaboration, code readability, and overall project management.

Below is the feauture wise recommeded folder structure of MVVM.

<img width="1440" alt="Project Structure" src="https://i.postimg.cc/g2R5HCps/Screenshot-2023-11-28-at-12-40-14-PM.png">

## Code Style and Formatting:
Good code style and formatting are essential practices in Swift (and any programming language) to improve code readability and maintainability. Properly formatted code helps you and other developers understand the code's logic and structure more easily. In Swift, you should follow the Swift style guide, which generally adheres to Apple's Swift API Design Guidelines. 

We have used `Swiftlint` to adhere on Swift coding standards and the all code rules define in `swiftlint.yml` file. Please check `LoginViewController.swift` or `LoginViewModel` to check code style and formatting.

## Networking:

Networking or API layer, is a critical component of iOS app development. It serves as an intermediary between your app and external services, such as web servers or APIs.
We have created a SwiftPackage for networking called `NetworkInterface` which is responsible for executing network calls. 

Please check the  `HomeRequest.swift` and `HomeService.swift` to get details about the usage of the `NetworkInterface` package.

## User Interface (UI):
Auto Layout and interface design guidelines in iOS with Swift are essential for creating visually pleasing and responsive user interfaces. Please check `HomeViewController.swift` `HomeProductCell` for User Interface design.

## Testing:
Testing is a crucial aspect of software development, including iOS development with Swift. It plays a key role in ensuring the reliability, functionality, and performance of your iOS applications.

Please check `COESampleAppTests\Auth` for recomended folder structure of Test target. 

#### Mock:
This folder should contains all mock files retaled to a featured.

#### ModelTests:
This folder should contains all model test classes retaled to a featured.

#### ViewModelTests:
This folder should contains all view model test classes retaled to a featured.

#### ServiceTests:
This folder should contains all service test classes retaled to a featured.

<img width="1440" alt="Folder Structure" src="https://i.postimg.cc/YjBH6V8m/Screenshot-2023-11-28-at-2-18-24-PM.png">



