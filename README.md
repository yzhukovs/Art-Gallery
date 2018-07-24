# Art Gallery

A student that completes this project shows that they can:

- understand and explain what a protocol is and common scenarios for their use
- define a custom protocol, and make a class or struct conform to it
- understand and explain the purpose of UITableViewController
- use a regular UIViewController to display a UITableView
- create a custom UITableViewCell
- understand and explain the delegate pattern and why it is used

## Introduction

Art Gallery is an app that shows images of paintings and allows them to like a painting if they choose. Here is an example of the finished application:

![](https://user-images.githubusercontent.com/16965587/43025789-56c5fa24-8c30-11e8-999e-abec67fcad88.gif) 

## Instructions

Please fork and clone this repository. The starter project has paintings pre-added to the assets folder for you.

## Part One - Model Types and Model Controller

#### Painting Model

You will a single model object for this project. It should represent a single painting, with an image and a value that indicates whether the user has liked it or not.

1. Create a new Swift file called `Painting.swift`
2. In the new file, create a class `Painting`
3. Add a constant called `image` of type `UIImage`. You will need to import UIKit in order for Xcode to not throw errors.
4. Add a variable called `isLiked`.
5. Create a memberwise initializer for this class, and consider giving the `isLiked` property a default value.

#### PaintingController

This model controller is relatively straightforward. What you need to do is have a data source for the table view, a function that will load the paintings into the data source, and a function to toggle a painting `isLiked` property.

1. Create a new Swift file called "PaintingControler.swift"
2. Add a variable called `paintings` of type `[Painting]` and give it an initial value of an empty array
3. There are 12 images in the assets folder. Make a function called `loadPaintingsFromAssets()`. The goal of this method is to take the 12 images from your assets folder and initialize a `Painting` with each of them, as you need a `UIImage` to use the  `Painting` initializer.
    - Create a for-in loop that loops 12 times using a range of numbers. (`1...12`).
    - In each iteration of the loop, create a string that will match the name of the images in the assets folder. ("Image" plus the number you have from the range in this iteration of the loop).
    - Using this string, you can use the `UIImage(named: String)` initializer to get the image (You will have to import `UIKit` in this file as well). It will look in the assets folder for the image matching the string you give it. Be aware that this initializer will return you a `UIImage?`, so handle the optional accordingly.
    - Initialize a new painting object with the image you just got, and append it to the `paintings` variable.
    - In the initializer of this `PaintingController`, call this function. 

4. The last method you need to add to this model controller is one that toggles the value of a `Painting`'s `isLiked` property from true to false, and vice-versa. This will be called when the user taps on the button to like/unlike a painting. Call the function `toggleIsLiked(for painting: Painting)`.

## Part Two - Storyboards, Views, and View Controllers.

#### Storyboard Set Up

You're first going to layout the views in the Main.storyboard. If it helps you, refer to the screen recording gif above to get an idea of what the layout should end up looking like.

1. In the Main.storyboard, lay out a `UIViewController` scene embedded in a `UINavigationController`.
2. Give the view controller the title "Art Gallery" on its navigation item.
3. Add a `UITableView` that fills the whole view controller.
4. Create a custom `UITableViewCell` that has a `UIImageView` to display the painting, as well as a `UIButton` that will serve to like or unlike the painting. 
   - Note: Make sure to give your cell a reuse identifier!

#### PaintingTableViewCell

Now let's set up the custom cell. This cell needs to show the image of a `Painting` object, and the button needs to display whether it's been liked or not, and like/unlike it when tapped.

1. Create a new Cocoa Touch Subclass of `UITableViewCell`. Call it `PaintingTableViewCell`
2. Delete everything inside of the class, you won't need it. This will help keep your code clean.
3. In the Main.storyboard, set the custom cell's class to `PaintingTableViewCell`. This will allow you to make outlets.
4. Create an outlet from the image view and the button, as well as an action for the button.
5. The view controller is going to pass a `Painting` object to the cell in order for the cell to know what information to display (like the image and what the button's title should be). Create a `painting` variable that holds a `Painting?`.
6. Create a function called `updateViews()`. This function should unwrap the `painting` variable, and put its image in the image view, and set the button's title according to whether the painting is liked or not.
7. Add a didSet property observer to the `painting` variable, and call `updateViews()` in it.

#### PaintingListViewController

The last file you need to make is for the view controller.

1. Create a new Cocoa Touch Subclass of `UIViewController`. Call it `PaintingListViewController`. Even though you have a table view in it, it is still a view controller. Delete any unneeded code.
2. In the Main.storyboard, you will need to set the view controller scene's class to be `PaintingListViewController`.
3. Create an outlet from the table view.
4. Add a constant called `PaintingController` and set its value to a new instance of `PaintingController`.
5. As you're using a table view in a view controller, you will also need to set the tableView's `dataSource` property to be the view controller. Do this in the `viewDidLoad()`
6. Adopt and conform to the `UITableViewDataSource`. The number of rows the table view should have is the amount of paintings the `paintingController` property has.
    - In the `cellForRowAt`, you will need to cast the cell as a `PaintingTableViewCell`.
    - Get a `Painting` object from the `paintingController`'s array of paintings using the indexPath parameter of the function.
    - Pass the `Painting` object to the cell, then return the cell

At this point, everything should be working except for the button toggling the `isLiked`. Run the application to make sure your table view loads and the custom cells display the image.

## Part Three - Adding the custom delegate

#### PaintingTableViewCellDelegate

Going back to the custom cell, you need to create a protocol that will allow the cell to delegate toggling the `isLiked` property of its painting to the view controller when the user taps the button.

1. Create a protocol called `PaintingTableViewCellDelegate`. This should be a class protocol.
2. It should have a single function called `likeButtonWasTapped(on cell: PaintingTableViewCell)`.
3. Add a `weak var delegate: PaintingTableViewCellDelegate?` property to the custom cell
4. Call `likeButtonWasTapped` in the `IBAction` of the button. Pass the cell into the function. (Hint: `delegate.likeButtonWasTapped(on: self)`

The cell should be all set up at this point. you need to do a few final things in the `PaintingListViewController` to complete this delegate relationship.

1. In the `PaintingListViewController`, adopt the `PaintingTableViewCellDelegate` protocol.
2. To conform to the protocol, you will need to add the `likedButtonWasTapped(on: ...)` function. The goal of this function is to toggle the `isLiked` property of the painting that was tapped on. Inside of the function, do the following:
     - In order to accomplish this, you will need to get the `IndexPath` of the cell parameter. (Hint: `tableView.indexPath(for: UITableViewCell)`
     - Create a constant for the painting that the user just liked/unliked. You may get the `Painting` by either using the cell parameter's `painting` property or using the `IndexPath` you just got and using it with the view controller's `paintingController`'s array of paintings.
     - Call the `paintingController`'s `toggleIsLiked(for: Painting`) function.
     - At this point, the painting has been successfully been liked or unliked. However, that change won't be displayed to the user on the cell. You'll need to reload the cell so that it will re-call the `updateViews()` function and set the button's text according to the new `isLiked` value of the painting. Do this by calling `tableView.reloadRows(at: [IndexPath], with: UITableViewRowAnimation)`. Pass in the `IndexPath` you got, and choose an animation enum case. Feel free to see how different cases change way the cell gets reloaded.
3. The key thing that cannot be forgotten is to let the cell know that the view controller is going to be its delegate. Do this in the `cellForRowAt` function. (Hint: `cell.delegate = self`)

**The app should be completely functional at this point. However, you may run into problems with being able to push the button later if it is too small. If this happens, you may need to make the button's height at least 40 points.**

## Go Farther

- Add a new view controller that will be modally presented when tapping on a cell. It should a fullscreen view of the image. (Make sure you add a way to get back to the `PaintingListViewController`, as it is modally presented.
- Make the cells dynamically resize according to the image's height. 
