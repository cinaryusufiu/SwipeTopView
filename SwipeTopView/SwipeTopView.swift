//
//  SwipeTopView.swift
//  SwipeTopView
//
//  Created by Yusuf Çınar on 19.12.2018.
//  Copyright © 2018 Yusuf Çınar. All rights reserved.
//

import Foundation
import UIKit


public class SwipeTopView: UIView {
    
    private var heightContentView : CGFloat?
    private var containerSwipeTopView : UIView? {
        didSet {
            setupContainerAddConstraintView()
        }
    }
    weak var delegate : SwipeTopViewDelegate?
    weak var datasource : SwipeTopViewDataSource?
    private weak var mainView : UIView?
   
    public init(frame: CGRect, mainView: UIView){
        super.init(frame: frame)
        self.mainView = mainView
    }
    fileprivate func startOrganizerView() {
        setupViewInit()
        setupView()
    }
    fileprivate func setupViewInit() {
        guard let datasource = self.datasource else { return  }
        guard let mainView = self.mainView else { return  }
        guard let window = UIApplication.shared.keyWindow else { return  }
        
        let heightContentView = datasource.heightContainerView() + window.safeAreaInsets.top
        self.heightContentView = heightContentView
        mainView.addSubview(self)
        setupAddConstraintView()
        
        containerSwipeTopView = datasource.containerSwipeTopView()
        
    }
    fileprivate func setupView() {
        setupAddConstraintView()
    }
    fileprivate func setupAddItemView(){
      
        guard let containerSwipeTopView = self.containerSwipeTopView else { return  }
        self.addSubview(containerSwipeTopView)
        
    }
    fileprivate func setupAddConstraintView(){
        guard let heightContentView = self.heightContentView else { return  }
        guard let mainView = self.mainView else { return  }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo:mainView.topAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: heightContentView + 10).isActive = true
        self.rightAnchor.constraint(equalTo: mainView.rightAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: mainView.leftAnchor).isActive = true
        
    }
    fileprivate func setupContainerAddConstraintView(){
        
        guard let datasource = self.datasource else { return  }
        guard let containerSwipeTopView = self.containerSwipeTopView else { return  }
        guard let window = UIApplication.shared.keyWindow else { return  }
        
        setupAddItemView()
        
        containerSwipeTopView.translatesAutoresizingMaskIntoConstraints = false
        
        containerSwipeTopView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -datasource.constantContainerSwipeTopView().bottom).isActive = true
        containerSwipeTopView.topAnchor.constraint(equalTo: self.topAnchor, constant: datasource.constantContainerSwipeTopView().top + window.safeAreaInsets.top + 10).isActive = true
        containerSwipeTopView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -datasource.constantContainerSwipeTopView().right).isActive = true
        containerSwipeTopView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant:datasource.constantContainerSwipeTopView().left).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func openPageSwipeTopView() {
       
        startOrganizerView()
        
        guard let heightContentView = self.heightContentView else { return  }
        guard let delegate = self.delegate else { return  }
        
        delegate.swipeTopViewWillOpen(self)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: heightContentView)
        }, completion: { (_) in
            delegate.swipeTopViewDidOpen(self)
        })
    }
    func closePageSwipeTopView() {
        
        guard let delegate = self.delegate else { return  }
    
        delegate.swipeTopViewWillClose(self)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.transform = .identity
        }, completion: { (_) in
            delegate.swipeTopViewDidClose(self)
            self.removeFromSuperview()
        })
    }
}

@objc public protocol SwipeTopViewDataSource : class {
    func heightContainerView() -> CGFloat
    func containerSwipeTopView() -> UIView
    func constantContainerSwipeTopView() -> UIEdgeInsets
}

@objc public protocol SwipeTopViewDelegate : class {
    func swipeTopViewWillOpen (_ swipeTopView : SwipeTopView)
    func swipeTopViewDidOpen (_ swipeTopView : SwipeTopView)
    func swipeTopViewWillClose (_ swipeTopView : SwipeTopView)
    func swipeTopViewDidClose (_ swipeTopView : SwipeTopView)
}
