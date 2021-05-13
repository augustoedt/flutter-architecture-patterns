
# Shop App MVC Pattern

A very simple Flutter Shop App that implements the MVC pattern for study purpose.


Pure Dart+Flutter code, no packages, InheritedWidget as Dependency Injection and setState for reactivity control

## Content
- View: ShopView, CartView
- Controller: ShopController, CartController
- Model: Category, Product, Cart

## State/Reactivity Management
- InheritedWidget and setState()

I try to code the simplest, fast and easy understanding MVC implementation.
The problem os this project its the setState() reactivity control that rebuild all widgets on screen.
The ideal scenario its to rebuild only the Widgets that contains the changed data.
This can be made with extended ChangedModifier on Controllers or ValueNotifier
