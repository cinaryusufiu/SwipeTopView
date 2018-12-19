//
//  ViewController.swift
//  SwipeTopView
//
//  Created by Yusuf Çınar on 19.12.2018.
//  Copyright © 2018 Yusuf Çınar. All rights reserved.
//

import UIKit

class ViewController: UIViewController , SwipeTopViewDataSource , SwipeTopViewDelegate {
   
    var isShowSwipeTopView : Bool = false
    
    let contentSwipeTopView : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        return view
    }()
    lazy var swipeTopView : SwipeTopView = {
        let view = SwipeTopView(frame: .zero, mainView: self.view)
        view.datasource = self
        view.delegate = self
        return view
    }()
    let openTopViewButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open Top View", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleOpenTopViewButton), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(openTopViewButton)
        
        openTopViewButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        openTopViewButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        openTopViewButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        openTopViewButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func handleOpenTopViewButton() {
        if isShowSwipeTopView == false {
            self.swipeTopView.openPageSwipeTopView()
        }
        else{
            self.swipeTopView.closePageSwipeTopView()
        }
    }
    
    //MARK: SwipeTopViewDelegate
    func swipeTopViewWillOpen(_ swipeTopView: SwipeTopView) {
        print("swipeTopViewWillOpen")
    }
    
    func swipeUpViewDidOpen(_ swipeTopView: SwipeTopView) {
        isShowSwipeTopView = true
        print("swipeUpViewDidOpen")
    }
    
    func swipeUpViewWillClose(_ swipeTopView: SwipeTopView) {
        print("swipeUpViewWillClose")
    }
    
    func swipeUpViewDidClose(_ swipeTopView: SwipeTopView) {
        isShowSwipeTopView = false
        print("swipeUpViewDidClose")
    }
    
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

}

