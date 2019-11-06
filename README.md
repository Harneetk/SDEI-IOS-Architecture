![smartData: Scaling Expectations in Swift](https://www.smartdatainc.com/wp-content/uploads/2018/09/logo.png)
# iOSArchitecture_MVVM

This repository contains a sample app that implements MVVM architecture with Swift 4.2 t kick start iOS project at smart Data.

## Architecture Defines Targets for:
        - iOSArchitecture_MVVM
        - iOSArchitecture_MVVMTests
        - iOSArchitecture_MVVMUITests

To focus upon the main target i.e. iOSArchitecture_MVVM and to kick start we offer basic functionality of UserLogin which exists in approximately all the applications. 

## Folder Structure :
Architecture is following MVVM pattern using Swift Language with version 4.2 and folder structure defined for this is:

### Controllers:
#####  That contains all the controllers that manages context between ModalView & View. To kick start controllers contained in folder
            - BaseViewControler -> Base of every controller inherited from UIViewController. It is required so that if any change is required in all the screens of application then code for that can be written in base so impelementation can be done around the app.
            - LoginViewController -> Login View that is defined first and is the landing page when application opens. It is inherited from BaseViewController.
            - HomeViewController -> After Login where user lands is Home and it is also inherited from BaseViewController.

### Models :
#####   All the modals and information in modal form can be saved in modal classes will be defined here. Currently contains:
            - User -> This is example of modal that is created after user login to modal the user information.
            - Listing -> This is example of modal that is created to display listing in HomeViewController.

### Views : 
#####  All the custom views that are required in app shall come under this. It doesnot contain any file but contributes to the architecture.

### Libraries: 
#####  Any external libraries that work as plug and play or libraries that does not contribute to Pods or Carthage shall come under this folder. Currently does not contain anything.

### Applications : 
#####  AppDelegate class is singleton class defining application instance and window of application. This folder contains AppDelegate and Bridging Header.
            - AppDelegate -> Defining window and application instance.
           
### Network : 
#####  Contains the classes that communicates with external servers using the network and all network related information: Currently contains:
            - APIService -> Contains all methods for hitting and external API for server communication. 
            - UserService -> Example how to hit API for login and essential for KickStart.
  
### Helpers: 
#####  Any class that does not belong to Controller, Modal or View but is helpful to ease the code and save redundancy shall come under this folder. Example for this is color schemes classes of app, AppContants, UserDefaults, Shared Singeltons, StringsContants, Identifiers. Currently contains:
            - Constant -> Contributes to Configurations and Identifiers as example. 
            - ApiConstant -> Contributes to all keys and url related to server communication

### Stores: 
#####  Store the data in application. Contains:
            - AppInstance -> Stores the data for application lifecycle so that the information that is required during application lifecycle can directly be fetched from here.
          
            
### Extensions : 
#####  Extensions are that helps to develop custom methods that are very frequently used in the applications like String Modifications, Alerts, Bundles. Contains: 
            - String+Extension -> Methods to modify string like clipping, range, shift, email validation, phonenumber validation etc.
            - UIAlertController -> To show alerts in application.     
            - UIApplication -> Extension of our application instance.
            - Bundle -> Information of our application like version number, identifier, build number.
            - UICOlor+Hex -> To generate UIColor instance from HEX value.
            
### Main.storyboard : 
#####  Storyboard is used to draw UI for viewcontrollers.

Below are points which are handled within this sample app.

1. Basic flow to handle app navigation
2. Communicate with web server using **REST** api
3. **NSURLSession** to call web services
4. **Codable protocol** to parse JSON response and generate model class with help of **Generics**

### Version 1.1

### Protocol Oriented approach :
##### Protocol oriented approach is to be followed for service classes for initiating the unit tests, as it allows to implement the injection dependency, so that mocking be performed in unit tests.
- UserServiceProtocol - This Protocol is being made to be implemented by the actual service class and mocked service class for testing. LoginViewModel can accept the network service object of type UserServiceProtocol to perform constructor dependency injection.

### Unit Test cases :
#####   All the unit tests classes are contained in iOSArchitecture_MVVMTests Bundle:
- LoginViewModelTests - It contains the unit tests for the validation and login api. Unit test classes are being made for all the controllers to test the logics being applied.

##### Mocks - Mocks contains the mocking classes being made to separate the tests for network classes and other controllers and apply the concept of modularity.
- UserServiceMock - This class is being made as a mock/fake class for UserService using the UserServiceProtocol, so that asynchronous calls can be faked to test the actual logic.

### UI Test cases :
#####  UI test classes are being made for testing the UI as the actual user tests it.
- LoginViewControllerUITest - This class contains the example UI test for the LoginViewController. In the same way, different UI test classes can be made to test different controllers.

### Codable Models :
##### Codable models are being made for the encoding and decoding of json.
- User - User model is made to parse and use the user data received when the user logs in or sign up. This is an example, so more fields can be added based upon your requirements.


