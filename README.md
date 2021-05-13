
<h1 align="center">Africa</h1>

<p align="center">
  <a href="https://opensource.org/licenses/Apache-2.0"><img alt="License" src="https://img.shields.io/badge/License-Apache%202.0-blue.svg"/></a>
  <a href="https://swift.org/"><img alt="Swift" src="https://img.shields.io/badge/swift-5.0-orange"/></a>
</p>

<p align="center">  
Africa is an XCode Project based on SwiftUI 2 to showcase the bio-diversity around Africa. In this application, users can see the Images, Map Locations and Videos of the animals. The application is compatible with iOS, iPad and macOS.
</p>
<p align="center">
This code is a follow-up on this course: <a href="https://www.udemy.com/course/swiftui-masterclass-course-ios-development-with-swift/">SwiftUI Master Class Course : iOS Development with Swift</a>
</p>
<br>

## Screens

<ul>
  <li>
    <b>Browse</b>
    <p align="start">
      <img alt="Browse" src="https://github.com/ritwikjamuar/Africa/blob/development/ScreenShots/Africa_SS_1.gif" width=200/>
    </p>
    <p>
      Shows the List of Animals found in Africa. There are 2 types of List rendered. One with a scrollable List showing a brief summary of Animal, and another which shows the List of Animals as Images in the Grid Fashion.
    </p>
  </li>
  <li>
    <b>Watch</b>
    <p align="start">
      <img alt="Watch" src="https://github.com/ritwikjamuar/Africa/blob/development/ScreenShots/Africa_SS_2.gif" width=200/>
    </p>
    <p>
      Shows the videos related to a particular animal, where user can see the Video in the player.
    </p>
  </li>
  <li>
    <b>Animal Details View</b>
    <p align="start">
      <img alt="Animal Details" src="https://github.com/ritwikjamuar/Africa/blob/development/ScreenShots/Africa_SS_3.gif" width=200/>
    </p>
    <p>
      Shows the detailed view of an Animal selected. In the detail, following information can be seen:
    <ul>
      <li>A Brief Summary</li>
      <li>Gallery Pictures</li>
      <li>Quick Facts about that Animal</li>
      <li>Full Summary</li>
      <li>A Link to `Locations` view</li>
      <li>A Link to open browser that opens Wikipedia Article in the Browser</li>
    </ul>
    </p>
  </li>
  <li>
    <b>Locations</b>
    <p align="start">
      <img alt="Locations" src="https://github.com/ritwikjamuar/Africa/blob/development/ScreenShots/Africa_SS_4.gif" width=200/>
    </p>
    <p>
      Shows a Map View with Custom Pointers denoting a particular Animal. These pointers point to the National Parks around Africa where the specific Animal is found.
    </p>
  </li>
  <li>
    <b>Gallery</b>
    <p align="start">
      <img alt="Gallery" src="https://github.com/ritwikjamuar/Africa/blob/development/ScreenShots/Africa_SS_5.gif" width=200/>
    </p>
    <p>
      Shows a Gallery View of the Photos of all the Animals.
    </p>
  </li>
</ul>

## Learnings

Following concepts came in handy when developing the UI:
- Swift Extension Functions.
- Loading a JSON File from Project Files.
- `TabView` to render multiple Items.
- `NavigationView` to navigate between different UIs.
- `EdgeInset` to override the default padding.
- `GroupBox` to encapsulate multiple views together.
- `ScrollView` to make the views and the screen scrollable.
- `Map` from `MapKit`, in conjunction with `MKCoordinateRegion`, `CLLocationCoordinate2D` and `MKCoordinateSpan` to render the Apple Maps.
- `MapAnnotation` to show a custom Marker/Pin in the `Map`.
- `@State` to store the values that triggers reloading of UI on it's change.
- `VideoPlayer` to play the Video from Project Files, in conjunction with `AVPlayer`
- `ToolbarItem` to add custom Items in the Toolbar.
- `UIImpactFeedbackGenerator` to generate Haptic Feedback.
- `GeometryReader` to read information about the display rendered in the device.
- `Animation` to add Animating Effects in the View.
- `LazyGrid` to show the Items in the Grid.
- `Slider` to show a Slider in the View.
- `Link` to trigger navigation to browser in the device to open the specified URL.
- `ViewModifier` to collate the common operation around the Views in a generic fashion.
- Adding support for macOS Deployment.

## Installation

This project requires the latest version of Xcode, which you can install from the [Mac App Store](https://itunes.apple.com/en/app/xcode/id497799835?mt=12).

To clone the Git repository to your local machine, including submodules:

```sh
git clone https://github.com/ritwikjamuar/Africa.git
```

# License
```xml
Designed and developed by 2021 ritwikjamuar (Ritwik Jamuar)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
