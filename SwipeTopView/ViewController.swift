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
        view.backgroundColor = .blue
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
    
    func swipeTopViewDidOpen(_ swipeTopView: SwipeTopView) {
        isShowSwipeTopView = true
        print("swipeTopViewDidOpen")
    }
    
    func swipeTopViewWillClose(_ swipeTopView: SwipeTopView) {
        print("swipeTopViewWillClose")
    }
    
    func swipeTopViewDidClose(_ swipeTopView: SwipeTopView) {
        isShowSwipeTopView = false
        print("swipeTopViewDidClose")
    }
    
    //MARK: SwipeTopViewDatasource
    func constantContainerSwipeTopView() -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0)
    }
    
    func containerSwipeTopView() -> UIView {
        return contentSwipeTopView
    }
    
    func heightContainerView() -> CGFloat {
        return 60
    }

}

