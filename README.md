# ViewControllersContainer
This is the demo app which present the usage of childViewControllers.

## ChildViewControllerDemo Intro
The app consist of a view controller which contained two child table view controllers.
When user tapped cells in the left view controller, the amount of cells in the right view controllers will increase.
You can find the demo video below.
![](./ChildViewControllers.gif)

## Concept
**How to put multi-view controllers inside a UIView?**
   1. In the view controller, setup two container views in fixed position (left and right).
   2. Generate left and right view controllers, then set the left and right view controller as child view controller.
   3. Add left and right controller's view as subview.
   4. Setup constraint for subviews.   
   
**The proper way to communicate between the left view controller and the right view controller?**   
Since the rule is tap left controller will change the right controller's amount of cells. We will adopt `notification` and `delegate` patterns when the user tapped the left view controller, the left controller will post a notification. Then the right view controller registers self as an observer in `NotificationCenter` when the right view controller received the notification event, it will call its delegate (in this demo the delegate is left view controller) to retrieve the selected value.

## Data Transition
![](./DataTransition.png)
The reason that adopted this pattern is the `Notification` is a one way one to many communication but the `Delegate` is a one to one two way communication.
In this scenario is suitable to transition data between view controllers by these patterns.

## Author
[Wayne Hsiao](mailto:chronicqazxc@gmail.com)
