# CycleControl Mobile App

CycleControl is a mobile application developed using Flutter and Dart, with Firebase as the backend database. It is designed to provide employees with immediate access to data insights from their mobile devices, offering convenience and ease of use.

## Introduction
CycleControl mobile app allows users, particularly employees, to view real-time data insights about the business operations. The app provides visual representations of data such as income overview, average wash cycles, and average dry cycles.

## Features
- View data insights and visualizations of machine operational costs and cycles.
- Real-time data retrieval from Firebase Firestore.
- Bar charts displaying average wash and dry cycles over a three-month period.
- Easy access to important metrics for informed decision-making.

## Mobile UI/UX
The mobile application interface is divided into the following frames:
1. **Splash Screen**: The initial screen that appears when the app is launched.
2. **Login Screen**: Allows users to log in with admin credentials.
3. **Homepage**: Displays data visualizations such as bar graphs for average wash and dry cycles and income overview.
4. **Login Failed Pop-up**: A pop-up displayed when login fails due to incorrect credentials.

## Installation
To set up the CycleControl mobile app on your local machine, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/cyclecontrol.git
    cd cyclecontrol
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Run the app**:
    ```bash
    flutter run
    ```

## Usage
After installing the app, use the following instructions to navigate through it:

1. **Splash Screen**: Wait for the splash screen to load.
2. **Login Screen**: Enter the admin credentials to access the homepage.
3. **Homepage**: View data insights such as income overview, average wash cycles, and average dry cycles. The data is retrieved in real-time from Firebase Firestore.
