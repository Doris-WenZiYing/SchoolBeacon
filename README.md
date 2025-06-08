# SchoolBeacon


> An AR-powered campus navigation app for Feng Chia University freshmen.

## 🔗 Table of Contents

- [SchoolBeacon](#schoolbeacon)
  - [🔗 Table of Contents](#-table-of-contents)
  - [Overview](#overview)
  - [Features](#features)
  - [Role \& Contributions](#role--contributions)
  - [Architecture](#architecture)
  - [Tech Stack](#tech-stack)
  - [Setup](#setup)
  - [Usage](#usage)
  - [Testing](#testing)
  - [Roadmap](#roadmap)
  - [Contributing](#contributing)
  - [Contact](#contact)

## Overview

**SchoolBeacon** is a collaboration between ImaginaryLabs Inc. and Feng Chia University’s Tech Office. It leverages ARKit, CoreLocation, and MapKit to help freshman to understand the Feng Chia university campus in short time:

- Quickly **locate** lecture halls, offices, libraries, cafeterias, and more  
- **Explore** the campus in AR or classic 2D map mode  
- **Access** detailed info (hours, photos, contacts) via bottom sheets  

Since its September 2022 launch, SchoolBeacon has streamlined orientation and boosted campus engagement.

## Features

- **AR Landmark Visualization**  
  Geo-anchored beacons appear in your camera view as you walk the campus.

- **2D Map Mode**  
  A pinch-to-zoom MapKit interface for traditional navigation.

- **Interactive Detail Sheets**  
  Tap a beacon to view images, descriptions, hours, and contact info.

- **Offline Caching**  
  CoreData + JSON fallback ensures navigation without internet.

- **Analytics Dashboard**  
  Firebase Analytics tracks popular routes and user interactions.

## Role & Contributions

_As the president of iOS Club, I:_

- **Architected** a modular MVVM codebase separating AR, Map, and Data layers  
- **Extended** ARCL’s `LocationNode` into a custom `BeaconNode` with campus branding  
- **Optimized** rendering to sustain 60 fps on devices back to iPhone 8  
- **Built** offline caching (CoreData + JSON) to guarantee availability  
- **Collaborated** with university stakeholders and UX designers on content and accessibility  

## Architecture
```text
+----------------------+
|    SwiftUI Views     |
+----------+-----------+
           |
+----------+-----------+
|     ViewModels       |
+----------+-----------+
           |
+----------+-------------+
| ARService ↔ MapService |
+----------+-------------+
           |
+----------+-------------+
| CoreData + JSON Loader |
+------------------------+
````

* **ARService**: Manages ARKit sessions & `BeaconNode` lifecycles
* **MapService**: Wraps MapKit controls & search
* **Data Layer**: CoreData for persistence; JSON for static campus data


## Tech Stack

* **Language:** Swift 5.7
* **UI:** SwiftUI
* **AR:** ARKit + SceneKit + CoreLocation (ARCL)
* **Persistence:** CoreData
* **Analytics:** Firebase Analytics
* **Package Manager:** Swift Package Manager
* **CI/CD:** GitHub Actions

## Setup

1. **Clone** the repo

   ```bash
   git clone https://github.com/Doris-WenZiYing/SchoolBeacon.git
   cd SchoolBeacon
   ```
2. **Open** in Xcode 14.2+

   ```bash
   open SchoolBeacon.xcworkspace
   ```
3. **Install** dependencies via Swift Packages (File → Swift Packages → Update).
4. **Configure** API keys

   * Copy `Config.template.plist` → `Config.plist`
   * Fill in Google Maps, Firebase, etc.
5. **Deploy** to a real device (ARKit requires actual hardware).

## Usage

1. Grant **Camera** & **Location** permissions at launch.
2. Tap the **Map** tab for a 2D overview.
3. Switch to the **AR** tab to view beacons in your camera.
4. Walk toward landmarks — nodes will appear as you approach.
5. Tap a beacon to open its detail sheet.


## Testing

* **Unit Tests**:

  * `ARServiceTests`
  * `MapServiceTests`
  * `ViewModelTests`

* **Run** via Xcode or CLI:

  ```bash
  xcodebuild test \
    -scheme SchoolBeacon \
    -destination 'platform=iOS,name=iPhone 13'
  ```

## Roadmap

* **Live Campus Events**: Sync with real-time university calendar APIs
* **Multi-stop Routing**: Plan custom walking tours
* **Social Sharing**: Share favorite spots or AR snapshots

## Contributing

1. Fork the repo
2. `git checkout -b feature/YourFeature`
3. `git commit -m "Add YourFeature"`
4. `git push origin feature/YourFeature`
5. Open a pull request

## Contact

**Doris Wen** (Junior iOS Developer)
- ✉️ [doris070714@gmail.com](mailto:doris070714@gmail.com)
- Instagram: [dolores_dione](https://www.instagram.com/dolores_dione/)
- Feng Chia University Tech Office
