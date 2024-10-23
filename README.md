# Articles

#  Architecture Used -> MVVM

This project demonstrates the implementation of the **MVVM (Model-View-ViewModel)** architecture in a Swift application. The project is structured to showcase clean, modular, and testable code using the MVVM design pattern.

## Table of Contents

- [Introduction](#introduction)
- [Technologies Used](#technologies-used)
- [Architecture Overview](#architecture-overview)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Features](#features)
- [Testing](#testing)

## Introduction

This project is a NY Times Articles Viewer built in Swift, using the MVVM architecture. It fetches and displays a list of the latest articles from The New York Times using their public API. The app provides a simple and intuitive interface for users to browse trending articles and see details of individual articles.

## Technologies Used
  **Swift**: The programming language used to build the app. 
  
  **SwiftUI**: For building a declarative, dynamic user interface.  
  
  **Combine**: For handling asynchronous events and API calls.  
  
  **NY Times API**: The backend service providing the latest articles.  
  

## Architecture Overview

MVVM (Model-View-ViewModel) is an architectural pattern that facilitates a clear separation of concerns between the UI and business logic, making the app easier to test and maintain. The ViewModel acts as a bridge between the Model and View, allowing the Model to stay UI-independent.
The **MVVM** pattern is split into three main components:

- **Model**: The data and business logic of the app, typically representing real-world objects or server responses.
  
- **View**: The SwiftUI views that define the UI. The `View` subscribes to updates from the `ViewModel`.

- **ViewModel**: The intermediary between the `Model` and the `View`. It contains presentation logic and transforms the model data to a format that the view can display.

```plaintext

┌────────────┐       ┌──────────────┐       ┌───────────┐
│   Model    │──────▶│  ViewModel   │──────▶│   View    │
└────────────┘       └──────────────┘       └───────────┘

```


## Project Structure
The project is organized in the following way:

```plaintext

├── Models/                             # Data structures
│   └── ArticleListResponse.swift       # Example model for ArticleList data
│
├── ViewModels/                         # ViewModel logic for each screen/view
│   └── ArticleListViewVM.swift
│
├── Views/                              # SwiftUI Views
│   └── ArticleListView.swift
│
├── Services/                           # Networking and other services
│   └── ArticleListViewService.swift
│
├── Endpoint/                           # API hiiting related details
│   └── ArticleListViewModelTest.swift
│
└── Tests/
    └── ArticleListViewModelTest        # Unit tests for ViewModels and services

```


## Requirements

iOS 14.0+  
Swift 5.0+  
Xcode 12.0+ or later

## Features

MVVM Architecture: A clear separation of concerns to create testable and maintainable code.
SwiftUI Views: Utilizes SwiftUI for building declarative, reactive UI.
Combine Framework: Leverages Combine for reactive data binding and handling asynchronous events.
Mockable Services: Easily mock the service layer for unit testing.


## Testing
This project includes unit tests for the ViewModel. The XCTest framework is used to test the business logic in the ViewModel.

You can run the tests in Xcode:

    1. Select the project scheme.
    2. Press Cmd + U to run all tests.
