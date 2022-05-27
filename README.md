# StargazersViewer

Flutter application for retrieve the stargazers of a Github repository.

[Download Apk](docs/app.apk)

![](docs/app.gif)

During development I followed the approach of the Clean Architecture

> ####  Why?
> Because Clean Architecture is the most powerful solutions for building clean apps that multiple teams can work on, independent data layers, scalable for adding/removing features, testable, independent frameworks/tools, and can be easily maintained at any time.

# Architecture

The source code is separate into three layers:

- Presentation
- Business Logic
- Data
    - Repository
    - Data Provider

## Data Layer

> The data layer's responsibility is to retrieve/manipulate data from one or more sources.

The data layer can be split into two parts:

- Repository
- Data Provider

This layer is the lowest level of the application and interacts with databases, network requests,
and other asynchronous data sources.

### Data Provider

> The data provider's responsibility is to provide raw data. The data provider should be generic and versatile.

The data provider will usually expose simple APIs to perform operations. Most of the time is a
library shared and imported into the project. It can be multiple data provider in a project, es. one
for fetch the data from the network and one from the database. The goal is to make simple and usable
as possible.

### Repository

> The repository layer is a wrapper around one or more data providers with which the Business Logic Layer communicates.

The repository layer can interact with multiple data providers and perform transformations on the
data before handing the result to the business logic Layer.

## Business Logic Layer

> The business logic layer's responsibility is to respond to input from the presentation layer with new states. This layer can depend on one or more repositories to retrieve data needed to build up the application state.

Think of the business logic layer as the bridge between the user interface (presentation layer) and
the data layer. The business logic layer is notified of events/actions from the presentation layer
and then communicates with repository in order to build a new state for the presentation layer to
consume.

## Presentation Layer

> The presentation layer's responsibility is to figure out how to render itself based on one or more business logic states. In addition, it should handle user input and application lifecycle events.

The application flows will start with a `AppStart` event which triggers the application to fetch
some data to present to the user. In addition, the presentation layer will have to figure out what
to render on the screen based on the state from the business logic layer.

## App Dependency

This app used

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) make it easy to implement the BLoC (Business
  Logic Component) design pattern. Built to be used with the bloc state management package.
- [flow_builder](https://pub.dev/packages/flow_builder) which simplifies flows with a flexible,
  declarative API.
- [url_launcher](https://pub.dev/packages/url_launcher) for launching a URL. Supports web, phone,
  SMS, and email schemes.
- [retrofit](https://pub.dev/packages/retrofit) for network call.
- [json_serializable](https://pub.dev/packages/json_serializable) for automatically generate code
  for converting to and from JSON by annotation.
- [equatable](https://pub.dev/packages/equatable) for helps to implement value based equality
  without needing to explicitly override == and hashCode.
- [tuple](https://pub.dev/packages/tuple) tuple data structure


