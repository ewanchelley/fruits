# Fruits

This app was developed for iOS using SwiftUI, and displays a list of fruits.

## Fruits List Screen

- Displays a list of fruits fetched from a remote JSON file, available here: http://bit.ly/1QW6CrK
- Pull down to refresh (reload fruits from the server).
- Tapping on a certain fruit will load the Fruit Info screen for that fruit.


## Fruit Info Screen

- Displays the price (in £) and the weight (in kg) of the selected fruit.

![image](https://github.com/user-attachments/assets/babc744e-db96-468f-9328-2f6c9a343a7e)
![image](https://github.com/user-attachments/assets/24ef62ca-a9d2-47b8-bc36-7c0b8208509d)


## Usage Statistics

- The app also collects usage statistics, by making GET requests to: http://bit.ly/1M9S7RY
- Usage stats are sent for network requests, screen display times, and errors.

**Load**: Measures the time taken for any network request.

**Display**: Measures the time taken from initiating a screen load request to the completion of loading the screen.

**Error**: Captures and sends error details whenever an error occurs.

### Example URLs:

**Load event**: https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/stats?event=load&data=100

**Display event**: https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/stats?event=display&data=3000

**Error event**: https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/stats?event=error&data=null%20pointer%20at%20line%205

## Requirements

**iOS**: 17.0+

**XCode**: 15.0+

## Installation

- Clone the Repository:

```
git clone https://github.com/ewanchelley/fruits.git
```

- Open in Xcode.
- Run the Application. Select your target device or simulator and click the run button in Xcode.

## Project Structure

**Model**: Contains data models and data source for the application.

**ViewModel**: Manages the app's data and business logic for the views.

**View**: Contains SwiftUI views for the user interface.

**Network**: Handles network requests and usage stats management.

**ErrorHandling**: Manages error handling and reporting.

## Testing
The application includes unit tests to ensure the correctness of the code and the proper handling of asynchronous operations. 
Tests can be found in the Tests folder and can be run using Xcode's test navigator.

## Commit messages
Commit messages are used to document the approach and changes made during the development process. They provide a clear history of the project's evolution and decision-making process.
