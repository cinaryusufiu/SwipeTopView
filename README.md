# SwipeTopView


## SCREENSHOT

![SwipeTopView](https://github.com/cinaryusufiu/SwipeTopView/blob/master/SwipeTopView/2pcxw6.gif)  
![SwipeTopView2](https://github.com/cinaryusufiu/SwipeTopView/blob/master/SwipeTopView/2pcz7r.gif)

## Installation

SwipeTopView is available through [CocoaPods](https://cocoapods.org/). To install it, simply add the following line to your Podfile:

```sh
pod 'SwipeTopView'
```

### SwipeTopView

```swift

   let redView : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        return view
    }()
    
   lazy var swipeTopView: SwipeTopView = {
        let view = SwipeTopView(frame: .zero)
        view.backgroundColor = .blue
        view.delegate = self
        view.dataSource = self
        return view
    }()

   swipeTopView.openPageSwipeTopView()
   
   swipeTopView.closePageSwipeTopView()
   
```

### SwipeTopView Open-Close

```swift

   swipeTopView.openPageSwipeTopView()
   
   swipeTopView.closePageSwipeTopView()
   
```
## SwipeTopViewDatasource

```swift

    //MARK: SwipeTopViewDatasource

    func constantContainerSwipeTopView() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 2, right: 10)
    }
    
    func containerSwipeTopView() -> UIView {
        return contentSwipeTopView
    }
    
    func heightContainerView() -> CGFloat {
        return 100
    }


```

## SwipeTopViewDelegate

```swift
   
    //MARK: SwipeTopViewDelegate
 
    func swipeTopViewWillOpen(_ swipeTopView: SwipeTopView) {
        print("swipeTopViewWillOpen")
    }
    
    func swipeTopViewDidOpen(_ swipeTopView: SwipeTopView) {
        print("swipeTopViewDidOpen")
    }
    
    func swipeTopViewWillClose(_ swipeTopView: SwipeTopView) {
        print("swipeTopViewWillClose")
    }
    
    func swipeTopViewDidClose(_ swipeTopView: SwipeTopView) {
        print("swipeTopViewDidClose")
    }
    
```
	 
## Authors

* **Yusuf Çınar** - [https://github.com/cinaryusufiu](https://github.com/cinaryusufiu)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

