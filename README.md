# SwipeTopView


# SwipeTopViewDatasource

```sh

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

# SwipeTopViewDelegate

```sh
   
  //MARK: SwipeTopViewDelegate

    func swipeTopViewWillOpen(_ swipeTopView: SwipeTopView) {
        print("swipeTopViewWillOpen")
    }
    
    func swipeUpViewDidOpen(_ swipeTopView: SwipeTopView) {
        print("swipeUpViewDidOpen")
    }
    
    func swipeUpViewWillClose(_ swipeTopView: SwipeTopView) {
        print("swipeUpViewWillClose")
    }
    
    func swipeUpViewDidClose(_ swipeTopView: SwipeTopView) {
        print("swipeUpViewDidClose")
    }
    
```
