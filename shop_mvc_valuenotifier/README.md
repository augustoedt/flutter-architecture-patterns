# Shop App MVC Pattern with ValueNotifier + ValueListenableBuilder 

A very simple Flutter Shop App that implements the MVC pattern for study purpose.

InheritedWidget are needed to access controllers through dependency injection and value notifier as state manager. Its the most light reactivity management.
ValueNotifier allows control what you want your app to update, whenever or wherever the data changes.

## Content
- View: ShopView, CartView
- Controller: ShopController, CartController
- Model: Category, Product, CartItem

## State and Reactivity Management
- ValueNotifier + ValueListenableBuilder
